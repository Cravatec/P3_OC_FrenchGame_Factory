//
//  Dwarf.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation


class Dwarf: Character {
    
    private let hammer = Weapon(weaponName: "Hammer", force: 15)
    private let doubleHammer = Weapon(weaponName: "Double Hammer", force: 30)
    private let littleAxe = Weapon(weaponName: "Little Axe", force: 45)
    private let mediumAxe = Weapon(weaponName: "Medium Axe", force: 60)
    private let goldenAxe = Weapon(weaponName: "Golden Axe", force: 75)
    
    override init(name: String = "") {
        super.init(name: name)
        lifePoints = 65
        maxLifePoints = 100
        healSkill = 30
        defaultWeapon = Weapon(weaponName: "Axe", force: 30)
        currentWeapon = Weapon(weaponName: "Axe", force: 30)
        bonusWeapons = [hammer, doubleHammer, littleAxe, mediumAxe, goldenAxe]
        description = "3. The Dwarf 💂‍♀️ with Weapon: \(currentWeapon.weaponName) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)"
        characterType = "Dwarf 💂‍♀️"
    }
}
