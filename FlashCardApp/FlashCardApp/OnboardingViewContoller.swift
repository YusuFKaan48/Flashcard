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
    
    let titleName: String
    let labelText: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
    }
    
    init(titleName: String, labelText: String) {
        self.titleName = titleName
        self.labelText = labelText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardingViewContoller {
    
    func style() {
        view.backgroundColor = .systemBackground
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.textAlignment = .center
        labelTitle.font = UIFont.preferredFont(forTextStyle: .title1)
        labelTitle.adjustsFontForContentSizeCategory = true
        labelTitle.numberOfLines = 0
        labelTitle.text = titleName
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = labelText
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
