//
//  TodayWordView.swift
//  FlashCardApp
//
//  Created by Yusuf Kaan USTA on 19.05.2023.
//

import Foundation
import UIKit

class TodayWordView: UIView {
    private var wordLabels: [UILabel] = []
    private var translationLabels: [UILabel] = []
    
    let words = ["はい = hai", "いいえ = iie", "優しい = utsukushī", "今日 = kyō","年 = toshi", "水 = mizu", "コーヒー = kōhī", "医者 = isha", "寒い = samui", "眼鏡 = megane", "馬 = uma","警察 = keisatsu", "雪 = yuki", "うさぎ = usagi", "雨 = ame"]
    let translations = ["Yes", "No", "Beatiful", "Today","Year", "Water", "Coffee", "Doctor", "Cold", "Glasses", "Horse","Police", "Snow", "Rabbit", "Rain"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
        loadSavedWords()
        scheduleWordUpdate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 16
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemIndigo.cgColor
    }
    
    private func layout() {
        var previousTranslationLabel: UILabel?
        
        for i in 0..<5 {
            let wordLabel = UILabel()
            wordLabel.translatesAutoresizingMaskIntoConstraints = false
            wordLabel.font = UIFont.systemFont(ofSize: 24)
            wordLabel.textAlignment = .center
            wordLabel.numberOfLines = 0
            wordLabels.append(wordLabel)
            addSubview(wordLabel)
            
            let translationLabel = UILabel()
            translationLabel.translatesAutoresizingMaskIntoConstraints = false
            translationLabel.font = UIFont.systemFont(ofSize: 18)
            translationLabel.textAlignment = .center
            translationLabel.numberOfLines = 0
            translationLabels.append(translationLabel)
            addSubview(translationLabel)
            
            if let previousTranslationLabel = previousTranslationLabel {
                let dividerLabel = UILabel()
                dividerLabel.translatesAutoresizingMaskIntoConstraints = false
                dividerLabel.text = "—"
                dividerLabel.font = UIFont.systemFont(ofSize: 18)
                dividerLabel.textColor = UIColor.systemIndigo
                dividerLabel.textAlignment = .center
                addSubview(dividerLabel)
                
                NSLayoutConstraint.activate([
                    dividerLabel.topAnchor.constraint(equalTo: previousTranslationLabel.bottomAnchor, constant: 16),
                    dividerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                    dividerLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
                    dividerLabel.heightAnchor.constraint(equalToConstant: 20)
                ])
                
                NSLayoutConstraint.activate([
                    wordLabel.topAnchor.constraint(equalTo: dividerLabel.bottomAnchor, constant: 16),
                    wordLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                    translationLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 8),
                    translationLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
            } else {
                NSLayoutConstraint.activate([
                    wordLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                    wordLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                    translationLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 8),
                    translationLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
            }
            
            previousTranslationLabel = translationLabel
        }
    }

    
    private func loadSavedWords() {
        guard let savedWordIndices = UserDefaults.standard.array(forKey: "SelectedWordIndices") as? [Int],
              savedWordIndices.count == 5 else {
            selectRandomWords()
            return
        }
        
        for i in 0..<5 {
            let index = savedWordIndices[i]
            if index < words.count {
                let word = words[index]
                let translation = translations[index]
                wordLabels[i].text = word
                translationLabels[i].text = translation
            } else {
                selectRandomWords()
                return
            }
        }
    }
    
    private func selectRandomWords() {
        var selectedWordIndices = Set<Int>()
        while selectedWordIndices.count < 5 {
            let randomIndex = Int.random(in: 0..<words.count)
            selectedWordIndices.insert(randomIndex)
        }
        
        for i in 0..<5 {
            let index = Array(selectedWordIndices)[i]
            let word = words[index]
            let translation = translations[index]
            
            wordLabels[i].text = word
            translationLabels[i].text = translation
        }
        
        UserDefaults.standard.set(Array(selectedWordIndices), forKey: "SelectedWordIndices")
    }
    
    private func scheduleWordUpdate() {
        let twentyFourHoursInSeconds: TimeInterval = 24 * 60 * 60
        DispatchQueue.main.asyncAfter(deadline: .now() + twentyFourHoursInSeconds) { [weak self] in
            self?.selectRandomWords()
            self?.scheduleWordUpdate()
        }
    }
}
