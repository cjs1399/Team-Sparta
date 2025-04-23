//
//  LastScreenRepositoryInterface.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/23/25.
//

import Foundation

protocol LastScreenRepositoryInterface {
    func save(screen: LastViewedScreen)
    func fetch() -> LastViewedScreen?
}
