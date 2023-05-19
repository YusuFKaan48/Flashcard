//
//  HouseViewController.swift
//  FlashCardApp
//
//  Created by Yusuf Kaan USTA on 19.05.2023.
//

import UIKit

class HouseViewController: UIViewController {
    
    let dailyMessageView = DailyMessageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension HouseViewController {
    
    func style() {
        dailyMessageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        
        view.addSubview(dailyMessageView)
        NSLayoutConstraint.activate([
            dailyMessageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dailyMessageView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: dailyMessageView.trailingAnchor, multiplier: 2)
        ])
    }
}
