//
//  Dwarf.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Dwarf: Character {
    
    private let hammer = Weapon(name: "Hammer", force: 15)
    private let doubleHammer = Weapon(name: "Double Hammer", force: 30)
    private let littleAxe = Weapon(name: "Little Axe", force: 45)
    private let mediumAxe = Weapon(name: "Medium Axe", force: 60)
    private let goldenAxe = Weapon(name: "Golden Axe", force: 75)
    
    override init(name: String = "") {
        super.init(name: name)
        lifePoints = 65
        healSkill = 25
        defaultWeapon = Weapon(name: "Axe", force: 30)
        currentWeapon = Weapon(name: "Axe", force: 30)
        bonusWeapons = [hammer, doubleHammer, littleAxe, mediumAxe, goldenAxe]
        description = "3. The Dwarf 💂‍♀️ with Weapon: \(currentWeapon.name) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)"
        characterType = "Dwarf  💂‍♀️"
    }
}
