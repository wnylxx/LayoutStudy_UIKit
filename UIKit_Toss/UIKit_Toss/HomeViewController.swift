//
//  ViewController.swift
//  UIKit_Toss
//
//  Created by wonyoul heo on 7/11/24.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let backgroundColor: UIColor = UIColor(named: "BackgroundColor") ?? .white
    
    var sampleData = SampleData()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private lazy var mainTitle: UILabel = {
       let label = UILabel()
        label.text = "toss"
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.textColor = .gray
        return label
    }()
    
    private lazy var roundButton: UIButton = {
        let button = UIButton(type: .custom)
        var config = UIButton.Configuration.plain()
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 20)
        config.image = UIImage(systemName: "mappin", withConfiguration: imageConfiguration)
        config.baseForegroundColor = .red
        button.configuration = config
        button.addAction(UIAction{[weak self] _ in
            print("tap round Button")
        }, for: .touchUpInside)
        return button
    }()
    
    private lazy var alarmButton: UIButton = {
        let button = UIButton(type: .custom)
        var config = UIButton.Configuration.plain()
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 20)
        config.image = UIImage(systemName: "bell.fill", withConfiguration: imageConfiguration)
        config.baseForegroundColor = .gray
        button.configuration = config
        button.addAction(UIAction{[weak self] _ in
            print("tap alarmButton")
        }, for: .touchUpInside)
        return button
    }()
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sampleData.createSampleBalanceEntrydata()
        
        self.navigationController?.isNavigationBarHidden = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(BalanceTableViewCell.self, forCellReuseIdentifier: "balance")

        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        view.addSubview(mainTitle)
        view.addSubview(roundButton)
        view.addSubview(alarmButton)
        view.addSubview(tableView)
        
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        roundButton.translatesAutoresizingMaskIntoConstraints = false
        alarmButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let safe = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: safe.topAnchor),
            mainTitle.leadingAnchor.constraint(equalTo: safe.leadingAnchor, constant: 15),
            
            alarmButton.centerYAnchor.constraint(equalTo: mainTitle.centerYAnchor),
            alarmButton.trailingAnchor.constraint(equalTo: safe.trailingAnchor, constant: -15),
            
            roundButton.centerYAnchor.constraint(equalTo: mainTitle.centerYAnchor),
            roundButton.trailingAnchor.constraint(equalTo: alarmButton.leadingAnchor, constant: -10),
            
            tableView.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: safe.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safe.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safe.trailingAnchor)
            
            
            
            
        ])
        
        

    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "balance", for: indexPath) as! BalanceTableViewCell
        let balanecEntry = sampleData.balanceEntries[indexPath.row]
        cell.configureCell(bank: balanecEntry)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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

