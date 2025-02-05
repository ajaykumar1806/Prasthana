//
//  DelegateDesignViewController.swift
//  UIKit_Tutorials
//
//  Created by G Ajay on 31/01/25.
//

import UIKit

class DelegateDesignViewController: UIViewController {
    
    private var actionButtonView=ActionButtonView()
    
    private var textLabel : UILabel={
        let label=UILabel()
        label.text = "Primary button got triggered"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font=UIFont.boldSystemFont(ofSize: 25)
        label.isHidden = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray
        view.addSubview(actionButtonView)
        actionButtonView.heightAnchor.constraint(equalToConstant: 400).isActive=true
        actionButtonView.widthAnchor.constraint(equalToConstant: 350).isActive=true
        actionButtonView.layer.backgroundColor = UIColor.white.cgColor
        actionButtonView.layer.cornerRadius = 20
        actionButtonView.translatesAutoresizingMaskIntoConstraints=false
        actionButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        actionButtonView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
        
        view.addSubview(textLabel)
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        textLabel.centerYAnchor.constraint(equalTo: actionButtonView.bottomAnchor,constant: 30).isActive=true
        
        actionButtonView.delegate=self
        
    }

}

extension DelegateDesignViewController: ActionButtonViewDelegate {
    func onPrimaryButtonTap() {
        textLabel.isHidden = false
    }
    
    func onSecondaryButtonTap() {
        textLabel.isHidden = true
    }
    
    
}

#Preview {
    DelegateDesignViewController()
}
