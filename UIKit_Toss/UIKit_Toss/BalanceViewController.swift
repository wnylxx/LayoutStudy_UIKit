//
//  BalanceViewController.swift
//  UIKit_Toss
//
//  Created by wonyoul heo on 7/15/24.
//

import UIKit

class BalanceViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(BalanceTableViewCell.self, forCellReuseIdentifier: "BalanceCell")
        
        view.backgroundColor = .white
        view.addSubview(tableView)

        
    }
    
}


