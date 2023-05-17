//
//  OnboardingViewContoller.swift
//  FlashCardApp
//
//  Created by Yusuf Kaan USTA on 17.05.2023.
//

import UIKit

class OnboardingViewContoller: UIViewController {
    
    let stackView = UIStackView()
    let labelTitle = UILabel()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
    }
}

extension OnboardingViewContoller {
    
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.textAlignment = .center
        labelTitle.font = UIFont.preferredFont(forTextStyle: .title1)
        labelTitle.adjustsFontForContentSizeCategory = true
        labelTitle.numberOfLines = 0
        labelTitle.text = "Tutorial"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "When the question mark button is pressed, the card flips over and the meaning of the word is displayed."
    }
    
    func layout() {
        stackView.addArrangedSubview(labelTitle)
        stackView.addArrangedSubview(label)
        stackView.spacing = 20
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
                   stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                   stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
                   view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
               ])
    }
}
