//
//  File.swift
//  
//
//  Created by Ahmad Qureshi on 28/02/23.
//

import Foundation
public struct UpdateProfileRequest: Codable {
    let firstName, lastName, email, phone: String?
    let preferences: Preferences?
    let city, country: String?
    let notificationSettings: NotificationSettings?
    public init(firstName: String?, lastName: String?, email: String?, phone: String?, preferences: Preferences?, city: String?, country: String?, notificationSettings: NotificationSettings?) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.preferences = preferences
        self.city = city
        self.country = country
        self.notificationSettings = notificationSettings
    }
    
    public func getRequestJson() -> [String: Any] {
        var json: [String: Any] = [:]
        if let firstName = firstName, !firstName.isEmpty {
            json["firstName"] = firstName
        }
        if let lastName = lastName, !lastName.isEmpty {
            json["lastName"] = lastName
        }
        if let email = email, !email.isEmpty {
            json["email"] = email
        }
        if let phone = phone, !phone.isEmpty {
            json["phone"] = phone
        }
        if let preferences = preferences, let data = convertToJSONString(preferences) {
            json["preferences"] = data
        }
        if let city = city, !city.isEmpty {
            json["city"] = city
        }
        if let country = country, !country.isEmpty {
            json["country"] = country
        }
        if let notificationSettings = notificationSettings, let data = convertToJSONString(notificationSettings) {
            json["notificationSettings"] = data
        }
        return json
    }
    
    func convertToJSONString<T: Encodable>(_ object: T) -> [String: Any]? {
        do {
            let jsonData = try JSONEncoder().encode(object)
            if let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                return jsonObject
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
        return nil
    }
}
