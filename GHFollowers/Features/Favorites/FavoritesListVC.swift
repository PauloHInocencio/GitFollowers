//
//  FavoritesListVC.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 30/11/20.
//

import UIKit

class FavoritesListVC: UIViewController {
    
    let tableView = UITableView()
    var favorites:[Follower] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
}
