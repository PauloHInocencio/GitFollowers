//
//  GFTabBarViewController.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 14/12/20.
//

import UIKit

class GFTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        configureTabbar()
    }
    
    func configureTabbar() {
        UITabBar.appearance().tintColor = .systemGreen
        self.viewControllers = [createSearchNC(), createFavoritesNC()]
    }
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }
    
    
    func createFavoritesNC() -> UINavigationController {
        let favoritesListVC = FavoritesListVC()
        favoritesListVC.title = "Favorites"
        favoritesListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favoritesListVC)
    }

}
