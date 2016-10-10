//
//  ListOfMovies+CoreDataProperties.swift
//  MyMovies
//
//  Created by Brandon Stark on 10/10/16.
//  Copyright © 2016 training. All rights reserved.
//

import Foundation
import CoreData


extension ListOfMovies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListOfMovies> {
        return NSFetchRequest<ListOfMovies>(entityName: "ListOfMovies");
    }

    @NSManaged public var title: String?
    @NSManaged public var imdbID: String?
    @NSManaged public var year: String?
    @NSManaged public var plot: String?
    @NSManaged public var poster: String?

}
