//
//  BalanceEntry.swift
//  UIKit_Toss
//
//  Created by wonyoul heo on 7/16/24.
//

import UIKit

enum cellType {
    case data
    case information
}


class BalanceEntry {
    
    let type: cellType
    let bankLogo: UIImage
    let bankName: String
    let bankBalance: Int
    let buttonLable: String?
    
    
    init(type: cellType, bankLogo: UIImage, bankName: String, bankBalance: Int, buttonLable: String?) {
        self.type = cellType.data
        self.bankLogo = bankLogo
        self.bankName = bankName
        self.bankBalance = bankBalance
        self.buttonLable = buttonLable
    }
    
}


struct balanceSampleData {
    var balanceEntries: [BalanceEntry] = []
    
    mutating func createSampleBalanceEntrydata() {
        let logo1 = UIImage(named: "TossLogo")!
        let logo2 = UIImage(named: "IBKLogo")!
        let logo3 = UIImage(named: "KakaoLogo")!
        
        
        let balanceEntry1 = BalanceEntry(type: .data, bankLogo: logo1, bankName: "토스뱅크 통장", bankBalance: 3000000000, buttonLable: "송금")
        let balanceEntry2 = BalanceEntry(type: .data, bankLogo: logo2, bankName: "IBK 기업은행 계좌", bankBalance: 20000000000, buttonLable: "송금")
        let balanceEntry3 = BalanceEntry(type: .data, bankLogo: logo3, bankName: "카카오뱅크 통장", bankBalance: 432123400000, buttonLable: "송금")
        
        balanceEntries += [balanceEntry1, balanceEntry2, balanceEntry3]
        
        
    }
}


struct monthSampleData {
    var monthEntries: [BalanceEntry] = []
    
    mutating func createSampleMonthEntryData() {
        let logo1 = UIImage(named: "CreditCard")!
        
        let monthEntry1 = BalanceEntry(type: .data, bankLogo: logo1, bankName: "7월에 쓴 돈", bankBalance: 450000, buttonLable: "내역")
        let monthEntry2 = BalanceEntry(type: .information, bankLogo: logo1, bankName: "내 모든 카드", bankBalance: -1, buttonLable: nil)
        
        monthEntries += [monthEntry1, monthEntry2]
    }
}
