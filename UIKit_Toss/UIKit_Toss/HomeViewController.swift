//
//  ViewController.swift
//  UIKit_Toss
//
//  Created by wonyoul heo on 7/11/24.
//

import UIKit

class HomeViewController: UIViewController {
    private let backgroundColor: UIColor = UIColor(named: "BackgroundColor") ?? .white
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "toss"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.gray]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.gray]
        view.backgroundColor = UIColor(named: "BackgroundCol")
        
        
        let roundButton = UIBarButtonItem(image: UIImage(systemName: "mappin"), style: .plain, target: self, action: #selector(lookAround))
        roundButton.tintColor = .red
        
        let alarmButton = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: #selector(alarmAround))
        alarmButton.tintColor = .gray
        
        navigationItem.rightBarButtonItems = [alarmButton, roundButton]
        
        
        
        
        
        
        
    }
    
    @objc func lookAround() {
       // BarButtonItem
    }
    
    @objc func alarmAround() {
        // BarButtonItem
    }


}

#Preview(body: {
    TabBarController()
})

