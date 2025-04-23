//
//  UIBarButtonItem+.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/17/25.
//

import UIKit

extension UIBarButtonItem {
    static func customBack(title: String, target: Any?, action: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        button.tintColor = .systemBlue
        button.semanticContentAttribute = .forceLeftToRight
        button.addTarget(target, action: action, for: .touchUpInside)
        
        return UIBarButtonItem(customView: button)
    }
}
