//
//  LoadLastScreenUseCase.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/23/25.
//

import Foundation

protocol LoadLastScreenUseCase {
    func execute() -> LastViewedScreen?
}

final class LoadLastScreenUseCaseImpl: LoadLastScreenUseCase {
    private let repository: LastScreenRepositoryInterface
    init(repository: LastScreenRepositoryInterface) {
        self.repository = repository
    }
    func execute() -> LastViewedScreen? {
        return repository.fetch()
    }
}
