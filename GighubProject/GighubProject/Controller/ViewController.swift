//
//  ViewController.swift
//  GighubProject
//
//  Created by 배지해 on 3/31/24.
//

import UIKit

class ViewController: UIViewController {
    
    var repoManager = RepositoryManager()
    var repositoryData: [Repository]?
    var userData: User?
    var mainUIView: MainUIView!
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMainUIView()
        // xib register 설정
        registerXib()
        setTableView()
        setRepositoryData()
        setUserInfoData()
        
    }
    
    func setMainUIView() {
        mainUIView = MainUIView()
        
        view.addSubview(mainUIView)
        mainUIView.frame = view.bounds
    }
    
    // Xib setting
    private func registerXib() {
        
        let nibName = UINib(nibName: "ProfileViewTableViewCell",
                            bundle: nil)
        mainUIView.tableView.register(nibName, forCellReuseIdentifier: "profileTableViewCell")
    }
    
    func setRepositoryData() {
        repoManager.getRepositoryData { [weak self] repositoryData in
            DispatchQueue.main.async {
                guard let repos = repositoryData else { return }
                self?.repositoryData = repos
                self?.mainUIView.tableView.reloadData()
            }
        }
    }
    
    func setUserInfoData() {
        repoManager.getUserInfo { user in
            DispatchQueue.main.async {
                guard let user = user else { return }
                self.userData = user
                self.contigueData()
            }
        }
    }
    
    func configureRefreshControl () {
        // Add the refresh control to your UIScrollView object.
        mainUIView.tableView.refreshControl = UIRefreshControl()
        mainUIView.tableView.refreshControl?.addTarget(self, action:
                                                        #selector(handleRefreshControl),
                                                       for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
        // Update your content…
        
        // Dismiss the refresh control.
        DispatchQueue.main.async {
            self.mainUIView.tableView.refreshControl?.endRefreshing()
        }
    }
    
    func contigueData() {
        
        if let userData = userData {
            if let url = URL(string: userData.avatarURL) {
                let request = URLRequest(url: url)
                URLSession.shared.dataTask(with: request) { data, _, _ in
                    DispatchQueue.main.async {
                        if let safeData = data {
                            self.mainUIView.profileImage.image = UIImage(data: safeData)
                        }
                    }
                }.resume()
            }
            
            mainUIView.userIdLabel.text = userData.login
            mainUIView.userNameLabel.text = userData.name
            mainUIView.userFollowersNumberLabel.text = "\(userData.followers)"
            mainUIView.userFollowingNumberLabel.text = "\(userData.following)"
            if let location = userData.location {
                mainUIView.userRegionLabel.text = location
            }
        }
    }
    
}
