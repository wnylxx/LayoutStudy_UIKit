//
//  TabBarController.swift
//  UIKit_Toss
//
//  Created by wonyoul heo on 7/15/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = HomeViewController()
        let vc2 = SideViewController()
        let vc3 = SideViewController()
        let vc4 = SideViewController()
        let vc5 = SideViewController()
        
        
        vc2.navigationItem.largeTitleDisplayMode = .always
        vc3.navigationItem.largeTitleDisplayMode = .always
        vc4.navigationItem.largeTitleDisplayMode = .always
        vc5.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: vc1)
        nav1.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let nav2 = UINavigationController(rootViewController: vc2)
        nav2.tabBarItem = UITabBarItem(title: "혜택", image: UIImage(systemName: "suit.diamond.fill"), tag: 1)
        
        let nav3 = UINavigationController(rootViewController: vc3)
        nav3.tabBarItem = UITabBarItem(title: "토스페이", image: UIImage(systemName: "handbag.fill"), tag: 2)
        
        let nav4 = UINavigationController(rootViewController: vc4)
        nav4.tabBarItem = UITabBarItem(title: "증권", image: UIImage(systemName: "dollarsign.square.fill"), tag: 3)
        
        let nav5 = UINavigationController(rootViewController: vc5)
        nav5.tabBarItem = UITabBarItem(title: "전체", image: UIImage(systemName: "list.bullet"), tag: 4)
        
//        nav1.navigationBar.prefersLargeTitles = true
//        nav2.navigationBar.prefersLargeTitles = true
        self.tabBar.backgroundColor = .white
        
        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: true)
        
        
    }
}
