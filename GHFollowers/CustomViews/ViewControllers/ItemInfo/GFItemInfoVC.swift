//
//  GFItemInfoVC.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 11/12/20.
//

import UIKit

class GFItemInfoVC: UIViewController {
    
    let stackView = UIStackView()
    let itemInfoViewOne = GFitemInfoView()
    let itemInfoViewTwo = GFitemInfoView()
    let actionButton = GFButton()
    weak var delegate: UserInfoVCDelegate!
    
    var user: User! {
        didSet {
            configureItems()
        }
    }
    
    init() { super.init(nibName: nil, bundle: nil) }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupActions()
    }
    
    func configureItems() {
        preconditionFailure("This method must be overridden")
    }
}
