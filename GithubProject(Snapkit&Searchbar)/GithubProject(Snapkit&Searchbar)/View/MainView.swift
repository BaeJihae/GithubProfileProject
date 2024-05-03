//
//  MainView.swift
//  GithubProject(Snapkit&Searchbar)
//
//  Created by 배지해 on 5/2/24.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    var profileImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    var profileID: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    var profileName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var profileStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileID, profileName])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let profileFollowers: UILabel = {
        let label = UILabel()
        label.text = "Followers"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var profileFollowersCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    let profileFollowing: UILabel = {
        let label = UILabel()
        label.text = "Following"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var profileFollowingCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var profileFollowStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileFollowers, profileFollowersCount, profileFollowing, profileFollowingCount])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.alignment = .fill
        return stackView
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        // code
        setupView()
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        // storyboard
    }
    
    func setupView() {
        self.addSubview(profileImage)
        self.addSubview(profileStack)
        self.addSubview(profileFollowStack)
        self.addSubview(tableView)
    }
    
    func configureConstraint() {
        profileImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80)
            make.leading.equalToSuperview().inset(25)
            make.width.height.equalTo(80)
        }
        profileStack.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(15)
            make.top.trailing.equalToSuperview().inset(80)
            make.height.equalTo(profileImage.snp.height)
        }
        profileFollowStack.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(25)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(profileFollowStack.snp.bottom).offset(15)
            make.leading.trailing.bottom.equalToSuperview().inset(25)
        }
    }

}
