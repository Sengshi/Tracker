//
//  TabBarViewController.swift
//  Tracker
//
//  Created by Денис Кель on 19.06.2025.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setupTabBarAppearance()
    }
    
    private func setupViewControllers() {
        // Первая вкладка - Трекеры
        let trackersVC = TrackersViewController()
        let trackersNav = UINavigationController(rootViewController: trackersVC)
        trackersNav.tabBarItem = UITabBarItem(
            title: "Трекеры",
            image: UIImage(systemName: "record.circle.fill"),
            selectedImage: UIImage(systemName: "record.circle.fill")
        )
        
        // Вторая вкладка - Статистика
        let statisticsVC = StatisticsViewController()
        let statisticsNav = UINavigationController(rootViewController: statisticsVC)
        statisticsNav.tabBarItem = UITabBarItem(
            title: "Статистика",
            image: UIImage(systemName: "chart.bar.fill"),
            selectedImage: UIImage(systemName: "chart.bar.fill")
        )
        
        viewControllers = [trackersNav, statisticsNav]
    }
    
    private func setupTabBarAppearance() {
//        tabBar.tintColor = UIColor(red: 55/255, green: 114/255, blue: 231/255, alpha: 1)
        tabBar.unselectedItemTintColor = UIColor(red: 174/255, green: 175/255, blue: 180/255, alpha: 1)
//        tabBar.backgroundColor = .systemBackground
    }
    

}

