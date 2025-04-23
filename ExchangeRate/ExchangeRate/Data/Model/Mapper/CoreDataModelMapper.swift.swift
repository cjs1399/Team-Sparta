//
//  CoreDataModelMapper.swift.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/22/25.
//

import Foundation

struct CoreDataModelMapper {
    static func toEntity(_ model: CachedExchangeRate) -> CachedExchangeRateEntity {
        return CachedExchangeRateEntity(
            currencyCode: model.currencyCode ?? "",
            rate: model.rate,
            timeUnix: Int(model.timeUnix)
        )
    }
}
