//
//  GitRepository.swift
//  GithubProject(Snapkit&Searchbar)
//
//  Created by 배지해 on 5/1/24.
//

import Foundation

struct GitRepository: Decodable {
    var name: String
    var stargazersCount: Int
    var language: String
    
    enum GitRepository: String, CodingKey {
        case name, language
        case stargazersCount = "stargazers_count"
    }
}
