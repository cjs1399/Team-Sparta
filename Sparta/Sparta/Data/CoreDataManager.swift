//
//  CoreDataManager.swift
//  sparta
//
//  Created by 천성우 on 3/6/25.
//

import UIKit

import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()

    private init() {}

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "sparta")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data 로드 실패: \(error)")
            }
        }
        return container
    }()

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Core Data 저장 실패: \(error)")
            }
        }
    }

    func saveDrawupData(image: UIImage, text: String) {
        let newDrawup = DrawupData(context: context)
        newDrawup.text = text
        newDrawup.imageData = image.pngData()
        newDrawup.createdAt = Date()
        saveContext()
        print(image, text)
    }

    func fetchDrawupData() -> [DrawupData] {
        let request: NSFetchRequest<DrawupData> = DrawupData.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Core Data 불러오기 실패: \(error)")
            return []
        }
    }
}
