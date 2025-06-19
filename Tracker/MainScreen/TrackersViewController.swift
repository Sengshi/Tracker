//
//  TrackersViewController.swift
//  Tracker
//
//  Created by Денис Кель on 19.06.2025.
//

import UIKit


class TrackersViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let trackerImage = UIImageView(image: UIImage(named: "tracker"))
        view.backgroundColor = .systemBackground
        title = "Трекеры"
    }
}
