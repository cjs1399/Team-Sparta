//
//  ExchangeRateResponse.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/16/25.
//

import Foundation

struct ExchangeRateResponse: Codable {
    let baseCode: String
    let rates: [String: Double]

    enum CodingKeys: String, CodingKey {
        case baseCode = "base_code"
        case rates
    }
}
