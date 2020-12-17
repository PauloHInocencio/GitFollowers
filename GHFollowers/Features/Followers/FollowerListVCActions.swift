//
//  FollowrListVCActions.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 08/12/20.
//

import UIKit

protocol FollowerListVCDelegate: class {
    func didRequestFollowers(for username:String)
}

extension FollowerListVC {
    
    func setupActions() {
        setCollectionViewDelegate()
        setSearchResultsUpdatingDelegate()
    }
    
    func getFollowers(username:String, page: Int) {
        showLoadingView()
        isLoadingMoreFollowers = true
        NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
                case .success(let followers):
                    if followers.count < 100 { self.hasMoreFollowers = false }
                    self.followers.append(contentsOf: followers)
                    
                    if self.followers.isEmpty {
                        let message = "This user doesn't have any followers. Go follow then. 😃"
                        DispatchQueue.main.async { self.showEmptyStateView(with: message, in: self.view) }
                        return
                    }
                    self.updateData(on: self.followers)
                    
                case .failure(let error):
                    self.presentGFAlertOnMainThread(title: "Bad Stuff happend", message: error.rawValue, buttonTitle: "Ok")
            }
            self.isLoadingMoreFollowers = false
        }
    }
    
    func updateData(on followers: [Follower]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
    
    @objc func addButtonTapped() {
        showLoadingView()
        
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else  { return }
            self.dismissLoadingView()
            
            switch result {
                case .success(let user):
                    
                    let favorite = Follower(login: user.login, avatarUrl: user.avatarUrl)
                    
                    PersistenceManager.updateWith(favorite: favorite, actionType: .add) { [weak self] error in
                        guard let self = self else { return }
                        guard let error = error else {
                            self.presentGFAlertOnMainThread(title: "Success", message: "You have successfully favorited this user 🎉", buttonTitle: "Hooray")
                            return
                        }
                        self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
                    }
                    
                case .failure(let error):
                    self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
}

extension FollowerListVC: UISearchResultsUpdating {
    
    func setSearchResultsUpdatingDelegate() { searchController.searchResultsUpdater = self }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filterText = searchController.searchBar.text, !filterText.isEmpty else{
            filteredFollowers.removeAll()
            updateData(on: followers)
            isSearching = false
            return
        }
        isSearching = true
        filteredFollowers = followers.filter { $0.login.lowercased().contains(filterText.lowercased()) }
        updateData(on: filteredFollowers)
    }
}

extension FollowerListVC: UICollectionViewDelegate {
    
    func setCollectionViewDelegate() { collectionview.delegate = self }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard self.hasMoreFollowers, !self.isLoadingMoreFollowers else { return }
            self.page += 1
            self.getFollowers(username: self.username, page: self.page)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray = isSearching ? filteredFollowers : followers
        let follower = activeArray[indexPath.item]
        let viewController = UserInfoVC()
        
        viewController.username = follower.login
        viewController.delegate = self
        let navController = UINavigationController(rootViewController: viewController)
        present(navController, animated: true)
    }
}

extension FollowerListVC : FollowerListVCDelegate {
    
    func didRequestFollowers(for username: String) {
        self.username = username
        title = username
        page = 1
        followers.removeAll()
        filteredFollowers.removeAll()
        collectionview.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        getFollowers(username: username, page: page)
    }
}
