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
    let id: Int
    let avatarURL: String
    let followers, following: Int
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case followers, following
    }
}
