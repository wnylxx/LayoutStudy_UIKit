//
//  Section03TableViewCell.swift
//  UIKit_Toss
//
//  Created by wonyoul heo on 7/18/24.
//

import UIKit

class Section03TableViewCell: UITableViewCell {
    
    
    private lazy var checkImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "checkmark.seal.fill")
        return image
        
    }()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "내 신용점수"
        return label
    }()
    
    private lazy var checkButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.title = "확인하기"
        config.baseForegroundColor = .gray
        button.configuration = config
        button.addAction(UIAction{ [weak self] _ in
            print("Tap check button")
        }, for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()
    
    
    private lazy var makeAccountButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.title = "계좌개설"
        config.baseForegroundColor = .gray
        button.configuration = config
        button.addAction(UIAction{ [weak self] _ in
            print("Tap Account button")
        }, for: .touchUpInside)
        return button
    }()
    
    private lazy var makeCardButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.title = "카드발급"
        config.baseForegroundColor = .gray
        button.configuration = config
        button.addAction(UIAction{ [weak self] _ in
            print("Tap Card button")
        }, for: .touchUpInside)
        return button
    }()
    
    private lazy var makeLoankButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.title = "대출받기"
        config.baseForegroundColor = .gray
        button.configuration = config
        button.addAction(UIAction{ [weak self] _ in
            print("Tap Loan button")
        }, for: .touchUpInside)
        return button
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    private func setupViews() {
        
        buttonStack.addArrangedSubview(makeAccountButton)
        buttonStack.addArrangedSubview(makeCardButton)
        buttonStack.addArrangedSubview(makeLoankButton)
        contentView.addSubview(buttonStack)
        
        contentView.addSubview(checkImage)
        contentView.addSubview(mainLabel)
        contentView.addSubview(checkButton)
        
        
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        
//        let safe = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            mainLabel.leadingAnchor.constraint(equalTo: checkImage.trailingAnchor, constant: 5),
            
            checkImage.centerYAnchor.constraint(equalTo: mainLabel.centerYAnchor),
            checkImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            checkButton.centerYAnchor.constraint(equalTo: mainLabel.centerYAnchor),
            checkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            buttonStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            buttonStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            buttonStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
    }

}


#Preview(body: {
    TabBarController()
})
