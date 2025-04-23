//
//  CachedExchangeRateRepository.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/22/25.
//

import Foundation

import CoreData

final class CachedExchangeRateRepository: CachedExchangeRateRepositoryInterface {

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataStack.shared.context) {
        self.context = context
    }

    func fetchAll() -> [CachedExchangeRateEntity] {
        let request: NSFetchRequest<CachedExchangeRate> = CachedExchangeRate.fetchRequest()
        let result = try? context.fetch(request)
        return result?.map(CoreDataModelMapper.toEntity) ?? []
    }

    
    func isNeedCompare(timeUnix: Int) throws -> Bool {
        let cached = try context.fetch(CachedExchangeRate.fetchRequest())
        guard let latest = cached.first else { return true }

        let calendar = Calendar.current
        let newDate = Date(timeIntervalSince1970: TimeInterval(timeUnix))
        let cachedDate = Date(timeIntervalSince1970: TimeInterval(latest.timeUnix))

        let isSameDay = calendar.isDate(newDate, inSameDayAs: cachedDate)
        return !isSameDay
    }

    func compareCurrency(currencyCode: String, newCurrencyItem: ExchangeRateItemEntity) throws -> RateChangeDirection {
        let request: NSFetchRequest<CachedExchangeRate> = CachedExchangeRate.fetchRequest()
        request.predicate = NSPredicate(format: "currencyCode == %@", currencyCode)

        guard let cached = try context.fetch(request).first else {
            return .none
        }

        let diff = newCurrencyItem.rate - cached.rate
        return abs(diff) > 0.01
            ? (diff > 0 ? .up : .down)
            : .none
    }
    
    func save(currencyCode: String?, rate: Double, timeUnix: Int) throws {
        guard let code = currencyCode, !code.isEmpty else {
            print("currencyCode가 nil이거나 빈 값입니다.")
            return
        }

        let cached = CachedExchangeRate(context: context)
        cached.currencyCode = code
        cached.rate = rate
        cached.timeUnix = Int64(timeUnix)

        try context.save()
    }
    
    func fetchRate(for code: String) -> Double? {
        let request: NSFetchRequest<CachedExchangeRate> = CachedExchangeRate.fetchRequest()
        request.predicate = NSPredicate(format: "currencyCode == %@", code)

        if let cached = try? context.fetch(request).first {
            return cached.rate
        }

        return nil
    }
}
