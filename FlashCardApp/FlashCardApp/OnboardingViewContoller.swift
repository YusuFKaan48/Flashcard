//
//  OnboardingViewContoller.swift
//  FlashCardApp
//
//  Created by Yusuf Kaan USTA on 17.05.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView()
    let titleNameView = UILabel()
    let labelTextView = UILabel()
    
    let titleName: String
    let labelText: String
    
    init(titleName: String, labelText: String) {
        self.titleName = titleName
        self.labelText = labelText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented - not using storyboards")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension OnboardingViewController {
    func style() {
        view.backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        // titleLabel
        titleNameView.translatesAutoresizingMaskIntoConstraints = false
        titleNameView.textAlignment = .center
        titleNameView.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleNameView.adjustsFontForContentSizeCategory = true
        titleNameView.numberOfLines = 0
        titleNameView.text = titleName
        
        // labelTextLabel
        labelTextView.translatesAutoresizingMaskIntoConstraints = false
        labelTextView.textAlignment = .center
        labelTextView.font = UIFont.preferredFont(forTextStyle: .title3)
        labelTextView.adjustsFontForContentSizeCategory = true
        labelTextView.numberOfLines = 0
        labelTextView.text = labelText
    }
    
    func layout() {
        stackView.addArrangedSubview(titleNameView)
        stackView.addArrangedSubview(labelTextView)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}
