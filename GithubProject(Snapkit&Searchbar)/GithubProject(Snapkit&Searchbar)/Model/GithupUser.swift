//
//  githupUser.swift
//  GithubProject(Snapkit&Searchbar)
//
//  Created by 배지해 on 5/1/24.
//

import Foundation

// MARK: - GithubUser
struct GithubUser: Codable {
    let login: String
    let name: String
    let avatarURL: String
    let followers, following: Int
    
    enum CodingKeys: String, CodingKey {
        case login
        case name
        case avatarURL = "avatar_url"
        case followers, following
    }
}
