//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 12/12/20.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureItems() {
        itemInfoViewOne.set(itemInfoType: .respos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.backgroundColor = .systemPurple
        actionButton.setTitle("GitHub Profile", for: .normal)
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: self.user)
    }
}
