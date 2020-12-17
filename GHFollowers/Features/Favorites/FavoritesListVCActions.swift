//
//  FavoritesListVCActions.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 14/12/20.
//

import UIKit

extension FavoritesListVC {
    
    func setupActions() {
        setTableViewDelegate()
        setTableViewDataSource()
    }
    
    func getFavorites() {
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .success(let favorites):
                    if favorites.isEmpty {
                        self.showEmptyStateView(with: "No favorites?\nAdd one on the follower screen.", in: self.view)
                    } else {
                        self.favorites = favorites
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            self.view.bringSubviewToFront(self.tableView)
                        }
                    }
                case .failure(let error):
                    self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
}

extension FavoritesListVC : UITableViewDelegate {
    
    func setTableViewDelegate() { tableView.delegate = self }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        let vc = FollowerListVC(username: favorite.login)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        PersistenceManager.updateWith(favorite: favorites[indexPath.row], actionType: .remove) { [weak self] error in
            guard let self = self else { return }
            guard let error = error else {
                self.favorites.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
                return
            }
            self.presentGFAlertOnMainThread(title: "Unable to remove", message: error.rawValue, buttonTitle: "OK")
        }
    }
}

extension FavoritesListVC : UITableViewDataSource {
    
    func setTableViewDataSource() { tableView.dataSource = self }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GFFavoriteCell.reuseID) as! GFFavoriteCell
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        return cell
    }
}
