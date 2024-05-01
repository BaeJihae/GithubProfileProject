//
//  User.swift
//  GighubProject
//
//  Created by 배지해 on 4/15/24.
//

import Foundation

// MARK: - User
struct User: Codable {
    let login: String
    let avatarURL: String
    let name: String
    let followers, following: Int
    let location: String?

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        case name
        case followers, following
        case location
    }
}
