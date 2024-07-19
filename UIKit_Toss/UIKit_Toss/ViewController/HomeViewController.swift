//
//  ViewController.swift
//  UIKit_Toss
//
//  Created by wonyoul heo on 7/11/24.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Sample Data
    var balSampleData = balanceSampleData()
    var monSampleData = monthSampleData()
    
    private let backgroundColor: UIColor = UIColor(named: "BackgroundColor") ?? .white
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = 0
        
        // group 했을 때 여백 제거하기 ( 모든 양수보단 작지만 0보다 큰 수 )
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        return tableView
    }()
    
    private lazy var mainTitle: UILabel = {
       let label = UILabel()
        label.text = "toss"
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.textColor = .systemGray
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
        balSampleData.createSampleBalanceEntrydata()
        monSampleData.createSampleMonthEntryData()
        
        self.navigationController?.isNavigationBarHidden = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(BalanceTableViewCell.self, forCellReuseIdentifier: "balance")
        tableView.register(Section00TableViewCell.self, forCellReuseIdentifier: "section00")
        tableView.register(Section03TableViewCell.self, forCellReuseIdentifier: "section03")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "basicCell")

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
            
            tableView.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 5),
            tableView.bottomAnchor.constraint(equalTo: safe.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safe.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safe.trailingAnchor)
        ])
        
        

    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        case 2:
            return 2
        case 3:
            return 1
        default:
            return 0
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "section00", for: indexPath) as! Section00TableViewCell
                return cell
            
        case 1:
            if indexPath.row < 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "balance", for: indexPath) as! BalanceTableViewCell
                let balanecEntry = balSampleData.balanceEntries[indexPath.row]
                cell.configureCell(bank: balanecEntry)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
                cell.textLabel?.text = "내 계좌 대출 증권 포인트 보기"
                cell.textLabel?.textAlignment = .center
                return cell
            }
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "balance", for: indexPath) as! BalanceTableViewCell
            let monthEntry = monSampleData.monthEntries[indexPath.row]
            cell.configureCell(bank: monthEntry)
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "section03", for: indexPath) as! Section03TableViewCell
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "section01", for: indexPath) as! Section00TableViewCell
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 75
        case 1:
            return 80
        case 2:
            return 80
        case 3:
            return 80
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
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

