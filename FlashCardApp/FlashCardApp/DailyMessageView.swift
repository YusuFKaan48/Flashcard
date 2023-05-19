//
//  DailyMessageView.swift
//  FlashCardApp
//
//  Created by Yusuf Kaan USTA on 19.05.2023.
//

import Foundation
import UIKit

class DailyMessageView: UIView {
    
    let stackView = UIStackView()
    let messageLabel = UILabel()
    let iconImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
        
        updateMessageAndIcon()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        messageLabel.textAlignment = .center
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .systemIndigo
    }
    
    func layout() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(messageLabel)
        stackView.addArrangedSubview(iconImageView)
    
        // StackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
           iconImageView.widthAnchor.constraint(equalToConstant: 120),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),


            
            messageLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            
            trailingAnchor.constraint(equalToSystemSpacingAfter: iconImageView.trailingAnchor, multiplier: 1),
        ])
    }
    
    var imageName: String = "" {
            didSet {
                iconImageView.image = UIImage(systemName: imageName)
            }
        }
    
    private func updateMessageAndIcon() {
        let currentHour = Calendar.current.component(.hour, from: Date())

        var message = ""
        var symbolName = ""

        if currentHour >= 0 && currentHour < 12 {
            message = "Good Morning"
            symbolName = "sun.max.fill"
        } else if currentHour >= 12 && currentHour < 18 {
            message = "Good Afternoon"
           symbolName = "cloud.sun.fill"
        } else {
            message = "Good Night"
            symbolName = "moon.stars.fill"
        }

        messageLabel.text = message
        imageName = symbolName
    }
}

