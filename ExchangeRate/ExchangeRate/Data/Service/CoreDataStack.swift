//
//  CoreDataStack.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/22/25.
//

import Foundation

import CoreData

final class CoreDataStack {
    static let shared = CoreDataStack()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ExchangeRateModel")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("CoreData 오류: \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
