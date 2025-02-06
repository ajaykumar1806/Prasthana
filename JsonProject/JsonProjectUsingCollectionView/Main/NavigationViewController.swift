//
//  NavigationViewController.swift
//  JsonProjectUsingCollectionView
//
//  Created by G Ajay on 06/02/25.
//

import UIKit

import UIKit

class NavigationViewController: UIViewController {
    
    private let event: Event
    
    init(event: Event) {
        self.event = event
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        let nameLabel = UILabel()
        nameLabel.text = event.name
        let dateLabel=UILabel()
        dateLabel.text = event.date
        let timeLabel=UILabel()
        timeLabel.text = event.time
        let locationLabel=UILabel()
        locationLabel.text = event.location
        
        let stackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [nameLabel, dateLabel, timeLabel, locationLabel])
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.backgroundColor = .systemMint
            stack.layer.cornerRadius = 10
            stack.axis = .vertical
            stack.spacing = 10
            stack.alignment = .center
            stack.isLayoutMarginsRelativeArrangement = true
            stack.layoutMargins = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
            return stack
        }()
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
