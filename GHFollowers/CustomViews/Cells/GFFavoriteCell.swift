//
//  GFFavoriteCell.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 14/12/20.
//

import UIKit

class GFFavoriteCell: UITableViewCell {
    
    static let reuseID = "FavoriteCell"
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 26)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(favorite: Follower) {
        usernameLabel.text = favorite.login
        avatarImageView.downloadImage(from: favorite.avatarUrl)
    }
    
    private func setupViews() {
        configureTableViewCell()
        configureAvatarImageView()
        configureUsernameLabel()
    }
    
    private func configureTableViewCell() {
        self.accessoryType = .disclosureIndicator
    }
    
    private func configureAvatarImageView() {
        addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func configureUsernameLabel() {
        addSubview(usernameLabel)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
