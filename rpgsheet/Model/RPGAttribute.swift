//
//  RPGAttribute.swift
//  rpgsheet
//
//  Created by Augusto Avelino on 13/10/23.
//

import Foundation

enum RPGAttribute: Int, Codable, Identifiable {
    case strength, dexterity, constitution, intelligence, wisdom, charisma
    
    var id: Int { rawValue }
    
    var text: String {
        switch self {
        case .strength: return "strength"
        case .dexterity: return "dexterity"
        case .constitution: return "constitution"
        case .intelligence: return "intelligence"
        case .wisdom: return "wisdom"
        case .charisma: return "charisma"
        }
    }
    
    static func modifier(for value: Int) -> Int {
        switch value {
        case 1: return -5
        case 2, 3: return -4
        case 4, 5: return -3
        case 6, 7: return -2
        case 8, 9: return -1
        case 10, 11: return 0
        case 12, 13: return 1
        case 14, 15: return 2
        case 16, 17: return 3
        case 18, 19: return 4
        case 20, 21: return 5
        case 22, 23: return 6
        case 24, 25: return 7
        case 26, 27: return 8
        case 28, 29: return 9
        case 30: return 10
        default: return 0
        }
    }
}
