//
//  ExtensionViewController.swift
//  GighubProject
//
//  Created by 배지해 on 4/9/24.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileTableViewCell",
                                                 for: indexPath) as! ProfileViewTableViewCell
        return cell
    }
    
    
}
