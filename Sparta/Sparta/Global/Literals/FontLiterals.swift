//
//  FontLiterals.swift
//  sparta
//
//  Created by 천성우 on 3/6/25.
//

import UIKit

enum AppleSDGothicNeo: String {
    case bold = "AppleSDGothicNeo-Bold"
    case medium = "AppleSDGothicNeo-Medium"
    case regular = "AppleSDGothicNeo-Regular"
}

enum FontLevel {
    case titleLabel
    case subTitleLabel
}

extension FontLevel {
    var fontWeight: String {
        switch self {
        case .titleLabel:
            return AppleSDGothicNeo.bold.rawValue
        case .subTitleLabel:
            return AppleSDGothicNeo.regular.rawValue
        }
    }
    
    var fontSize: CGFloat {
        switch self {
        case .titleLabel:
            return 17
        case .subTitleLabel:
            return 15

        }
    }
}

extension UIFont {
    static func fontGuide(_ fontLevel: FontLevel) -> UIFont {
        return UIFont(name: fontLevel.fontWeight, size: fontLevel.fontSize)!
    }
}
