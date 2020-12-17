//
//  UserInfoVCViews.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 11/12/20.
//

import UIKit

extension UserInfoVC {
    func setupViews() {
        configureViewController()
        configureHeaderViewContainer()
        configureGitProfileContainer()
        configureGitFollowersContainer()
        configureDateLabel()
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func configureHeaderViewContainer() {
        addChildViewController(userInfoHeaderVC)
        userInfoHeaderVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userInfoHeaderVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userInfoHeaderVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userInfoHeaderVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userInfoHeaderVC.view.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    func configureGitProfileContainer() {
        addChildViewController(repoItemVC)
        repoItemVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            repoItemVC.view.topAnchor.constraint(equalTo: userInfoHeaderVC.view.bottomAnchor, constant: 20),
            repoItemVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repoItemVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            repoItemVC.view.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    func configureGitFollowersContainer() {
        addChildViewController(followerItemVC)
        followerItemVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followerItemVC.view.topAnchor.constraint(equalTo: repoItemVC.view.bottomAnchor, constant: 20),
            followerItemVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            followerItemVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            followerItemVC.view.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    func configureDateLabel() {
        view.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: followerItemVC.view.bottomAnchor, constant: 20),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func configureUIElements(with user: User){
        self.userInfoHeaderVC.user = user
        self.repoItemVC.user = user
        self.followerItemVC.user = user
        self.dateLabel.text = "Github since \(user.createdAt.convertToDisplayFormat())"
    }
}
