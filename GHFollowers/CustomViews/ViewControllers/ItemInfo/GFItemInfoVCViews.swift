//
//  GFItemInfoVCViews.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 13/12/20.
//

import UIKit

extension GFItemInfoVC {
    
    func setupViews(){
        configureBackgroundView()
        configureStackView()
        configureActionButton()
    }
        
    func configureBackgroundView(){
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureActionButton() {
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
