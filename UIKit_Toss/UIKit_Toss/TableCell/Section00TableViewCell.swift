//
//  Section01TableViewCell.swift
//  UIKit_Toss
//
//  Created by wonyoul heo on 7/18/24.
//

import UIKit

class Section00TableViewCell: UITableViewCell {

    private lazy var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        
        return stackView
    }()
    
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "토스뱅크"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    // cell type을 accessory type으로 할까도 고민
    private lazy var button: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "chevron.right")
        config.baseForegroundColor = .gray
        button.configuration = config
        button.addAction(UIAction{[weak self] _ in
            print(" Tap accessory button")
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
        contentView.addSubview(mainStack)
        mainStack.addArrangedSubview(label)
        mainStack.addArrangedSubview(button)
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    
}
