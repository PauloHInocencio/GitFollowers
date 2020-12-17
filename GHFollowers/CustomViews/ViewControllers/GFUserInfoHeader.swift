//
//  GFUserInfoHeaderVC.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 09/12/20.
//

import UIKit

class GFUserInfoHeader: UIViewController {
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)
    
    var user: User! {
        didSet {
            configureUIElements()
        }
    }

    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupviews()
    }
        
    func setupviews() {
        configureAvatarImageView()
        configureUsernameLabel()
        configureNameLabel()
        configureLocationImageView()
        configureLocationLabel()
        configureBioLabel()
    }
    
    func configureUIElements() {
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text     = user.name ?? ""
        locationLabel.text = user.location ?? "No Location"
        bioLabel.text      = user.bio ?? "No bio available"
    }
    
    func configureAvatarImageView() {
        view.addSubview(avatarImageView)
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            avatarImageView.widthAnchor.constraint(equalToConstant:90),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func configureUsernameLabel() {
        view.addSubview(usernameLabel)
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
    func configureNameLabel(){
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configureLocationImageView() {
        view.addSubview(locationImageView)
        locationImageView.image = UIImage(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configureLocationLabel() {
        view.addSubview(locationLabel)
        NSLayoutConstraint.activate([
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            locationLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configureBioLabel() {
        view.addSubview(bioLabel)
        bioLabel.numberOfLines = 3
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
