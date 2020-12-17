//
//  FollowerListVCViews.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 08/12/20.
//

import UIKit

extension FollowerListVC {
    
    func setupviews() {
        configureViewController()
        configureSearchController()
        configureCollectionView()
        configureDataSource()
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func configureCollectionView() {
        collectionview = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnLayout(in: view))
        view.addSubview(collectionview)
        collectionview.backgroundColor = .systemBackground
        collectionview.register(GFFollowerCell.self, forCellWithReuseIdentifier: GFFollowerCell.reuseID)
    }
    
    func configureSearchController() {
        searchController = UISearchController()
        searchController.searchBar.placeholder = "Search for a username"
        self.navigationItem.searchController = searchController
    }
    
    func configureDataSource() {
        self.dataSource = UICollectionViewDiffableDataSource(collectionView: collectionview, cellProvider: { (collectionview, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionview.dequeueReusableCell(withReuseIdentifier: GFFollowerCell.reuseID, for: indexPath) as! GFFollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
}
