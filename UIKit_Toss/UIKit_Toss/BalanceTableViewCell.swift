//
//  BalanceTableViewCell.swift
//  UIKit_Toss
//
//  Created by wonyoul heo on 7/15/24.
//

import UIKit

class BalanceTableViewCell: UITableViewCell {
    
    private lazy var logoView: UIImageView = {
        let imageView = UIImageView()
        let Logo = UIImage(systemName: "dollarsign.circle.fill")
        imageView.image = Logo
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var bankName: UILabel = {
        let label = UILabel()
        label.text = "토스뱅크 통장"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private lazy var bankBalance: UILabel = {
        let label = UILabel()
        label.text = "0원"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("송금", for: .normal)
        button.addAction(UIAction {[weak self] _ in
            print("송금 버튼 Click")
        }, for: .touchUpInside)
       return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(logoView)
        addSubview(bankName)
        addSubview(bankBalance)
        addSubview(sendButton)
        
        logoView.translatesAutoresizingMaskIntoConstraints = false
        bankName.translatesAutoresizingMaskIntoConstraints = false
        bankBalance.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = self.safeAreaLayoutGuide
        
        
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            logoView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            logoView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 60),
            
            bankName.topAnchor.constraint(equalTo: safeArea.topAnchor),
            bankName.leadingAnchor.constraint(equalTo: logoView.trailingAnchor, constant: 10),
            
            bankBalance.topAnchor.constraint(equalTo: bankName.bottomAnchor, constant: 6),
            bankBalance.leadingAnchor.constraint(equalTo: logoView.trailingAnchor, constant: 10),
            
            sendButton.centerYAnchor.constraint(equalTo: logoView.centerYAnchor),
            
            
        ])
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(bank: BalanceEntry) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        logoView.image = bank.bankLogo
        bankName.text = bank.bankName
        bankBalance.text = "\(numberFormatter.string(for: bank.bankBalance)!) 원"
    }
    

}
