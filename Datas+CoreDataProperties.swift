//
//  Datas+CoreDataProperties.swift
//  CoinsExercise
//
//  Created by catalina lozano on 04/07/24.
//
//

import Foundation
import CoreData


extension Datas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Datas> {
        return NSFetchRequest<Datas>(entityName: "Datas")
    }

    @NSManaged public var name: String?
    @NSManaged public var supply: String?
    @NSManaged public var priceUsd: String?
    @NSManaged public var changePercent24Hr: String?

}

extension Datas : Identifiable {

}
