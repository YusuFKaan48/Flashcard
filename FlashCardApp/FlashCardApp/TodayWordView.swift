//
//  TodayWordView.swift
//  FlashCardApp
//
//  Created by Yusuf Kaan USTA on 19.05.2023.
//

import Foundation
import UIKit

class TodayWordView: UIView {
    private var wordLabel: UILabel!
    private var translationLabel: UILabel!
    
    let words = ["はい = hai", "いいえ = iie", "優しい = utsukushī", "今日 = kyō","年 = toshi", "水 = mizu", "コーヒー = kōhī", "医者 = isha", "寒い = samui", "眼鏡 = megane", "馬 = uma","警察 = keisatsu", "雪 = yuki", "うさぎ = usagi", "雨 = ame"]
    let translations = ["Yes", "No", "Beatiful", "Today","Year", "Water", "Coffee", "Doctor", "Cold", "Glasses", "Horse","Police", "Snow", "Rabbit", "Rain"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
        loadSavedWord()
        scheduleWordUpdate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 0, height: 128)
    }
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 16 
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemIndigo.cgColor
        
        wordLabel = UILabel()
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        wordLabel.font = UIFont.systemFont(ofSize: 24)
        wordLabel.textAlignment = .center
        addSubview(wordLabel)
        
        translationLabel = UILabel()
        translationLabel.translatesAutoresizingMaskIntoConstraints = false
        translationLabel.font = UIFont.systemFont(ofSize: 18)
        translationLabel.textAlignment = .center
        addSubview(translationLabel)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            wordLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            wordLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            wordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            wordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            translationLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 8),
            translationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            translationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            translationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func loadSavedWord() {
        let savedIndex = UserDefaults.standard.integer(forKey: "SelectedWordIndex")
        if savedIndex < words.count {
            let word = words[savedIndex]
            let translation = translations[savedIndex]
            
            wordLabel.text = word
            translationLabel.text = translation
        } else {
            selectRandomWord()
        }
    }
    
    private func selectRandomWord() {
        let randomIndex = Int.random(in: 0..<words.count)
        let word = words[randomIndex]
        let translation = translations[randomIndex]
        
        wordLabel.text = word
        translationLabel.text = translation
        
        UserDefaults.standard.set(randomIndex, forKey: "SelectedWordIndex")
    }
    
    private func scheduleWordUpdate() {
        let twentyFourHoursInSeconds: TimeInterval = 24 * 60 * 60
        DispatchQueue.main.asyncAfter(deadline: .now() + twentyFourHoursInSeconds) { [weak self] in
            self?.selectRandomWord()
            self?.scheduleWordUpdate()
        }
    }
}
