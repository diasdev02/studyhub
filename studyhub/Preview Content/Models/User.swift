//
//  User.swift
//  studyhub
//
//  Created by Dias Akyshev on 15.11.2024.
//

import Foundation

struct User: Codable, Identifiable {
    var id = UUID()
    let firstName : String
    let lastName: String
    let image: String
    let username: String
    let email: String
    let phoneNumber: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "Name"
        case lastName = "Surname"
        case phoneNumber = "phoneNumber"
        case image = "image"
        case username = "username"
        case email = "email"
    }U
}
