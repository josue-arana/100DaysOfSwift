//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Josue on 7/11/22.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

    public var wrappedTitle: String {
        title ?? "Uknown Title"
    }
}

extension Movie : Identifiable {

}
