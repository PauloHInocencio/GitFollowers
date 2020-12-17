//
//  UserInfo.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 09/12/20.
//

import UIKit

class UserInfoVC: UIViewController {

    let userInfoHeaderVC = GFUserInfoHeader()
    let repoItemVC = GFRepoItemVC()
    let followerItemVC = GFFollowerItemVC()
    
    let dateLabel = GFBodyLabel(textAlignment: .center)
    var username: String!
    
    weak var delegate: FollowerListVCDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupActions()
        getUserInfo()
    }
}
