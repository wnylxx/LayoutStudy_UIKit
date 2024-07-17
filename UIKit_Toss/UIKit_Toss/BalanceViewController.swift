//
//  BalanceViewController.swift
//  UIKit_Toss
//
//  Created by wonyoul heo on 7/15/24.
//

import UIKit

class BalanceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(BalanceTableViewCell.self, forCellReuseIdentifier: "BalanceCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BalanceCell", for: indexPath) as! BalanceTableViewCell
        let balanceEntry = SampleData().balanceEntries[indexPath.row]
        cell.configureCell(bank: balanceEntry)
        return cell
    }
    
}


