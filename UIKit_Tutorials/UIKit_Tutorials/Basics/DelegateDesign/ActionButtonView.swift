//
//  ActionButtonView.swift
//  UIKit_Tutorials
//
//  Created by G Ajay on 31/01/25.
//

import UIKit

protocol ActionButtonViewDelegate {
    func onPrimaryButtonTap()
    func onSecondaryButtonTap()
}

class ActionButtonView: UIView {
    
    var delegate:ActionButtonViewDelegate?
    
    private var primaryButton:UIButton={
        let button=UIButton(type: .system)
        button.setTitle("Primary Action", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints=false
        button.heightAnchor.constraint(equalToConstant: 70).isActive=true
        button.widthAnchor.constraint(equalToConstant: 270).isActive=true
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius=15
        return button
    }()
    
    private var secondaryButton:UIButton={
        let button=UIButton(type: .system)
        button.setTitle("Secondary Action", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints=false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(primaryButton)
        primaryButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive=true
        primaryButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive=true
        
        addSubview(secondaryButton)
        secondaryButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive=true
        secondaryButton.centerYAnchor.constraint(equalTo: primaryButton.bottomAnchor,constant: 50).isActive=true
        
        primaryButton.addTarget(self, action: #selector(handlePrimaryButton), for: .touchUpInside)
        secondaryButton.addTarget(self, action: #selector(handleSecondaryButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handlePrimaryButton() {
        delegate?.onPrimaryButtonTap()
    }
    
    @objc func handleSecondaryButton() {
        delegate?.onSecondaryButtonTap()
    }
}

#Preview{
    ActionButtonView()
}
