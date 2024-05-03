//
//  ViewController.swift
//  GithubProject(Snapkit&Searchbar)
//
//  Created by 배지해 on 5/1/24.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    var mainView = MainView()
    let networkManager = NetworkManager()
    let userName = "BaeJihae"
    var page = 1
    var islastPage = false
    
    var profile:GithubUser?
    var repository:[GitRepository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUserProfile()
        setupUserRepository()
        setTableView()
        registerCell()
        makeRefreshControl()
    }
    
    // 메인으로 사용할 View
    // super 사용하면 안됨.
    override func loadView() {
        self.view = mainView
    }
    
    func setupUserProfile() {
        networkManager.fetchUserProfile(userName: userName) { result in
            switch result {
            case .success(let profile):
                DispatchQueue.main.async{
                    self.bindUserProfile(profile: profile)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setupUserRepository() {
        networkManager.fetchUserRepository(userName: userName, page: page) { result in
            switch result {
            case .success(let repositories):
                self.repository = repositories
                self.mainView.tableView.refreshControl?.endRefreshing()
                self.mainView.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func bindUserProfile(profile: GithubUser) {
        let url = URL(string: profile.avatarURL)
        self.mainView.profileImage.kf.setImage(with: url)
        self.mainView.profileID.text = profile.login
        self.mainView.profileName.text = profile.name
        self.mainView.profileFollowersCount.text = "\(profile.followers)"
        self.mainView.profileFollowingCount.text = "\(profile.following)"
    }
    
    func makeRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshFire), for: .valueChanged)
        self.mainView.tableView.refreshControl = refreshControl
    }
    
    @objc func refreshFire() {
        setupUserProfile()
        setupUserRepository()
    }
    
    func loadMore() {
        if islastPage {
            print("이미 마지막 페이지를 불러왔습니다.")
            return
        }
        page += 1
        networkManager.fetchUserRepository(userName: userName, page: page) { [weak self] result in
            switch result {
            case .success(let repositories):
                guard let self = self else { return }
                if repositories.isEmpty {
                    self.islastPage = true
                }
                self.repository = self.repository + repositories
                DispatchQueue.main.async{
                    self.mainView.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setTableView() {
        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
    }
    
    func registerCell() {
        let nib = UINib(nibName: "RepositoryTableViewCell", bundle: nil)
        self.mainView.tableView.register(nib, forCellReuseIdentifier: "RepoCell")
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return repository.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepositoryTableViewCell
        
        cell.bind(repository: repository[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == repository.count-1 {
            loadMore()
            print("loadmore")
        }
    }
}
