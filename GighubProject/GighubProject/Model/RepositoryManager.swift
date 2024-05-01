//
//  RepositoryManager.swift
//  GighubProject
//
//  Created by 배지해 on 4/10/24.
//

import Foundation

struct RepositoryManager {
    
    func getRepositoryData(completion: @escaping ([Repository]?) -> Void) {
        
        guard let url = URL(string: "https://api.github.com/users/BaeJihae/repos") else {
            print("Error: URL을 불러오지 못했습니다.")
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        let session = URLSession.shared
        
        session.dataTask(with: request) { data, response, error in
            
            guard let safeData = data else {
                print("Error: data를 불러오지 못했습니다.")
                completion(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: 응답에 실패하였습니다.")
                completion(nil)
                return
            }
            
            guard error == nil else {
                print("Error: 에러가 발생하였습니다.")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let repoData = try decoder.decode([Repository].self, from: safeData)
                
                completion(repoData)
            } catch {
                
            }
            
        }.resume()
    }
    
    func getUserInfo(completion: @escaping (User?) -> Void) {
        
        guard let url = URL(string: "https://api.github.com/users/BaeJihae") else {
            print("Error: URL을 불러오지 못했습니다.")
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        let session = URLSession.shared
        
        session.dataTask(with: request) { data, response, error in
            
            guard let safeData = data else {
                print("Error: data를 불러오지 못했습니다.")
                completion(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: 응답에 실패하였습니다.")
                completion(nil)
                return
            }
            
            guard error == nil else {
                print("Error: 에러가 발생하였습니다.")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(User.self, from: safeData)
                
                completion(userData)
                
            } catch {
                
            }
            
        }.resume()
    }

}
