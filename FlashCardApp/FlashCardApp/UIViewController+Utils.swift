//
//  UIViewController+Utils.swift
//  FlashCardApp
//
//  Created by Yusuf Kaan USTA on 18.05.2023.
//

import UIKit

extension UIViewController {    
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
