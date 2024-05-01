//
//  MainUIView.swift
//  GighubProject
//
//  Created by 배지해 on 4/20/24.
//

import UIKit

class MainUIView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConfigue()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
        setConfigue()
    }
    
    // MARK: - UI 설정
    
    // 프로필 이미지
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    // 유저 ID 라벨
    let userIdLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor.white
        return label
    }()
    
    
    // 유저 이름 라벨
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    
    // 유저 이름 스택뷰
    private lazy var userNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userIdLabel, userNameLabel])
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .leading
        stackView.distribution = .fill
        return stackView
    }()
    
    
    // 유저 소개 스택뷰
    private lazy var userDescriptionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImage, userNameStackView])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    
    // 유저 지역 아이콘 이미지
    let userRegionImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "Orion_map-marker")
        imageView.image = image
        imageView.tintColor = UIColor.lightGray
        return imageView
    }()
    
    
    // 유저 지역 라벨
    var userRegionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.lightGray
        label.textAlignment = .left
        return label
    }()
    
    
    // 유저 지역 스택뷰
    private lazy var userRegionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userRegionImage, userRegionLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    
    
    // 팔로우 아이콘 이미지
    let userFollowImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "Orion_starred-user")
        imageView.image = image
        imageView.tintColor = UIColor.lightGray
        return imageView
        
    }()
    
    
    // 팔로워 수
    let userFollowersNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()
    
    
    // 팔로워 라벨
    let userFollowersLabel: UILabel = {
        let label = UILabel()
        label.text = "followers"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.lightGray
        label.textAlignment = .left
        return label
    }()
    
    
    // 팔로잉 수
    let userFollowingNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()
    
    
    // 팔로워 라벨
    let userFollowingLabel: UILabel = {
        let label = UILabel()
        label.text = "following"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.lightGray
        label.textAlignment = .left
        return label
    }()
    
    
    // 유저 팔로우 스택뷰
    private lazy var userFollowersStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userFollowImage, userFollowersNumberLabel, userFollowersLabel, userFollowingNumberLabel, userFollowingLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    
    // 테이블 뷰
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.sectionIndexBackgroundColor = UIColor(red: 0x3C / 255.0, green: 0x48 / 255.0, blue: 0x54 / 255.0, alpha: 1.0)
        tableView.backgroundColor = UIColor(red: 0x3C / 255.0, green: 0x48 / 255.0, blue: 0x54 / 255.0, alpha: 1.0)
        return tableView
    }()
    
    func setView() {
        
        backgroundColor = UIColor(red: 0x3C / 255.0, green: 0x48 / 255.0, blue: 0x54 / 255.0, alpha: 1.0)
        
        addSubview(userDescriptionStackView)
        addSubview(userRegionStackView)
        addSubview(userFollowersStackView)
        addSubview(tableView)
    }

    // MARK: - AutoLayout Constraints
    
    func setConfigue() {
        
        profileImageConstraints()
        userNameStackViewConstraints()
        userDescriptionStackViewConstraints()
        userRegionImageConstraints()
        userRegionLabelConstraints()
        userRegionStackViewConstraints()
        userFollowImageConstraints()
        userFollowersNumberLabelConstraints()
        userFollowersLabelConstraints()
        userFollowingNumberLabelConstraints()
        userFollowingLabelConstraints()
        userFollowersStackViewConstraints()
        tableViewConstrains()
    }
    
    
    func profileImageConstraints() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 50),
            profileImage.heightAnchor.constraint(equalToConstant: 50),
            profileImage.leadingAnchor.constraint(equalTo: userDescriptionStackView.leadingAnchor),
            profileImage.topAnchor.constraint(equalTo: userDescriptionStackView.topAnchor),
            profileImage.bottomAnchor.constraint(equalTo: userDescriptionStackView.bottomAnchor)
        ])
    }
    
    
    func userNameStackViewConstraints() {
        userNameStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNameStackView.heightAnchor.constraint(equalToConstant: 50),
            userNameStackView.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
            userNameStackView.topAnchor.constraint(equalTo: userDescriptionStackView.topAnchor),
            userNameStackView.bottomAnchor.constraint(equalTo: userDescriptionStackView.bottomAnchor),
            userNameStackView.trailingAnchor.constraint(equalTo: userDescriptionStackView.trailingAnchor)
        ])
    }
    
    
    func userDescriptionStackViewConstraints() {
        userDescriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userDescriptionStackView.heightAnchor.constraint(equalToConstant: 50),
            userDescriptionStackView.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            userDescriptionStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userDescriptionStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    
    func userRegionImageConstraints() {
        userRegionImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userRegionImage.heightAnchor.constraint(equalToConstant: 15),
            userRegionImage.widthAnchor.constraint(equalToConstant: 15),
            userRegionImage.topAnchor.constraint(equalTo: userRegionStackView.topAnchor),
            userRegionImage.bottomAnchor.constraint(equalTo: userRegionStackView.bottomAnchor),
            userRegionImage.leadingAnchor.constraint(equalTo: userRegionStackView.leadingAnchor)
        ])
        
    }
    
    
    func userRegionLabelConstraints() {
        userRegionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userRegionLabel.heightAnchor.constraint(equalToConstant: 15),
            userRegionLabel.topAnchor.constraint(equalTo: userRegionStackView.topAnchor),
            userRegionLabel.bottomAnchor.constraint(equalTo: userRegionStackView.bottomAnchor),
            userRegionLabel.leadingAnchor.constraint(equalTo: userRegionImage.trailingAnchor, constant: 10),
            userRegionLabel.trailingAnchor.constraint(equalTo: userRegionStackView.trailingAnchor)
        ])
    }
    
    
    func userRegionStackViewConstraints() {
        userRegionStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userRegionStackView.heightAnchor.constraint(equalToConstant: 15),
            userRegionStackView.topAnchor.constraint(equalTo: userDescriptionStackView.bottomAnchor, constant: 25),
            userRegionStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userRegionStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    
    func userFollowImageConstraints() {
        userFollowImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userFollowImage.heightAnchor.constraint(equalToConstant: 18),
            userFollowImage.widthAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    
    func userFollowersNumberLabelConstraints() {
        userFollowersNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userFollowersNumberLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    
    func userFollowersLabelConstraints() {
        userFollowersLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userFollowersLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    
    func userFollowingNumberLabelConstraints() {
        userFollowingNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userFollowingNumberLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    
    func userFollowingLabelConstraints() {
        userFollowingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userFollowingLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    
    func userFollowersStackViewConstraints() {
        userFollowersStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userFollowersStackView.heightAnchor.constraint(equalToConstant: 18),
            userFollowersStackView.topAnchor.constraint(equalTo: userRegionStackView.bottomAnchor, constant: 15),
            userFollowersStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userFollowersStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func tableViewConstrains() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            tableView.topAnchor.constraint(equalTo: userFollowersStackView.bottomAnchor, constant: 25),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
