//
//  CachedExchangeRateRepositoryInterface.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/22/25.
//

import Foundation

protocol CachedExchangeRateRepositoryInterface {
    func isNeedCompare(timeUnix: Int) throws -> Bool
    func compareCurrency(currencyCode: String, newCurrencyItem: ExchangeRateItemEntity) throws -> RateChangeDirection
    func save(currencyCode: String, rate: Double, timeUnix: Int) throws
}
