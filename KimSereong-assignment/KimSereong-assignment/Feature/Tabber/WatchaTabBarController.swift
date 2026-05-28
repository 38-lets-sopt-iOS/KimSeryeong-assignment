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
        let purchaseViewController = DummyTabViewController(imageName: "Category")
        let webtoonViewController = DummyTabViewController(imageName: "Wallet")
        let searchViewController = DummyTabViewController(imageName: "Search")
        let saveViewController = DummyTabViewController(imageName: "Folder")
        
        subscribeViewController.tabBarItem = UITabBarItem(title: "구독", image: UIImage(named: "subscription"), tag: 0)
        purchaseViewController.tabBarItem = UITabBarItem(title: "개별 구매", image: UIImage(named: "Category"), tag: 1)
        webtoonViewController.tabBarItem = UITabBarItem(title: "웹툰", image: UIImage(named: "Wallet"), tag: 2)
        searchViewController.tabBarItem = UITabBarItem(title: "찾기", image: UIImage(named: "Search"), tag: 3)
        saveViewController.tabBarItem = UITabBarItem(title: "보관함", image: UIImage(named: "Folder"), tag: 4)
        
        tabBar.backgroundColor = .black
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
        
        viewControllers = [
            subscribeViewController,
            purchaseViewController,
            webtoonViewController,
            searchViewController,
            saveViewController
        ]
    }
}
