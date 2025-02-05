//
//  StacksViewController.swift
//  UIKit_Tutorials
//
//  Created by G Ajay on 30/01/25.
//

import UIKit

class StacksViewController: UIViewController {
    
    //In UIKit StackView is a layout container that arranges multiple views vertically or horizontally
    private var stackView:UIStackView = {
        let stack=UIStackView()
        stack.axis = .vertical
        stack.spacing=40
        stack.alignment = .center
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let rect1=createRectangle(length: 30, Width: 80)
        rect1.backgroundColor = .blue
        let rect2=createRectangle(length: 40, Width: 160)
        rect2.backgroundColor = .purple
        let rect3=createRectangle(length: 50, Width: 320)
        rect3.backgroundColor = .systemPink
        

        stackView.addArrangedSubview(rect1)
        stackView.addArrangedSubview(rect2)
        stackView.addArrangedSubview(rect3)
        
        stackView.translatesAutoresizingMaskIntoConstraints=false
        
        view.addSubview(stackView)
//        stackView.heightAnchor.constraint(equalToConstant: 500).isActive=true
//        stackView.widthAnchor.constraint(equalToConstant: 500).isActive=true
//        stackView.backgroundColor = .gray
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        
    }
    
    private func createRectangle(length:Int,Width:Int) -> UIView{
        let rectangle=UIView()
        rectangle.translatesAutoresizingMaskIntoConstraints=false
        rectangle.layer.cornerRadius=10
        rectangle.heightAnchor.constraint(equalToConstant: CGFloat(length)).isActive=true
        rectangle.widthAnchor.constraint(equalToConstant: CGFloat(Width)).isActive=true
        return rectangle
    }

}

#Preview {
    StacksViewController()
}
