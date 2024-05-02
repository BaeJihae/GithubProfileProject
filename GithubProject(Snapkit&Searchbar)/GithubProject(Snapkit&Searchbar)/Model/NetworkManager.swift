//
//  NetworkManager.swift
//  GithubProject(Snapkit&Searchbar)
//
//  Created by 배지해 on 5/1/24.
//

import Foundation
import Alamofire

final class NetworkManager {
    let url = "https://api.github.com/users/"
    
    /* URLSession을 통한 네트워크 통신
    // 유저 프로필
    func fetchUserProfile(userName: String, completion: @escaping (Result<GithubUser, Error>) -> Void) {
        guard let url = URL(string: url+"\(userName)") else {
            completion(.failure(NSError(domain: "URL 변환 실패", code: 401)))
            return
        }
        
        var request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let safeData = data else {
                completion(.failure(NSError(domain: "data가 존재하지 않음", code: 402)))
                return
            }
            
            do {
                let user = try JSONDecoder().decode(GithubUser.self, from: safeData)
                completion(.success(user))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    // 레포지토리
    func fetchUserRepository(userName: String, page: Int, completion: @escaping (Result<[GitRepository], Error>) -> Void) {
        guard let url = URL(string: url+"\(userName)?page=\(page)") else {
            completion(.failure(NSError.self as! Error))
            return
        }
        
        var request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let safeData = data else {
                completion(.failure(NSError.self as! Error))
                return
            }
            
            do {
                let user = try JSONDecoder().decode([GitRepository].self, from: safeData)
                completion(.success(user))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
    */
    
    // 유저 프로필
    func fetchUserRepository(userName: String, completion: @escaping (Result<GithubUser, Error>) -> Void) {
        let url = url + "\(userName)"
        
        AF.request(url).responseDecodable(of: GithubUser.self) { response in
            switch response.result {
            case .success(let user):
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // 레포지토리
    func fetchUserRepository(userName: String, page: Int, completion: @escaping (Result<[GitRepository], Error>) -> Void) {
        let url = url + "\(userName)?page=\(page)"
        
        AF.request(url).responseDecodable(of: [GitRepository].self) { response in
            switch response.result {
            case .success(let repositories):
                completion(.success(repositories))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
