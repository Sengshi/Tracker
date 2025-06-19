//
//  TrackersViewController.swift
//  Tracker
//
//  Created by Денис Кель on 19.06.2025.
//

import UIKit


class TrackersViewController: UIViewController {
    
    private let logoImage = UIImageView()
    private let textClear = UILabel()
    private let formLabel = UILabel()
    private let addTrackerButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupClearLogo()
        setupClearText()
        setupFormLabel()
        setupAddTrackerButton()
        setupConstraint()
    }
    
    private func setupClearLogo() {
        logoImage.image = UIImage(named: "clearLogo")
        logoImage.contentMode = .scaleAspectFit
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImage)
    }
    
    private func setupClearText(){
        textClear.text = "Что будем отслеживать?"
        textClear.textAlignment = .center
        textClear.font = .systemFont(ofSize: 12, weight: .medium)
        textClear.textColor = UIColor(red: 26/255, green: 27/255, blue: 34/255, alpha: 1)
        textClear.translatesAutoresizingMaskIntoConstraints = false
        textClear.accessibilityIdentifier = "textClearLabel"
        view.addSubview(textClear)

    }
    
    private func setupFormLabel() {
        formLabel.text = "Трекеры"
        formLabel.textAlignment = .left
        formLabel.font = .systemFont(ofSize: 34, weight: .bold)
        formLabel.textColor = UIColor(red: 26/255, green: 27/255, blue: 34/255, alpha: 1)
        formLabel.translatesAutoresizingMaskIntoConstraints = false
        formLabel.accessibilityIdentifier = "formLabel"
        view.addSubview(formLabel)
    }
    
    private func setupAddTrackerButton() {
        addTrackerButton.setImage(UIImage(named: "add_tracker"), for: .normal)
        addTrackerButton.translatesAutoresizingMaskIntoConstraints = false
        addTrackerButton.accessibilityIdentifier = "addTrackerButton"
        view.addSubview(addTrackerButton)

    }
    
    
    
    private func setupConstraint (){
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 80),
            logoImage.heightAnchor.constraint(equalToConstant: 80),
            textClear.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 8),
            textClear.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textClear.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textClear.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            addTrackerButton.widthAnchor.constraint(equalToConstant: 42),
            addTrackerButton.heightAnchor.constraint(equalToConstant: 42),
            addTrackerButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            addTrackerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            formLabel.topAnchor.constraint(equalTo: addTrackerButton.bottomAnchor, constant: 1),
            formLabel.leadingAnchor.constraint(equalTo: addTrackerButton.leadingAnchor, constant: 10),
//            formLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            formLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])

    }
}
