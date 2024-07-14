//
//  ViewController.swift
//  UIKit_Toss
//
//  Created by wonyoul heo on 7/11/24.
//

import UIKit

class ViewController: UIViewController {
    private let backgroundColor: UIColor = UIColor(named: "BackgroundColor") ?? .white
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Toss"
        
        let test = UILabel()
        view.backgroundColor = backgroundColor // 배경색
        view.addSubview(test)
        test.text = "text" // test를 위해서 출력할 라벨
        test.translatesAutoresizingMaskIntoConstraints = false
        test.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        test.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        
        
    }


}

#Preview(body: {
    ViewController()
})

