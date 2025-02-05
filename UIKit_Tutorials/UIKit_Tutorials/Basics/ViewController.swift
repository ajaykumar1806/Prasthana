//
//  ViewController.swift
//  UIKit_Tutorials
//
//  Created by G Ajay on 29/01/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .purple
        
        
    }
    func names(_ name:String) {
        nameLabel.text = ("Hello \(name), Welcome to UIKit begineers Tutorials")
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        names("Ajay")
        view.backgroundColor = .systemRed
    }
    
    
}

