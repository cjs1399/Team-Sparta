//
//  ExchangeRateService.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/16/25.
//

import Foundation
import RxSwift

final class ExchangeRateService {

    func fetchExchangeRates(baseCurrency: String = "KRW") -> Single<ExchangeRateResponse> {
        return Single.create { single in
            let urlString = "https://open.er-api.com/v6/latest/\(baseCurrency)"
            guard let url = URL(string: urlString) else {
                single(.failure(NetworkError.invalidURL))
                return Disposables.create()
            }

            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    single(.failure(error))
                    return
                }

                guard let data = data else {
                    single(.failure(NetworkError.emptyData))
                    return
                }

                do {
                    let decoded = try JSONDecoder().decode(ExchangeRateResponse.self, from: data)
                    single(.success(decoded))
                } catch {
                    single(.failure(error))
                }
            }

            task.resume()
            return Disposables.create { task.cancel() }
        }
    }
}
