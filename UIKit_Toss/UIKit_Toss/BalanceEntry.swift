//
//  BalanceEntry.swift
//  UIKit_Toss
//
//  Created by wonyoul heo on 7/16/24.
//

import UIKit

class BalanceEntry {
    
    let bankLogo: UIImage
    let bankName: String
    let bankBalance: Int
    
    
    init(bankLogo: UIImage, bankName: String, bankBalance: Int) {
        self.bankLogo = bankLogo
        self.bankName = bankName
        self.bankBalance = bankBalance
    }
    
}


struct SampleData {
    var balanceEntries: [BalanceEntry] = []
    
    mutating func createSampleBalanceEntrydata() {
        let logo1 = UIImage(named: "TossLogo")!
        let logo2 = UIImage(named: "IBKLogo")!
        let logo3 = UIImage(named: "KakaoLogo")!
        
        let balanceEntry1 = BalanceEntry(bankLogo: logo1, bankName: "토스뱅크 통장", bankBalance: 3000000000)
        let balanceEntry2 = BalanceEntry(bankLogo: logo2, bankName: "IBK 기업은행 계좌", bankBalance: 20000000000)
        let balanceEntry3 = BalanceEntry(bankLogo: logo3, bankName: "카카오뱅크 통장", bankBalance: 432123400000)
        
        balanceEntries += [balanceEntry1, balanceEntry2, balanceEntry3]
        
        
    }
    
    
}
