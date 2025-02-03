//
//  ViewController.swift
//  JsonDataRetrieval
//
//  Created by G Ajay on 31/01/25.
//

import UIKit

struct Event:Decodable {
    var name:String
    var date:String
    var time:String
    var location:String
    var parsedDate: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: date)
    }
}

class ViewController: UIViewController {
    
    private var jsonButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show Events", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 220).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    private var scrollView = UIScrollView()
    
    private var jsonStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
//        view.alignment = .center
        view.spacing = 10
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel = UILabel()
        scrollView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "EVENTS"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 50)
        titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        view.addSubview(jsonButton)
        jsonButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        jsonButton.centerYAnchor.constraint(equalTo: view.bottomAnchor,constant:-40).isActive = true
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isHidden = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: jsonButton.topAnchor,constant: -20).isActive = true
        
        scrollView.addSubview(jsonStackView)
        jsonStackView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 58).isActive = true
        jsonStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        jsonStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        jsonStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        jsonStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        
        
        jsonButton.addTarget(self, action: #selector(retriveJsonData), for: .touchUpInside)
    }
    
    @objc func retriveJsonData() {
        scrollView.isHidden.toggle()
        scrollView.isHidden ? jsonButton.setTitle("Show Events", for: .normal) : jsonButton.setTitle("Hide Events", for: .normal)
        
        var eventDictionary=[Int:[Event]]()
        
        if let url =  Bundle.main.path(forResource: "events", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: url), options: .mappedIfSafe)
                let decodedEvents = try JSONDecoder().decode([Event].self, from: data)
                jsonStackView.arrangedSubviews.forEach{$0.removeFromSuperview()}
                
                for event in decodedEvents {
                    if let date = event.parsedDate {
                        let month = Calendar.current.component(.month, from: date)
                        if eventDictionary[month] == nil {
                            eventDictionary[month] = []
                        }
                        eventDictionary[month]?.append(event)
                    }
                }
                
                let sortedMonths = eventDictionary.keys.sorted(by: < )
                for month in sortedMonths {
                    let monthLabel = UILabel()
                    monthLabel.font = UIFont.boldSystemFont(ofSize: 30)
                    monthLabel.text = "\(Calendar.current.monthSymbols[month-1])"
                    jsonStackView.addArrangedSubview(monthLabel)
                    if let events=eventDictionary[month] {
                        for event in events {
                            let eventLabel = UILabel()
                            eventLabel.numberOfLines = 0
                            eventLabel.text = "\(event.name) \(event.date) \(event.time) \(event.location)"
                            jsonStackView.addArrangedSubview(eventLabel)
                        }
                    }
                }
            }
            catch {
                print("Error decoding the data \(error)")
            }
        }
        else {
            print("Unable to fetch the file..")
        }
    }
}

#Preview {
    ViewController()
}
