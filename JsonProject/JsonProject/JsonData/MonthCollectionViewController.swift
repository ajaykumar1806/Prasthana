//
//  MonthCollectionViewController.swift
//  JsonProject
//
//  Created by G Ajay on 04/02/25.
//

import UIKit


class MonthCollectionViewController: UICollectionViewController {
    
    private var dictOfEvents=jsonDateRetrieval()
    func eventKeys()->[String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM-yyyy"
        return dictOfEvents.keys.sorted {
            guard let date1 = formatter.date(from: $0) , let date2 = formatter.date(from: $1) else {return false}
            return date1 < date2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .lightGray
        self.navigationItem.backButtonTitle = "Back"
        title = "EVENTS"
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.reloadData()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dictOfEvents.keys.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let key = eventKeys()[section]
        return dictOfEvents[key]?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.contentView.subviews.forEach{$0.removeFromSuperview()}
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 7
        
        let key = eventKeys()[indexPath.section]
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        if indexPath.item == 0 {
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = key
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 30)
            
            cell.backgroundColor = .systemGreen.withAlphaComponent(0.8)
            cell.layer.cornerRadius = 7
            cell.contentView.addSubview(label)
            
            label.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        }
        else {
            if let events = dictOfEvents[key] , indexPath.item-1 < events.count {
                let event = events[indexPath.item - 1]
                label.text = event.name
                
                cell.contentView.addSubview(label)
                
                label.leftAnchor.constraint(equalTo: cell.leftAnchor,constant: 20).isActive = true
                label.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
            }
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let key = eventKeys()[indexPath.section]
        if indexPath.item == 0 {return}
        if let events = dictOfEvents[key] {
            let event = events[indexPath.item-1]
            let detailViewController = EventDetailViewController(event: event)
            navigationController?.pushViewController(detailViewController, animated: true)
        }
        
    }
}

extension MonthCollectionViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32 , height: (indexPath.item == 0) ? 80 : 50 )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}

