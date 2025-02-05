//
//  TextFieldViewController.swift
//  UIKit_Tutorials
//
//  Created by G Ajay on 30/01/25.
//

import UIKit

class TextFieldViewController: UIViewController {
    
    //The UITextField allows users to enter single line text inputs
    
    private var textField:UITextField={
        let tf=UITextField()
        tf.placeholder=" Search.."
        tf.becomeFirstResponder()
        tf.clearButtonMode = .whileEditing
        tf.layer.borderColor = UIColor.red.cgColor
        tf.layer.borderWidth = 4
        tf.layer.cornerRadius = 30
        tf.textColor = .magenta
        tf.font=UIFont.systemFont(ofSize: 30)
        tf.returnKeyType = .send
        return tf
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(textField)
        view.backgroundColor = .white
        textField.delegate=self
        textField.translatesAutoresizingMaskIntoConstraints=false
        textField.heightAnchor.constraint(equalToConstant: 70).isActive=true
        textField.widthAnchor.constraint(equalToConstant: view.frame.width-64).isActive=true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
        textField.addTarget(self, action: #selector(onEditingChange), for: .editingChanged)
    }
    @objc func onEditingChange(_ sender:UITextField) {
        print("The typing contents are: \(sender.text)")
    }
}

//  A delegate is a way for one object to ask another object to do something or send information back.
//  A delegate is like a "helper" that another object calls when it needs assistance!

extension TextFieldViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Debug.. the return button is working properly")
        textField.resignFirstResponder() //(
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Debug.. the editing has begun ")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Debug.. the editing has ended")
    }
}

#Preview {
    TextFieldViewController()
}
