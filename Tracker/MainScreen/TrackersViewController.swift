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
    
    private let dateButton = UIButton(type: .system)
    private let hiddenTextField = UITextField()
    private let datePicker = UIDatePicker()
    
    private let searchTextField = UISearchBar()
    
    let formatter = DateFormatter()
    
    var categories: [TrackerCategory] = []
    var completedTrackers: [TrackerRecord] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupClearLogo()
        setupClearText()
        setupFormLabel()
//        setupAddTrackerButton()
//        setupDateField()
        setupSearchField()
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
    
    private func setupDateField() {
        formatter.dateFormat = "dd.MM.yy"
        
        // Настройка UIDatePicker
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datePicker)
        
        // Настройка кнопки
                dateButton.setTitle(formatter.string(from: Date()), for: .normal)
                dateButton.setTitleColor(.black, for: .normal)
                dateButton.titleLabel?.font = .systemFont(ofSize: 17)
                dateButton.contentHorizontalAlignment = .center
                dateButton.addTarget(self, action: #selector(dateButtonTapped), for: .touchUpInside)
                dateButton.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
                dateButton.layer.cornerRadius = 8
                dateButton.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(dateButton)
        
        // Настройка скрытого поля
        //        view.addSubview(hiddenTextField)
        //        hiddenTextField.inputView = datePicker
        //        hiddenTextField.isHidden = true
        
    }
    
    private func setupSearchField() {
        searchTextField.placeholder = "Поиск"
        searchTextField.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        
//        searchTextField.backgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchTextField)
    }
    
    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = addButton
        
        dateButton = UIBarButtonItem(title: formattedDate(Date()), style: .plain, target: self, action: #selector(dateButtonTapped))
        navigationItem.rightBarButtonItem = dateButton
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
            datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 49),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            datePicker.widthAnchor.constraint(equalToConstant: 77),
//            datePicker.heightAnchor.constraint(equalToConstant: 34),
            searchTextField.topAnchor.constraint(equalTo: formLabel.bottomAnchor, constant: 7),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchTextField.heightAnchor.constraint(equalToConstant: 36),

        ])
        
    }
    
    @objc private func dateButtonTapped() {
        hiddenTextField.becomeFirstResponder()
    }
    
    @objc private func addTapped() {
        //
    }
    
//    @objc private func dateButtonTapped() {
//        hiddenTextField.becomeFirstResponder()
//    }
    @objc private func dateButtonTapped() {

    }

    @objc private func dateChanged(_ sender: UIDatePicker) {
        dateButton.title = formattedDate(sender.date)
    }
    
    private func formattedDate(_ date: Date) -> String {
        
    }
//    @objc private func dateChanged(_ sender: UIDatePicker) {
//        formatter.dateFormat = "dd.MM.yy"
//        dateButton.setTitle(formatter.string(from: sender.date), for: .normal)
//        
//        // Обновляем данные под новую дату
//        //        collectionView.reloadData()
//    }
}
