//
//  UIStackView+.swift
//  HarryPotterBookSeries
//
//  Created by 천성우 on 3/28/25.
//

import UIKit


extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
