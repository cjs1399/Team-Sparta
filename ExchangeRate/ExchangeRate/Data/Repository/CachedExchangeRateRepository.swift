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

    /// 해당 코드는 하루가 아니라... 1분 단위로 구현이 되어있네요... 수정을 하겠습니다...
    func isNeedCompare(timeUnix: Int) throws -> Bool {
        let cached = try context.fetch(CachedExchangeRate.fetchRequest())
        guard let latest = cached.first else { return true }
        return latest.timeUnix != Int64(timeUnix)
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

    func save(currencyCode: String, rate: Double, timeUnix: Int) throws {
        let cached = CachedExchangeRate(context: context)
        cached.currencyCode = currencyCode
        cached.rate = rate
        cached.timeUnix = Int64(timeUnix)
        try context.save()
    }
}
