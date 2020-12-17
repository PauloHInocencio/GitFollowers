//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 01/12/20.
//

import UIKit

class FollowerListVC: UIViewController {
    
    enum Section{ case main }
    
    var username: String!
    var followers:[Follower] = []
    var filteredFollowers:[Follower] = []
    var page:Int = 1
    var hasMoreFollowers = true
    var isSearching = false
    var isLoadingMoreFollowers = false
    var collectionview:UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    var searchController:UISearchController!
    
    init(username: String){
        super.init(nibName: nil, bundle: nil)
        self.username = username
        self.title = username
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupviews()
        setupActions()
        getFollowers(username: username, page: page)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    

}
