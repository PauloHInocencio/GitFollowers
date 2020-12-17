//
//  SearchVCViews.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 01/12/20.
//

import UIKit

extension SearchVC {
    
    func setupViews(){
        configureViewController()
        configureLogoImageView()
        configureTextField()
        configureButton()
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureLogoImageView() {
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "gh-logo")!
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 200),
            logo.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureTextField() {
        view.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 48),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureButton(){
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
