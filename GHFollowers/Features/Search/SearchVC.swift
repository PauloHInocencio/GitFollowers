//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 30/11/20.
//

import UIKit

class SearchVC: UIViewController {
    
    let logo = UIImageView()
    let textField = GFTextField()
    let button = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool{ return !textField.text!.isEmpty }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}



