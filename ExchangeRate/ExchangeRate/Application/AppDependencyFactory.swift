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
        let exchangeRateRepo = ExchangeRateRepositoryImpl(service: service)
        let fetchUseCase = FetchExchangeRateUseCaseImpl(repository: exchangeRateRepo)

        let favoriteRepo = FavoriteCurrencyRepository(context: CoreDataStack.shared.context)
        let fetchFavoriteUseCase = FetchFavoriteCurrenciesUseCaseImpl(repository: favoriteRepo)
        let toggleFavoriteUseCase = ToggleFavoriteCurrencyUseCaseImpl(repository: favoriteRepo)

        let cachedRepo = CachedExchangeRateRepository(context: CoreDataStack.shared.context)
        let compareUseCase = CompareExchangeRateUseCaseImpl(repository: cachedRepo)

        return ExchangeRateViewModel(
            fetchUseCase: fetchUseCase,
            fetchFavoriteUseCase: fetchFavoriteUseCase,
            toggleFavoriteUseCase: toggleFavoriteUseCase,
            compareUseCase: compareUseCase
        )
    }

    static func makeExchangeCalculatorViewModel(item: ExchangeRateItemDisplay) -> ExchangeCalculatorViewModel {
        return ExchangeCalculatorViewModel(selectedItem: item)
    }

    // MARK: - Repository / UseCase 개별 생성

    static func makeFavoriteCurrencyRepository() -> FavoriteCurrencyRepositoryInterface {
        return FavoriteCurrencyRepository(context: CoreDataStack.shared.context)
    }

    static func makeFetchFavoriteCurrenciesUseCase() -> FetchFavoriteCurrenciesUseCase {
        return FetchFavoriteCurrenciesUseCaseImpl(repository: makeFavoriteCurrencyRepository())
    }

    static func makeCompareExchangeRateUseCase() -> CompareExchangeRateUseCase {
        let cachedRepo = CachedExchangeRateRepository(context: CoreDataStack.shared.context)
        return CompareExchangeRateUseCaseImpl(repository: cachedRepo)
    }
}
