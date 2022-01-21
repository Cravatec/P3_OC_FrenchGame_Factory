//
//  Colossus.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Archer: Character {
    
    private let littleStick = Weapon(name: "Little Stick", force: 15)
    private let mediumStick = Weapon(name: "Medium Stick", force: 30)
    private let bigStick = Weapon(name: "Big Stick", force: 45)
    private let ironBow = Weapon(name: "Iron Bow", force: 60)
    private let goldenBow = Weapon(name: "Golden Bow", force: 75)
    
    override init(name: String = "") {
        super.init(name: name)
        lifePoints = 65
        maxLifePoints = 100
        healSkill = 15
        defaultWeapon = Weapon(name: "Bow", force: 30)
        currentWeapon = Weapon(name: "Bow", force: 30)
        bonusWeapons = [littleStick, mediumStick, bigStick, ironBow, goldenBow]
        description = "4. The Archer 🏹 with Weapon: \(currentWeapon.name) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)"
        characterType = "Archer  🏹"
    }
}
