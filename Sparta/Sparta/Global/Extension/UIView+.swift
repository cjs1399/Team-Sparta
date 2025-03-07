//
//  UIView+.swift
//  sparta
//
//  Created by 천성우 on 3/6/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
