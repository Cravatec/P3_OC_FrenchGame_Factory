//
//  Character.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

//Characters init

class Character {
    
    let name: String
    let description: String
    let characterType: String
    let defaultWeapon: Weapon
    let bonusWeapons: [Weapon]
    let healSkill: Int
    
    var lifePoints: Int
    var currentWeapon: Weapon
    
    static var charactersNames: [String] = []
    static let maxLifePoints: Int = 100
    
    init(name: String, description: String, characterType: String, defaultWeapon: Weapon, currentWeapon: Weapon, bonusWeapons: [Weapon], lifePoints: Int, healSkill: Int) {
        self.name = name
        self.description = description
        self.characterType = characterType
        self.defaultWeapon = defaultWeapon
        self.currentWeapon = currentWeapon
        self.bonusWeapons = bonusWeapons
        self.lifePoints = lifePoints
        self.healSkill = healSkill
    }
}
