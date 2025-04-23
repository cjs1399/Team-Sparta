//
//  FavoriteCurrencyRepository.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/22/25.
//

import Foundation

import CoreData

final class FavoriteCurrencyRepository: FavoriteCurrencyRepositoryInterface {

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataStack.shared.context) {
        self.context = context
    }

    func fetch() -> [FavoriteCurrencyEntity] {
        let request: NSFetchRequest<FavoriteCurrency> = FavoriteCurrency.fetchRequest()
        let result = try? context.fetch(request)
        return result?.map { FavoriteCurrencyEntity(code: $0.currencyCode ?? "") } ?? []
    }

    func save(code: String) {
        guard !isFavorite(code: code) else { return }
        let favorite = FavoriteCurrency(context: context)
        favorite.currencyCode = code
        try? context.save()
    }

    func delete(code: String) {
        let request: NSFetchRequest<FavoriteCurrency> = FavoriteCurrency.fetchRequest()
        request.predicate = NSPredicate(format: "currencyCode == %@", code)

        if let result = try? context.fetch(request), let target = result.first {
            context.delete(target)
            try? context.save()
        }
    }

    func isFavorite(code: String) -> Bool {
        let request: NSFetchRequest<FavoriteCurrency> = FavoriteCurrency.fetchRequest()
        request.predicate = NSPredicate(format: "currencyCode == %@", code)
        let count = (try? context.count(for: request)) ?? 0
        return count > 0
    }
}
