//
//  Colossus.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Archer: Character {
    
    private let littleStick = Weapon(weaponName: "Little Stick", force: Int.random(in: 4...22))
    private let mediumStick = Weapon(weaponName: "Medium Stick", force: Int.random(in: 23...44))
    private let bigStick = Weapon(weaponName: "Big Stick", force: Int.random(in: 45...70))
    private let ironBow = Weapon(weaponName: "Iron Bow", force: Int.random(in: 71...78))
    private let goldenBow = Weapon(weaponName: "Golden Bow", force: Int.random(in: 79...85))
    
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
