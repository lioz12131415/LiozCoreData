//
//  ConversationsExtensions.swift
//  LiozCoreData
//
//  Created by lioz on 29/07/2021.
//

import UIKit
import CoreData

extension Conversations {
    // ========================================================== //
    // MARK: - Request the object from the core data objects pool //
    // ========================================================== //
    fileprivate static func getFromObjectsPool() -> Conversations? {
        let fetchR: NSFetchRequest < Conversations > = Conversations.fetchRequest()
        guard let array = try? CoreDataManeger.context.fetch(fetchR) else {
            return Conversations(context: CoreDataManeger.context)
        }
        guard let conversations = array.first else {
            return Conversations(context: CoreDataManeger.context)
        }
        return conversations
    }
}

extension Conversations {
    // ================================================== //
    // MARK:  //
    // ================================================== //
    public static var get: Conversations? {
        get { return getFromObjectsPool() }
    }
}

extension Conversations {
    // ================================================== //
    // MARK:  //
    // ================================================== //
    public static func set(conversation: Conversation) {
        guard let id = conversation.consumerID,
              get?.dictionary?.values[id] != nil else { return firstSet(of: conversation) }
        
        get?.dictionary?.values[id]?.append(conversation)
        CoreDataManeger.saveContext()
    }
}


extension Conversations {
    // ================================================== //
    // MARK:  //
    // ================================================== //
    fileprivate static func firstSet(of conversation: Conversation) {
        let dictionary = get?.dictionary ?? ConversationsDictionary()
        
        dictionary.values.updateValue([conversation], forKey: conversation.consumerID!)
        get?.dictionary = ConversationsDictionary(dictionary.values)
        CoreDataManeger.saveContext()
    }
}

extension Conversations {
    // ================================================== //
    // MARK:  //
    // ================================================== //
    @nonobjc public static func removeAll(callack: ( () -> Void)? = nil) {
        let fetchR: NSFetchRequest < Conversations > = Conversations.fetchRequest()
        guard let array = try? CoreDataManeger.context.fetch(fetchR) else {
            return
        }
        array.forEach ({ CoreDataManeger.context.delete($0) })
        if callack != nil { callack!() }
    }
}

extension Conversations {
    // ================================================== //
    // MARK:  //
    // ================================================== //
    public static func get(for key: String) -> [Conversation]? {
        guard let conversation = get?.dictionary?.values[key] else { return nil }
        return conversation
    }
}
