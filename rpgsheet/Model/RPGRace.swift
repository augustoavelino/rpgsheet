//
//  RPGRace.swift
//  rpgsheet
//
//  Created by Augusto Avelino on 11/10/23.
//

import Foundation

enum RPGRace: Int, CaseIterable, Codable, Identifiable {
    case dragonborn, dwarf, elf, gnome, halfElf, halfling, halfOrc, human, tiefling
    
    var id: RawValue { rawValue }
    var text: String {
        switch self {
        case .dragonborn: return "Dragonborn"
        case .dwarf: return "Dwarf"
        case .elf: return "Elf"
        case .gnome: return "Gnome"
        case .halfElf: return "Half-Elf"
        case .halfling: return "Halfling"
        case .halfOrc: return "Half-Orc"
        case .human: return "Human"
        case .tiefling: return "Tiefling"
        }
    }
}
