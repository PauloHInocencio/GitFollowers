//
//  FavoritesListVCViews.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 14/12/20.
//

import UIKit

extension FavoritesListVC {
    
    func setupViews() {
        configureViewController()
        configureTableView()
    }
    
    func configureViewController() {
        self.view.backgroundColor = .systemBackground
        self.title = "Favorites"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.register(GFFavoriteCell.self, forCellReuseIdentifier: GFFavoriteCell.reuseID)
        tableView.tableFooterView = UIView(frame: .zero)
    }
}
