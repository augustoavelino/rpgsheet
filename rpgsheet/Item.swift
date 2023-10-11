//
//  Item.swift
//  rpgsheet
//
//  Created by Augusto Avelino on 10/10/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var orderIndex: Int
    
    init(timestamp: Date, orderIndex: Int) {
        self.timestamp = timestamp
        self.orderIndex = orderIndex
    }
}
