//
//  GFItemInfoVCActions.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 13/12/20.
//

import UIKit

extension GFItemInfoVC {
    
    func setupActions() {
        addButtonTouchUpInsideAction()
    }
            
    func addButtonTouchUpInsideAction() {
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    @objc func actionButtonTapped() {
        preconditionFailure("This method must be overridden")
    }
}
