//
//  Conversations.swift
//  LiozCoreData
//
//  Created by lioz on 29/07/2021.
//

import Foundation

public class ConversationsDictionary: NSObject, NSSecureCoding, NSCoding {
    // // // // // // // // // // // // // // // // ///
    public static var supportsSecureCoding: Bool = true
    // // // // // // // // // // // // // // // // ///
    public var values: Dictionary<String, Array<Conversation>> = [:]
    
    public override init() {
        
    }
    
    public init(_ conversations: Dictionary<String, Array<Conversation>>) {
        self.values = conversations
    }

    public required convenience init?(coder aDecoder: NSCoder) {
        let mConversation = aDecoder
            .decodeObject(forKey: Key.values.rawValue) as! Dictionary<String, Array<Conversation>>
        self.init(mConversation)
    }

    public func encode(with aCoder: NSCoder) {
        aCoder.encode(values, forKey: Key.values.rawValue)
    }

    enum Key: String {
        case values = "values"
    }
}
