//
//  SaveLastScreenUseCase.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/23/25.
//

import Foundation

protocol SaveLastScreenUseCase {
    func execute(screen: LastViewedScreen)
}

final class SaveLastScreenUseCaseImpl: SaveLastScreenUseCase {
    private let repository: LastScreenRepositoryInterface
    init(repository: LastScreenRepositoryInterface) {
        self.repository = repository
    }
    func execute(screen: LastViewedScreen) {
        repository.save(screen: screen)
    }
}
