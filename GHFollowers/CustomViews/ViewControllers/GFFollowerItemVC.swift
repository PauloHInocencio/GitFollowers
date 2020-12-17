//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 12/12/20.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.backgroundColor = .systemGreen
        actionButton.setTitle("Get Followers", for: .normal)
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitFollowers(for: self.user)
    }
}
