//
//  UIResponder+.swift
//  sparta
//
//  Created by 천성우 on 3/6/25.
//

import UIKit

extension UIResponder {
    
    private struct Static {
        static weak var responder: UIResponder?
    }
    
    static var currentResponder: UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
        return Static.responder
    }
    
    @objc private func _trap() {
        Static.responder = self
    }
}
