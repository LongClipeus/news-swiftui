//
//  CoreDataStack.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 31/05/2023.
//


import Foundation
import CoreData

class CoreDataStack {

    private let dataModelName: String
    private let inMemory: Bool

    private init(modelName: String, inMemory: Bool = false) {
        self.dataModelName = modelName
        self.inMemory = inMemory
    }

    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: dataModelName)

        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Failed to load Core Data stack: \(error)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true

        return container
    }()

    static let shared: CoreDataStack = .init(modelName: "db_model_v1", inMemory: false)

    lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext

    func saveContext() {
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
}
