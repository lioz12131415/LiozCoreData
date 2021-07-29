//
//  ViewController.swift
//  LiozCoreData
//
//  Created by lioz on 29/07/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Conversations.removeAll()
        
        Conversations.set(conversation: .init(id: 0,
                                              consumerID: "aaa",creationDate: "23/8/2000"))
        Conversations.set(conversation: .init(id: 1,
                                              consumerID: "aaa", creationDate: "21/8/2000"))
        Conversations.set(conversation: .init(id: 2,
                                              consumerID: "aaa", creationDate: "10/7/2000"))
        
        Conversations.set(conversation: .init(id: 3,
                                              consumerID: "bbb", creationDate: "30/8/2000"))
        Conversations.set(conversation: .init(id: 4,
                                              consumerID: "bbb", creationDate: "1/7/2000"))
        Conversations.set(conversation: .init(id: 5,
                                              consumerID: "bbb", creationDate: "22/7/2000"))
                
        print(Conversations.get(for: "aaa")?.first?.creationDate ?? "")
        print(Conversations.get(for: "bbb")?.first?.creationDate ?? "")
    }
}

