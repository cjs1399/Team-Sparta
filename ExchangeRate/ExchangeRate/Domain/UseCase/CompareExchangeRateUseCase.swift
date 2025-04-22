//
//  CompareExchangeRateUseCase.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/22/25.
//

import Foundation

protocol CompareExchangeRateUseCase {
    func execute(newItems: [ExchangeRateItemEntity], timeUnix: Int) throws -> [String: RateChangeDirection]
}

final class CompareExchangeRateUseCaseImpl: CompareExchangeRateUseCase {
    private let repository: CachedExchangeRateRepositoryInterface

    init(repository: CachedExchangeRateRepositoryInterface) {
        self.repository = repository
    }

    func execute(newItems: [ExchangeRateItemEntity], timeUnix: Int) throws -> [String: RateChangeDirection] {
        // 캐싱 필요 없다고 가정 (무조건 비교 강제)
        // guard try repository.isNeedCompare(timeUnix: timeUnix) else { return [:] }

        var result: [String: RateChangeDirection] = [:]

        for item in newItems {
            /// 임시로 무조건 상승으로 판단되게 Mock
            result[item.currencyCode] = .up

            // 기존 캐시 저장은 유지
            try repository.save(currencyCode: item.currencyCode, rate: item.rate, timeUnix: timeUnix)
        }
        
//        for item in newItems {
//            // 이전 환율 데이터와 비교해서 방향 판단
//            let direction = try repository.compareCurrency(
//                currencyCode: item.currencyCode,
//                newCurrencyItem: item
//            )
//            result[item.currencyCode] = direction
//
//            // 현재 데이터를 캐시에 저장 (다음 비교를 위해)
//            try repository.save(
//                currencyCode: item.currencyCode,
//                rate: item.rate,
//                timeUnix: timeUnix
//            )
//        }

        return result
    }
}
