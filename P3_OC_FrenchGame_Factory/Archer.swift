//
//  Colossus.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Archer: Character {
    
    private let littleStick = Weapon(weaponName: "Little Stick", force: 15)
    private let mediumStick = Weapon(weaponName: "Medium Stick", force: 30)
    private let bigStick = Weapon(weaponName: "Big Stick", force: 45)
    private let ironBow = Weapon(weaponName: "Iron Bow", force: 60)
    private let goldenBow = Weapon(weaponName: "Golden Bow", force: 75)
    
    override init(name: String = "") {
        super.init(name: name)
        lifePoints = 45
        maxLifePoints = 100
        healSkill = 15
        defaultWeapon = Weapon(weaponName: "Bow", force: 50)
        currentWeapon = Weapon(weaponName: "Bow", force: 50)
        bonusWeapons = [littleStick, mediumStick, bigStick, ironBow, goldenBow]
        description = "4. The Archer 🏹 with Weapon: \(currentWeapon.weaponName) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)"
        characterType = "Archer 🏹"
    }
}
