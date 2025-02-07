//
//  NavigationViewController.swift
//  JsonProjectUsingUIKit
//
//  Created by G Ajay on 07/02/25.
//

import UIKit

class NavigationViewController: UIViewController {
    
    private let event: Event
    var parsedDate : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: event.date) {
            let day = Calendar.current.component(.day, from: date)
            let month = Calendar.current.component(.month, from: date)
            let monthSymbol = Calendar.current.monthSymbols[month-1]
            let year = Calendar.current.component(.year, from: date)
            return "\(day) \(monthSymbol) \(year)"
        }
        return ""
    }
    
    init(event: Event) {
        self.event = event
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        title = "Event Details"
        setupUI()
    }
    
    private func setupUI() {
        let nameLabel = UILabel()
        nameLabel.text = event.name
        
        let dateLabel=UILabel()
        dateLabel.text = parsedDate
        dateLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        let timeLabel=UILabel()
        timeLabel.text = event.time
        timeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        let locationLabel=UILabel()
        locationLabel.text = event.location
        
        let stackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [dateLabel,timeLabel,nameLabel,locationLabel])
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.layer.cornerRadius = 14
            stack.axis = .vertical
            stack.spacing = 10
            stack.backgroundColor = .white
            stack.isLayoutMarginsRelativeArrangement = true
            stack.layoutMargins = UIEdgeInsets(top: 15, left: 30, bottom: 15, right: 30)
            stack.heightAnchor.constraint(equalToConstant: 170).isActive = true
            stack.widthAnchor.constraint(equalToConstant: view.frame.width - 32).isActive = true
            return stack
        }()
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

#Preview {
    let sampleEvent = Event(name: "Sample Event", date: "2024-02-05",time: "19:00",location: "Raidurg")
    NavigationViewController(event: sampleEvent)
}
