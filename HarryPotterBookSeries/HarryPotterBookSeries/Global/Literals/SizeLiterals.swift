//
//  SizeLiterals.swift
//  sparta
//
//  Created by 천성우 on 3/6/25.
//

import UIKit

struct SizeLiterals {
    struct Screen {
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        static let screenHeight: CGFloat = UIScreen.main.bounds.height
        static let deviceRatio: CGFloat = screenWidth / screenHeight
    }
}
