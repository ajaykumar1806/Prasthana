//
//  RootCollectionViewController.swift
//  JsonProjectUsingUIKit
//
//  Created by G Ajay on 07/02/25.
//

import UIKit

class RootCollectionViewController: UICollectionViewController {
    
    private var dictOfEvents=jsonDataRetrieval()
    func sortedKeys()->[String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM-yyyy"
        return dictOfEvents.keys.sorted {
            guard let date1 = formatter.date(from: $0) , let date2 = formatter.date(from: $1) else {return false}
            return date1 < date2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        self.navigationItem.backButtonTitle = "Back"
        
        title = "Events Schedule"
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.reloadData()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dictOfEvents.keys.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let key = sortedKeys()[section]
        return (dictOfEvents[key]?.count ?? 0)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.contentView.subviews.forEach{$0.removeFromSuperview()}
        cell.backgroundColor = .white
        
        
        let key = sortedKeys()[indexPath.section]
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        if indexPath.item == 0 {
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = key
            label.font = UIFont.boldSystemFont(ofSize: 20)
            cell.backgroundColor = UIColor(red: 0.85 , green: 1, blue: 0, alpha: 0.85)
            cell.addSubview(label)
            
            label.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        }
        else {
            if let events = dictOfEvents[key] {
                let event = events[indexPath.item - 1]
                label.text = event.name
                
                cell.contentView.addSubview(label)
                
                label.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
            }
        }
        label.leftAnchor.constraint(equalTo: cell.leftAnchor,constant: 20).isActive = true
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let key = sortedKeys()[indexPath.section]
        if indexPath.item == 0 {return}
        if let events = dictOfEvents[key] {
            let event = events[indexPath.item-1]
            let detailViewController = NavigationViewController(event: event)
            navigationController?.pushViewController(detailViewController, animated: true)
        }
        
    }
}

extension RootCollectionViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: (indexPath.item == 0) ? 40 : 50 )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
}

#Preview {
    let layout = UICollectionViewFlowLayout()
    return RootCollectionViewController(collectionViewLayout: layout)
}
