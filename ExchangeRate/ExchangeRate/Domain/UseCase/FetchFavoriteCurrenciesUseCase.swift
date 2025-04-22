//
//  FetchFavoriteCurrenciesUseCase.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/22/25.
//

import Foundation

protocol FetchFavoriteCurrenciesUseCase {
    func execute() -> [FavoriteCurrencyEntity]
}

final class FetchFavoriteCurrenciesUseCaseImpl: FetchFavoriteCurrenciesUseCase {
    private let repository: FavoriteCurrencyRepositoryInterface

    init(repository: FavoriteCurrencyRepositoryInterface) {
        self.repository = repository
    }

    func execute() -> [FavoriteCurrencyEntity] {
        return repository.fetch()
    }
}
