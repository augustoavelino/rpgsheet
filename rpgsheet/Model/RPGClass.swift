//
//  RPGClass.swift
//  rpgsheet
//
//  Created by Augusto Avelino on 11/10/23.
//

import Foundation

enum RPGClass: Int, CaseIterable, Codable, Identifiable {
    case barbarian, bard, cleric, druid, fighter, monk, paladin, ranger, rogue, sorcerer, warlock, wizard
    
    var id: RawValue { rawValue }
    var text: String {
        switch self {
        case .barbarian: return "Barbarian"
        case .bard: return "Bard"
        case .cleric: return "Cleric"
        case .druid: return "Druid"
        case .fighter: return "Fighter"
        case .monk: return "Monk"
        case .paladin: return "Paladin"
        case .ranger: return "Ranger"
        case .rogue: return "Rogue"
        case .sorcerer: return "Sorcerer"
        case .warlock: return "Warlock"
        case .wizard: return "Wizard"
        }
    }
}
