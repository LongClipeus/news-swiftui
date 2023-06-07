//
//  CoreDataTestViewModel.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 05/06/2023.
//


import Foundation
import CoreData
import UIKit


class CoreDataTestViewModel: ObservableObject {

    @Published var items: [NewsModel] = []

    private let managedContext = CoreDataStack.shared.managedContext

    init() {
        fetchItems()
    }

    func fetchItems() {
        let fetchRequest: NSFetchRequest<NewsModel> = NewsModel.fetchRequest()
        do {
            items = try managedContext.fetch(fetchRequest)
        } catch {
            print("Error fetching items: \(error)")
        }
    }

    func addItem() {
        let newItem = NewsModel(context: managedContext)
        newItem.date = Date()

        CoreDataStack.shared.saveContext()
        fetchItems()
    }

    func deleteNews(offsets: IndexSet) {
        offsets.map { items[$0] }.forEach(managedContext.delete)
        CoreDataStack.shared.saveContext()
        fetchItems()
    }

}
