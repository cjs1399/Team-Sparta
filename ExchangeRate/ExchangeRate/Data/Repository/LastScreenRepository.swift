//
//  LastScreenRepository.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/23/25.
//

import Foundation

import CoreData

final class LastScreenRepository: LastScreenRepositoryInterface {
    private let context = CoreDataStack.shared.context

    func save(screen: LastViewedScreen) {
        deleteExisting() // 항상 1개만 유지
        let entity = LastScreen(context: context)

        switch screen {
        case .list:
            entity.screenType = "list"
        case .calculator(let code):
            entity.screenType = "calculator"
            entity.currencyCode = code
        }

        try? context.save()
    }

    func fetch() -> LastViewedScreen? {
        let request: NSFetchRequest<LastScreen> = LastScreen.fetchRequest()
        guard let last = try? context.fetch(request).first else { return nil }

        if last.screenType == "list" {
            return .list
        } else if let code = last.currencyCode {
            return .calculator(currencyCode: code)
        }
        return nil
    }

    private func deleteExisting() {
        let request: NSFetchRequest<LastScreen> = LastScreen.fetchRequest()
        if let existing = try? context.fetch(request), let target = existing.first {
            context.delete(target)
        }
    }
}
