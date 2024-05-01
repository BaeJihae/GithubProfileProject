//
//  ViewController+extension.swift
//  GighubProject
//
//  Created by 배지해 on 4/9/24.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setTableView() {
        mainUIView.tableView.delegate = self
        mainUIView.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let repositoryData = repositoryData else { return 0 }
        return repositoryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileTableViewCell",
                                                 for: indexPath) as! ProfileViewTableViewCell
        
        guard let repositories = repositoryData else { return cell }
        
        let repository = repositories[indexPath.row]
        
        cell.repoName.text = "\(repository.name)"
        cell.repoStarts.text = "\(repository.stargazersCount)"
        
        if let language = repository.language {
            cell.repoLanguage.text = "\(language)"
        }
        
        return cell
    }
}
