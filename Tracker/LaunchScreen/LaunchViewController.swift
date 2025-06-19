//
//  LaunchViewController.swift
//  Tracker
//
//  Created by Денис Кель on 19.06.2025.
//

import UIKit

class LaunchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 55/255, green: 114/255, blue: 231/255, alpha: 1)
        
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 91),
            logoImageView.heightAnchor.constraint(equalToConstant: 94)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.transitionToMainScreen()
        }
    }
    
    private func transitionToMainScreen() {
        let mainScreen = TabBarViewController()
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = mainScreen
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
    
    
}
