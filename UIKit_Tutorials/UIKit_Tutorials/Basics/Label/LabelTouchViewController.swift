//
//  LabelTouchViewController.swift
//  UIKit_Tutorials
//
//  Created by G Ajay on 29/01/25.
//

import UIKit

class LabelTouchViewController: UIViewController {
    
    private var textLabel=UILabel()
        //Approact-2
    private var subtitleLabel:UILabel = {
        let label=UILabel()
        label.text="This is the way of learning UIKit"
        label.textColor = .blue
        return label
    }()
    //

    override func viewDidLoad() {
        super.viewDidLoad()
            //Approach-1
        textLabel.text="Hello world"
        textLabel.font=UIFont.systemFont(ofSize: 30)
        textLabel.font=UIFont.boldSystemFont(ofSize: 30)
        //
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints=false
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
        
        view.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints=false
        subtitleLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10).isActive=true
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        
    }
}
#Preview{
    LabelTouchViewController()
}
