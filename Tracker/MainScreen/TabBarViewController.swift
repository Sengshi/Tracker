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
        setupConstraints()
    }
    
    
    
    private func setupViewControllers() {
        // Первая вкладка - Трекеры
        let trackersVC = TrackersViewController()
        let trackersNav = UINavigationController(rootViewController: trackersVC)
        let trackersIcon = UIImage(named: "tracker")?
            .resized(to: CGSize(width: 28, height: 28))
            .withRenderingMode(.alwaysTemplate)

        trackersNav.tabBarItem = UITabBarItem(
            title: "Трекеры",
            image: trackersIcon,
            selectedImage: trackersIcon
        )
        
        // Вторая вкладка - Статистика
        let statisticsVC = StatisticsViewController()
        let statisticsNav = UINavigationController(rootViewController: statisticsVC)
        let statisticsIcon = UIImage(named: "statistic")?
            .resized(to: CGSize(width: 28, height: 28))
            .withRenderingMode(.alwaysTemplate)

        statisticsNav.tabBarItem = UITabBarItem(
            title: "Статистика",
            image: statisticsIcon,
            selectedImage: statisticsIcon,
        )
        
        viewControllers = [trackersNav, statisticsNav]
    }
    
    private func setupTabBarAppearance() {
        tabBar.tintColor = UIColor(red: 55/255, green: 114/255, blue: 231/255, alpha: 1)
        tabBar.unselectedItemTintColor = UIColor(red: 174/255, green: 175/255, blue: 180/255, alpha: 1)

        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.stackedLayoutAppearance.selected.iconColor = tabBar.tintColor
        appearance.stackedLayoutAppearance.normal.iconColor = tabBar.unselectedItemTintColor
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance

    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabBar.heightAnchor.constraint(equalToConstant: 50),
            tabBar.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
}


extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
