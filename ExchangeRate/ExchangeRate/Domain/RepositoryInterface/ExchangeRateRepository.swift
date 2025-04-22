//
//  ExchangeRateRepositoryInterface.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/17/25.
//

import Foundation

import RxSwift

protocol ExchangeRateRepositoryInterface {
    func fetchExchangeRate(base: String) -> Single<ExchangeRateResponse>
}
