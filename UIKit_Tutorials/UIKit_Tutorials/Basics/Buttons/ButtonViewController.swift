//
//  ButtonViewController.swift
//  UIKit_Tutorials
//
//  Created by G Ajay on 30/01/25.
//

import UIKit

class ButtonViewController: UIViewController {
    
    private var showNameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Name", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private var nameLabel:UILabel = {
        let label=UILabel()
        label.text="my name is Ajay"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden=true
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showNameButton.addTarget(self, action: #selector(onShowNameTapped), for: .touchUpInside)
        
        view.addSubview(showNameButton)
        showNameButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        showNameButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        showNameButton.backgroundColor = .systemBlue
        showNameButton.layer.cornerRadius = 10
        showNameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        showNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: showNameButton.bottomAnchor, constant: 20).isActive = true
        
    }
    @objc func onShowNameTapped() {
        nameLabel.isHidden.toggle()
        nameLabel.font=UIFont.boldSystemFont(ofSize: 20)
        nameLabel.textColor=UIColor.systemPink
        let title = nameLabel.isHidden ? "Show Name" : "Hide Name"
        showNameButton.setTitle(title, for: .normal)
        
    }
}

#Preview {
    ButtonViewController()
}
