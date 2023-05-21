//
//  HouseViewController.swift
//  FlashCardApp
//
//  Created by Yusuf Kaan USTA on 19.05.2023.
//

import UIKit

class HouseViewController: UIViewController {
    
    let dailyMessageView = DailyMessageView()
    let dividerView = UIView()
    let todayWordLabel = UILabel()
    let todayWordView = TodayWordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension HouseViewController {
    
    func style() {
        
        dailyMessageView.translatesAutoresizingMaskIntoConstraints = false
        todayWordView.translatesAutoresizingMaskIntoConstraints = false
        todayWordLabel.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        
        dividerView.backgroundColor = .secondarySystemFill
    
        todayWordLabel.translatesAutoresizingMaskIntoConstraints = false
        todayWordLabel.textAlignment = .center
        todayWordLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        todayWordLabel.adjustsFontForContentSizeCategory = true
        todayWordLabel.text = "Todays's Words"
    }
    
    func layout() {
        
        view.addSubview(dailyMessageView)
        view.addSubview(dividerView)
        view.addSubview(todayWordLabel)
        view.addSubview(todayWordView)
        
        NSLayoutConstraint.activate([
            dailyMessageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: todayWordLabel.bottomAnchor, constant: -56),
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            todayWordLabel.topAnchor.constraint(equalTo: dailyMessageView.bottomAnchor, constant: 24),
            todayWordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            todayWordView.topAnchor.constraint(equalTo: todayWordLabel.bottomAnchor, constant: 16),
            todayWordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            todayWordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
