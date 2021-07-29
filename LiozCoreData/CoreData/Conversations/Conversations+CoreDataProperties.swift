//
//  Conversations+CoreDataProperties.swift
//  LiozCoreData
//
//  Created by lioz on 29/07/2021.
//
//

import Foundation
import CoreData


extension Conversations {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Conversations> {
        return NSFetchRequest<Conversations>(entityName: "Conversations")
    }

    @NSManaged public var dictionary: ConversationsDictionary?
}

extension Conversations : Identifiable {

}
