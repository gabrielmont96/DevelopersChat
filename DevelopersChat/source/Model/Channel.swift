//
//  Channel.swift
//  DevelopersChat
//
//  Created by stag on 12/04/19.
//  Copyright © 2019 Gabriel Silva. All rights reserved.
//

import FirebaseFirestore

class Channel {
    var id: String?
    var name: String?
    
    init(name: String) {
        id = nil
        self.name = name
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        
        guard let name = data["name"] as? String else {
            return nil
        }
        
        self.name = name
    }
}
