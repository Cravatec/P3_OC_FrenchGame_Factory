//
//  Warrior.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Warrior: Character {
    
    private let nail = Weapon(name: "Nail", force: 15)
    private let goldenHammer = Weapon(name: "Golden Hammer", force: 30)
    private let axe = Weapon(name: "Axe", force: 45)
    private let ironAxe = Weapon(name: "Iron Axe", force: 60)
    private let goldenAxe = Weapon(name: "Golden Axe", force: 75)
    
    override init(name: String = "") {
        super.init(name: name)
        lifePoints = 55
        healSkill = 15
        defaultWeapon = Weapon(name: "Hammer", force: 40)
        currentWeapon = Weapon(name: "Hammer", force: 40)
        bonusWeapons = [ironAxe, nail, goldenHammer, axe, goldenAxe]
        description = "1. The Warrior 🪖 with Weapon: \(currentWeapon.name) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)"
        characterType = "Warrior  🪖"
    }
}
