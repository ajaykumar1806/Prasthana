//
//  ScrollViewsViewController.swift
//  UIKit_Tutorials
//
//  Created by G Ajay on 30/01/25.
//

import UIKit

class ScrollViewsViewController: UIViewController {
    
    private var scrollView = UIScrollView()
    private var stackView:UIStackView={
        let stackView=UIStackView()
        stackView.axis = .vertical
        stackView.spacing=20
        stackView.isLayoutMarginsRelativeArrangement=false
        return stackView
    }()
    private let rectHeight=150
    private let rectWidth=200
    private let numberOFRects=20

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        for _ in 1...numberOFRects {
            let rect=createRectangle()
            stackView.addArrangedSubview(rect)
        }
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints=false
        scrollView.delegate=self
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive=true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive=true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive=true
        
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints=false
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive=true
        
        scrollView.contentSize.height = (CGFloat(rectHeight+20)*CGFloat(numberOFRects)) + 64
    }
        
    func createRectangle() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints=false
        view.heightAnchor.constraint(equalToConstant: CGFloat(rectHeight)).isActive=true
        view.widthAnchor.constraint(equalToConstant: CGFloat(rectWidth)).isActive=true
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius=16
        return view
    }
}

extension ScrollViewsViewController:UIScrollViewDelegate{
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("DEBUG.. The user is scrolling:\(scrollView.contentOffset)")
//    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("The scrollView started dragging")
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("The scrollView ended decelerating")
    }
}

#Preview{
    ScrollViewsViewController()
}
