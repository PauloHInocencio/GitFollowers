//
//  SearchVCActions.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 11/12/20.
//

import UIKit

extension SearchVC {
        
    func setupActions() {
        addButtonTouchUpInsideAction()
        addDissmissKeyboardTapGesture()
        setTextFieldDelegate()
    }
        
    private func addButtonTouchUpInsideAction() {
        button.addTarget(self, action: #selector(pushFollwersListVC), for: .touchUpInside)
    }
    
    private func addDissmissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollwersListVC() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a usernem. We need to know who to look for 😁", buttonTitle: "OK")
            return
        }
        
        textField.resignFirstResponder()
        
        let vc = FollowerListVC(username: textField.text!)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchVC : UITextFieldDelegate {
    
    func setTextFieldDelegate() { textField.delegate = self }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollwersListVC()
        return true
    }
}
