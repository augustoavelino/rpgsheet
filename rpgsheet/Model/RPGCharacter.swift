//
//  RPGCharacter.swift
//  rpgsheet
//
//  Created by Augusto Avelino on 11/10/23.
//

import Foundation
import SwiftData

@Model
final class RPGCharacter {
    private static let experienceLevels = [0, 300, 900, 2700, 6500, 14000, 23000, 34000, 48000, 64000, 85000, 100000, 120000, 140000, 165000, 195000, 225000, 265000, 305000, 355000]
    
    var name: String
    var race: RPGRace
    var rpgClass: RPGClass
    var experience: Int
    var dateCreated: Date
    var dateUpdated: Date
    
    init(name: String, race: RPGRace, rpgClass: RPGClass, experience: Int, dateCreated: Date = Date(), dateUpdated: Date = Date()) {
        self.name = name
        self.race = race
        self.rpgClass = rpgClass
        self.experience = experience
        self.dateCreated = dateCreated
        self.dateUpdated = dateUpdated
    }
    
    func getLevel() -> Int {
        guard let levelIndex = RPGCharacter.experienceLevels.lastIndex(where: { $0 <= experience }) else { return 1 }
        return levelIndex + 1
    }
}
