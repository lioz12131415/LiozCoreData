//
//  Conversations.swift
//  LiozCoreData
//
//  Created by lioz on 29/07/2021.
//

import Foundation

public class Conversation: NSObject, NSSecureCoding, NSCoding {
    // // // // // // // // // // // // // // // // ///
    public static var supportsSecureCoding: Bool = true
    // // // // // // // // // // // // // // // // ///

    public dynamic var id:           Int?
    public dynamic var consumerID:   String?
    public dynamic var creationDate: String?
    
    override init() { /* INIT */ }
    
    public init(id: Int?, consumerID: String?, creationDate: String?) {
        self.id           = id
        self.consumerID   = consumerID
        self.creationDate = creationDate
    }
    
    public required convenience init?(coder aDecoder: NSCoder) {
        let mID = aDecoder
            .decodeObject(forKey: ConversationKey.id.rawValue) as? Int
        let mConsumerID = aDecoder
            .decodeObject(forKey: ConversationKey.consumerID.rawValue) as? String
        let mCreationDate = aDecoder
            .decodeObject(forKey: ConversationKey.creationDate.rawValue) as? String
        
        self.init(id: mID, consumerID: mConsumerID, creationDate: mCreationDate)
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: ConversationKey.id.rawValue)
        aCoder.encode(consumerID, forKey: ConversationKey.consumerID.rawValue)
        aCoder.encode(creationDate, forKey: ConversationKey.creationDate.rawValue)
    }
}

enum ConversationKey: String {
    case id           = "id"
    case consumerID   = "consumerID"
    case creationDate = "creationDate"
}

@objc(ConversationValueTransformer)
public final class ConversationValueTransformer: NSSecureUnarchiveFromDataTransformer {
    
    public override static var allowedTopLevelClasses: [AnyClass] {
        return [NSValue.self,
                NSArray.self,
                NSNumber.self,
                NSString.self,
                NSDictionary.self,
                Conversation.self,
                ConversationsDictionary.self]
    }

    public static func register() {
        let rawValue = String(describing: ConversationValueTransformer.self)
        let name = NSValueTransformerName(rawValue: rawValue)
        ValueTransformer.setValueTransformer(ConversationValueTransformer(), forName: name)
    }
}
