//
//  SideViewController.swift
//  UIKit_Toss
//
//  Created by wonyoul heo on 7/14/24.
//

import UIKit

class SideViewController: UIViewController {
    
    private lazy var testLabel: UILabel = {
        let label = UILabel()
        label.text = "This is Second View"
        label.textColor = .white
        label.backgroundColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        view.addSubview(testLabel)
        
        NSLayoutConstraint.activate([
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
    }
    


}

#Preview(body: {
    SideViewController()
})
