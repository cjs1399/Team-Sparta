//
//  ExchangeRateRepositoryImpl.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/17/25.
//

import Foundation

import RxSwift

final class ExchangeRateRepositoryImpl: ExchangeRateRepositoryInterface {
    private let service: ExchangeRateService

    init(service: ExchangeRateService = ExchangeRateService()) {
        self.service = service
    }

    func fetchExchangeRate(base: String) -> Single<ExchangeRateResponse> {
        return service.fetchExchangeRates(baseCurrency: base)
    }
}
