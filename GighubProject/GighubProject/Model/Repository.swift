//
//  Repository.swift
//  GighubProject
//
//  Created by 배지해 on 4/10/24.
//

import Foundation

struct Repository: Codable {
    
    let name: String
    let stargazersCount: Int
    let language: Language?
    
    enum CodingKeys: String, CodingKey {
        case name
        case stargazersCount = "stargazers_count"
        case language
    }
}

enum Language: String, Codable {
    case kotlin = "Kotlin"
    case python = "Python"
    case swift = "Swift"
}
