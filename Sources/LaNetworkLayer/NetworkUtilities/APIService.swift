//
//  APIService.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 04/11/22.
//

import UIKit
import Alamofire
import SystemConfiguration

public typealias SuccessCompletionBlock<T> = ( _ response: T ) -> Void
public typealias ErrorFailureCompletionBlock = ( _ status: ResponseStatus ) -> Void

/// API request method used for all requests
struct APIService {
    static let shared = APIService()
    private init() {}
    func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let responseCacher = ResponseCacher(behavior: .modify { _, response in
            let userInfo = ["date": Date()]
            return CachedURLResponse(
                response: response.response,
                data: response.data,
                userInfo: userInfo,
                storagePolicy: .allowed)
        })
        configuration.timeoutIntervalForRequest = 30
        configuration.waitsForConnectivity = true
        return Session(configuration: configuration)
    }()
    
    func requestNew<T: Codable>(endpoint: Endpoint, successHandler: @escaping SuccessCompletionBlock<T>, failureHandler: @escaping ErrorFailureCompletionBlock) {
        if isConnectedToNetwork() {
            guard let url = URL(string: endpoint.path) else {
                failureHandler(.init(msg: "Error in request url"))
                return
            }
            let customRefreshRetrier: RequestRetrier & RequestAdapter = CustomRequestRetrier(endpoint: endpoint)
            let interceptor = Interceptor(adapter: customRefreshRetrier, retrier: customRefreshRetrier)
            sessionManager.request(url, method: endpoint.method, parameters: endpoint.parameters, encoding: endpoint.encoding, headers: endpoint.header, interceptor: interceptor, requestModifier: nil).validate(contentType: ["application/json"]).response(completionHandler: { (response) in
                if response.value?.isNotNil ?? false, let jsonDict = try? JSONSerialization.jsonObject(with: (response.value!)!, options: []), let jsonData = try? JSONSerialization.data(withJSONObject: jsonDict, options: .prettyPrinted) {
                    print(String(decoding: jsonData, as: UTF8.self))
                }
                switch response.result {
                case .failure(let error):
                    let errorMessage = error.localizedDescription
                    failureHandler(.init(msg: errorMessage))
                    return
                case .success:
                    handleSuccessNew(response: response, successHandler: successHandler, failureHandler: failureHandler)
                }
            })
        }
    }
    
    /// Parses response to the generic requested type
    private func handleSuccessNew<T: Codable>(response: AFDataResponse<Data?>, successHandler: @escaping SuccessCompletionBlock<T>, failureHandler: @escaping ErrorFailureCompletionBlock) {
        let successRange = 200...299
        if let value = response.data, let statusCode = response.response?.statusCode {
            do {
                if successRange.contains(statusCode) {
                    let decodableObject = try JSONDecoder().decode(T.self, from: value)
                    successHandler(decodableObject)
                } else {
                    let decodableObject = try JSONDecoder().decode(ErrorDataResponse.self, from: value)
                    if statusCode >= 500 {
                        failureHandler(.init(code: decodableObject.code.orEmpty, msg: "Internal server error", errorObject: nil))
                        return
                    }
                    let errorField = decodableObject.errors?.first
                    let message = errorField?.message
                    failureHandler(.init(code: decodableObject.code.orEmpty, msg: message.orEmpty, errorObject: nil))
                }
            } catch let errorCaught {
                failureHandler(.init(msg: errorCaught.localizedDescription, errorObject: errorCaught as? DecodingError))
            }
        } else if let statusCode = response.response?.statusCode, response.data.isNil, successRange.contains(statusCode) {
            do {
                let responseData = ["statusCode" : statusCode]
                let data = try JSONEncoder().encode(responseData)
                let decodableObject = try JSONDecoder().decode(T.self, from: data)
                successHandler(decodableObject)
            } catch let errorCaught {
                failureHandler(.init(msg: errorCaught.localizedDescription, errorObject: errorCaught as? DecodingError))
            }
        }
        else {
            failureHandler(.init(msg: "Unable to get body data"))
        }
    }
    func downloadFile(with url: URL, progressBlock: ((_ progress: CGFloat) -> Void)?, completion: ((_ url: URL?, _ error: Error?) -> Void)?) {
        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory, in: .userDomainMask, options: .removePreviousFile)
        AF.download(
            url,
            method: .get,
            encoding: JSONEncoding.default,
            headers: nil,
            to: destination).downloadProgress(closure: { (progress) in
                // progress closure
                // print("download", progress)
                progressBlock?(CGFloat(progress.fractionCompleted))
            }).response(completionHandler: { (defaultDownloadResponse) in
                // here you able to access the DefaultDownloadResponse
                // result closure
                completion?(defaultDownloadResponse.fileURL, defaultDownloadResponse.error)
                //                print("url is ",defaultDownloadResponse.fileURL)
            })
    }
    func uploadFile<T: Codable>(image: UIImage ,endpoint: Endpoint, successHandler: @escaping SuccessCompletionBlock<T>, failureHandler: @escaping ErrorFailureCompletionBlock) {
        AF.upload(multipartFormData: { multipartFormData in
            guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
            multipartFormData.append(imageData, withName: "file", fileName: "file.jpeg", mimeType: "image/jpeg")
        }, to: endpoint.path,method: endpoint.method, headers: endpoint.header).response { response in
            switch response.result {
            case .failure(let error):
                let errorMessage = error.localizedDescription
                failureHandler(.init(msg: errorMessage))
                return
            case .success:
                handleSuccessNew(response: response, successHandler: successHandler, failureHandler: failureHandler)
            }
        }
    }
}

extension FileManager {
    func clearTmpDirectory() {
        do {
            let tmpDirectory = try contentsOfDirectory(atPath: NSTemporaryDirectory())
            try tmpDirectory.forEach {[unowned self] file in
                let path = String.init(format: "%@%@", NSTemporaryDirectory(), file)
                try self.removeItem(atPath: path)
            }
        } catch {
            // print(error)
        }
    }
}
