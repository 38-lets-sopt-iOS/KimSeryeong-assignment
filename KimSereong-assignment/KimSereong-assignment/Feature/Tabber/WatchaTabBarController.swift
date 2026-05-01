//
//  WatchaTabBarController.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 5/1/26.
//

import UIKit

final class WatchaTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
    }
    
    private func setTabBar() {
        
        let subscribeViewController = SubscribeViewController()
        let homeVC = DummyTabViewController(imageName: "Category")
        let searchVC = DummyTabViewController(imageName: "Wallet")
        let savedVC = DummyTabViewController(imageName: "Search")
        let settingVC = DummyTabViewController(imageName: "Folder")
        
        subscribeViewController.tabBarItem = UITabBarItem(title: "구독", image: UIImage(named: "subscription"), tag: 0)
        homeVC.tabBarItem = UITabBarItem(title: "개별 구매", image: UIImage(named: "Category"), tag: 1)
        searchVC.tabBarItem = UITabBarItem(title: "웹툰", image: UIImage(named: "Wallet"), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "찾기", image: UIImage(named: "Search"), tag: 3)
        settingVC.tabBarItem = UITabBarItem(title: "보관함", image: UIImage(named: "Folder"), tag: 4)
        
        tabBar.backgroundColor = .black
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
        
        viewControllers = [
            subscribeViewController,
            homeVC,
            searchVC,
            savedVC,
            settingVC
        ]
    }
}
