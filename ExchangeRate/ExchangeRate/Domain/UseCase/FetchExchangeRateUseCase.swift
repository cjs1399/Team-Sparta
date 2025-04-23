//
//  FetchExchangeRateUseCase.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/17/25.
//

import Foundation

import RxSwift

protocol FetchExchangeRateUseCase {
    func execute(base: String) -> Single<ExchangeRateResponse>
}

final class FetchExchangeRateUseCaseImpl: FetchExchangeRateUseCase {
    private let repository: ExchangeRateRepositoryInterface

    init(repository: ExchangeRateRepositoryInterface) {
        self.repository = repository
    }

    func execute(base: String) -> Single<ExchangeRateResponse> {
        return repository.fetchExchangeRate(base: base)
    }
}
