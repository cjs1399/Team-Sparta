//
//  AppDependencyFactory.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/17/25.
//

import UIKit

import CoreData

final class AppDependencyFactory {
    
    static func makeExchangeRateViewModel() -> ExchangeRateViewModel {
        let service = ExchangeRateService()
        let repository = ExchangeRateRepositoryImpl(service: service)
        let useCase = FetchExchangeRateUseCaseImpl(repository: repository)

        let favoriteRepo = FavoriteCurrencyRepository(context: CoreDataStack.shared.context)
        let fetchFavoriteUseCase = FetchFavoriteCurrenciesUseCaseImpl(repository: favoriteRepo)
        let toggleFavoriteUseCase = ToggleFavoriteCurrencyUseCaseImpl(repository: favoriteRepo)

        return ExchangeRateViewModel(
            fetchUseCase: useCase,
            fetchFavoriteUseCase: fetchFavoriteUseCase,
            toggleFavoriteUseCase: toggleFavoriteUseCase

        )
    }

    static func makeExchangeCalculatorViewModel(item: ExchangeRateItemDisplay) -> ExchangeCalculatorViewModel {
        return ExchangeCalculatorViewModel(selectedItem: item)
    }
    
    static func makeFavoriteCurrencyRepository() -> FavoriteCurrencyRepositoryInterface {
        return FavoriteCurrencyRepository(context: CoreDataStack.shared.context)
    }

    static func makeFetchFavoriteCurrenciesUseCase() -> FetchFavoriteCurrenciesUseCase {
        return FetchFavoriteCurrenciesUseCaseImpl(repository: makeFavoriteCurrencyRepository())
    }
}
