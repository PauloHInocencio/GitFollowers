//
//  UserInfoVCActions.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 11/12/20.
//

import UIKit

protocol UserInfoVCDelegate: AnyObject {
    func didTapGitHubProfile(for user: User)
    func didTapGitFollowers(for user: User)
}

extension UserInfoVC {
    
    func setupActions() {
        setUserInfoDelegate()
    }
    
    func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case.success(let user):
                    DispatchQueue.main.async {
                        self.configureUIElements(with: user)
                    }
                case.failure(let error):
                    self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
                    break
            }
        }
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}


extension UserInfoVC : UserInfoVCDelegate {
    
    func setUserInfoDelegate() {
        repoItemVC.delegate = self
        followerItemVC.delegate = self
    }
    
    func didTapGitHubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: "Invalid URL", message: "The url attached to this user is invalid.", buttonTitle: "OK")
            return
        }
        presentSafariVC(with: url)
    }
    
    func didTapGitFollowers(for user: User) {
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No Followers", message: "This user has no followers. What a shame. 😞", buttonTitle: "So sad")
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismissVC()
    }
}
