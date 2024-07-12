//
//  Item.swift
//  SwiftuiAuthBase
//
//  Created by Christophe Guégan on 12/07/2024.
//

import Foundation
import FirebaseFirestoreSwift

struct Item: Identifiable, Codable {
    
    let id: String
    let title: String
    
}

extension Item {
    static var sample = Item(
        id: UUID().uuidString,
        title: "Item 1"
    )
}
