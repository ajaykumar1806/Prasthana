//
//  EventDetailViewController.swift
//  JsonProject
//
//  Created by G Ajay on 04/02/25.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    private let event:Event
    init(event: Event) {
        self.event = event
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let nameLabel=UILabel()
    private let dateLabel=UILabel()
    private let timeLabel=UILabel()
    private let locationLabel=UILabel()

    func designView() {
        
        nameLabel.text = event.name
        dateLabel.text = event.date
        timeLabel.text = event.time
        locationLabel.text = event.location
        
        let stackView=UIStackView(arrangedSubviews: [nameLabel,dateLabel,timeLabel,locationLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.backgroundColor = .systemBlue.withAlphaComponent(0.6)
        stackView.layer.cornerRadius = 15
        stackView.layoutMargins = UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 2 - 100),
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        designView()
    }
}
