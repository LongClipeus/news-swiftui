//
//  NewsModel+CoreDataProperties.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 02/06/2023.
//

//

import Foundation
import CoreData


extension NewsModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsModel> {
        return NSFetchRequest<NewsModel>(entityName: "NewsModel")
    }

    @NSManaged public var author: String?
    @NSManaged public var date: Date?
    @NSManaged public var descriptionNews: String?
    @NSManaged public var id: String?
    @NSManaged public var image: String?
    @NSManaged public var section: String?
    @NSManaged public var text: String?
    @NSManaged public var thumbnail: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?

}

extension NewsModel : Identifiable {

}
