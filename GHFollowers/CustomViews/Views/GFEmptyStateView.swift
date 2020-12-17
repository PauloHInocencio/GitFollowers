//
//  GFEmptyStateView.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 08/12/20.
//

import UIKit

class GFEmptyStateView: UIView {
    
    let label = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logo = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(message: String){
        self.init(frame: .zero)
        label.text = message
    }
    
    func setupViews() {
        configureLabel()
        configureLogo()
    }
    
    private func configureLabel() {
        addSubview(label)
        label.numberOfLines = 3
        label.textColor = .secondaryLabel
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            label.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureLogo() {
        addSubview(logo)
        logo.image = UIImage(named: "empty-state-logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logo.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            logo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40)
        ])
    }

}
