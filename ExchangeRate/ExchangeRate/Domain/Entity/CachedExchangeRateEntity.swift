//
//  CachedExchangeRateEntity.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/22/25.
//

import Foundation

struct CachedExchangeRateEntity {
    let currencyCode: String
    let rate: Double
    let timeUnix: Int
}

struct RateChangeResult {
    let currencyCode: String
    let direction: RateChangeDirection
}
