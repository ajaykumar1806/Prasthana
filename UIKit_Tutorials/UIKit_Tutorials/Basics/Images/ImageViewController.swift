//
//  ImageViewController.swift
//  UIKit_Tutorials
//
//  Created by G Ajay on 30/01/25.
//

import UIKit

class ImageViewController: UIViewController {
    
    private var imageView:UIImageView={
        let view=UIImageView()
        view.contentMode = .scaleAspectFit
        view.sizeToFit()
        view.image=UIImage(systemName: "paperplane")
        view.tintColor = .red
        return view
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints=false
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive=true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive=true
        
        
    }
}

#Preview {
    ImageViewController()
}
