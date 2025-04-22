//
//  ExchangeRateItemDisplay.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/16/25.
//

import Foundation

/// UI전용 모델이기 때문에 Presentation 계층에 위치
struct ExchangeRateItemDisplay {
    let code: String
    let country: String
    let rate: Double
    var isFavorite: Bool
}
