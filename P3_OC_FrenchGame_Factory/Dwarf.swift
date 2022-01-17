//
//  Dwarf.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation


class Dwarf: Character {
    
    private let hammer = Weapon(weaponName: "Hammer", force: Int.random(in: 4...22))
    private let doubleHammer = Weapon(weaponName: "Double Hammer", force: Int.random(in: 23...44))
    private let littleAxe = Weapon(weaponName: "Little Axe", force: Int.random(in: 45...69))
    private let mediumAxe = Weapon(weaponName: "Medium Axe", force: Int.random(in: 70...78))
    private let goldenAxe = Weapon(weaponName: "Golden Axe", force: Int.random(in: 79...85))
    
    override init(name: String = "") {
        super.init(name: name)
        lifePoints = 50
        maxLifePoints = 100
        healSkill = 30
        defaultWeapon = Weapon(weaponName: "Axe", force: 45)
        currentWeapon = Weapon(weaponName: "Axe", force: 45)
        bonusWeapons = [hammer, doubleHammer, littleAxe, mediumAxe, goldenAxe]
        description = "3. The Dwarf 💂‍♀️ with Weapon: \(currentWeapon.weaponName) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)"
        characterType = "Dwarf 💂‍♀️"
    }
}
