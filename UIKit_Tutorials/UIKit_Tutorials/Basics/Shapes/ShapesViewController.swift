//
//  ShapesViewController.swift
//  UIKit_Tutorials
//
//  Created by G Ajay on 30/01/25.
//

import UIKit

class ShapesViewController: UIViewController {
    
    private var rectangle:UIView = {
        let rect=UIView()
        rect.backgroundColor = .orange
        rect.layer.cornerRadius = 10
        rect.translatesAutoresizingMaskIntoConstraints=false
        return rect
    }()
    
    private var circle:UIView={
        let circle=UIView()
        circle.backgroundColor = .systemMint
        circle.translatesAutoresizingMaskIntoConstraints=false
        return circle
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(rectangle)
        rectangle.heightAnchor.constraint(equalToConstant: 120).isActive=true
        rectangle.widthAnchor.constraint(equalToConstant: 230).isActive=true
        rectangle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
        rectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        
        view.addSubview(circle)
        circle.heightAnchor.constraint(equalToConstant: 120).isActive=true
        circle.widthAnchor.constraint(equalToConstant: 120).isActive=true
        circle.layer.cornerRadius=120/2
        circle.topAnchor.constraint(equalTo: rectangle.bottomAnchor, constant: 20).isActive=true
        circle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        
    }
}

#Preview {
    ShapesViewController()
}
