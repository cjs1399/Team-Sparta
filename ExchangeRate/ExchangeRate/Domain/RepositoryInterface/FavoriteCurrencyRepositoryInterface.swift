//
//  FavoriteCurrencyRepositoryInterface.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/22/25.
//

import Foundation

protocol FavoriteCurrencyRepositoryInterface {
    func fetch() -> [FavoriteCurrencyEntity]
    func save(code: String)
    func delete(code: String)
    func isFavorite(code: String) -> Bool
}
