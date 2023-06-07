//
//  NewsModelManager.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 07/06/2023.
//


import Foundation
import CoreData

class NewsModelManager : NSObject, ObservableObject {

    static let shared: NewsModelManager = NewsModelManager()

    var newsModelList = [NewsModel]()
    private let fetchedResultsController: NSFetchedResultsController<NewsModel>

    private override init() {
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<NewsModel> = NewsModel.fetchRequest()

        //Predicate
        //fetchRequest.predicate = NSPredicate(format: "gender == true")

        // Configure Fetch Request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]

        // lấy Managed Object Context
        let managedContext = CoreDataStack.shared.managedContext

        fetchedResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: managedContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )

        super.init()

        fetchedResultsController.delegate = self

        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }

    func add() {

    }

    func update() {

    }

    func delete() {

    }
}

extension NewsModelManager: NSFetchedResultsControllerDelegate {
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let newsList = controller.fetchedObjects as? [NewsModel] else { return }
        print("Context has change, reloading news")
        self.newsModelList = newsList
    }
}
