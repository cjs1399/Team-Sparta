//
//  ToggleFavoriteCurrencyUseCase.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/22/25.
//

import Foundation

protocol ToggleFavoriteCurrencyUseCase {
    func execute(code: String, isFavorite: Bool)
}

final class ToggleFavoriteCurrencyUseCaseImpl: ToggleFavoriteCurrencyUseCase {
    private let repository: FavoriteCurrencyRepositoryInterface

    init(repository: FavoriteCurrencyRepositoryInterface) {
        self.repository = repository
    }

    func execute(code: String, isFavorite: Bool) {
        if isFavorite {
            repository.save(code: code)
        } else {
            repository.delete(code: code)
        }
    }
}
