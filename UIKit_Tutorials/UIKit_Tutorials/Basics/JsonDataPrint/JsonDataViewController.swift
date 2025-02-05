//
//  JsonDataViewController.swift
//  UIKit_Tutorials
//
//  Created by G Ajay on 31/01/25.
//

import UIKit

struct Event:Decodable {
    var eventName:String
    var eventDate:String
    var eventTime:String
    var eventLocation:String
}

class JsonDataViewController: UIViewController {
    
    private var jsonData:UILabel={
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    func retriveJsonData(_ jsonFileName:String) {
        guard let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json") else {
            jsonData.text = "File not found"
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let events=try JSONDecoder().decode([Event].self, from: data)
            for event in events {
                let stringOfEvent = "\(event.eventName) \(event.eventDate) \(event.eventTime) \(event.eventLocation)"
                jsonData.text = stringOfEvent
                print(stringOfEvent)
            }
        }
        catch {
            jsonData.text = "Something Went Wrong : \(error)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        retriveJsonData("events")
        
        view.addSubview(jsonData)
        jsonData.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
        jsonData.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
    }

}

#Preview{
    JsonDataViewController()
}
