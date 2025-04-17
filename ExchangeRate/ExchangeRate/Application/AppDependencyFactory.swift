//
//  AppDependencyFactory.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/17/25.
//

import Foundation

final class AppDependencyFactory {
    
    static func makeExchangeRateViewModel() -> ExchangeRateViewModel {
        let service = ExchangeRateService()
        let repository = ExchangeRateRepositoryImpl(service: service)
        let useCase = FetchExchangeRateUseCaseImpl(repository: repository)
        return ExchangeRateViewModel(fetchUseCase: useCase)
    }

    static func makeExchangeCalculatorViewModel(item: ExchangeRateItemDisplay) -> ExchangeCalculatorViewModel {
        return ExchangeCalculatorViewModel(selectedItem: item)
    }
}
