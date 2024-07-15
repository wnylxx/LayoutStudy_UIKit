//
//  BalanceTableViewCell.swift
//  UIKit_Toss
//
//  Created by wonyoul heo on 7/15/24.
//

import UIKit

class BalanceTableViewCell: UITableViewCell {
    
    private lazy var LogoView: UIImageView = {
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

}
