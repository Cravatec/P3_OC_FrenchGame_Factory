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
    
    init(name: String = "") {
        let lifePoints = 65
        let healSkill = 25
        let defaultWeapon = Weapon(name: "Axe", force: 30)
        let currentWeapon = Weapon(name: "Axe", force: 30)
        let bonusWeapons = [hammer, doubleHammer, littleAxe, mediumAxe, goldenAxe]
        let description = "3. The Dwarf 💂‍♀️ with Weapon: \(currentWeapon.name) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)"
        let characterType = "Dwarf  💂‍♀️"
        super.init(name: name, description: description, characterType: characterType, defaultWeapon: defaultWeapon, currentWeapon: currentWeapon, bonusWeapons: bonusWeapons, lifePoints: lifePoints, healSkill: healSkill)
        
    }
}
