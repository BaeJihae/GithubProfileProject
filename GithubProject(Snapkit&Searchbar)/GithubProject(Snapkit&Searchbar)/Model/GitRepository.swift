//
//  GitRepository.swift
//  GithubProject(Snapkit&Searchbar)
//
//  Created by 배지해 on 5/1/24.
//

import Foundation

struct GitRepository: Codable {
    let name: String
    let stargazersCount: Int
    let language: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case stargazersCount = "stargazers_count"
        case language
    }
}
