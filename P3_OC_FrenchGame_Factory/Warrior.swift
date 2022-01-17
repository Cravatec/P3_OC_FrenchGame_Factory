//
//  Warrior.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Warrior: Character {
    
    private let nail = Weapon(weaponName: "Nail", force: 15)
    private let goldenHammer = Weapon(weaponName: "Golden Hammer", force: 30)
    private let axe = Weapon(weaponName: "Axe", force: 45)
    private let ironAxe = Weapon(weaponName: "Iron Axe", force: 60)
    private let goldenAxe = Weapon(weaponName: "Golden Axe", force: 75)
    
    override init(name: String = "") {
        super.init(name: name)
        lifePoints = 55
        maxLifePoints = 100
        healSkill = 15
        bonusWeapons = [ironAxe, nail, goldenHammer, axe, goldenAxe]
        defaultWeapon = Weapon(weaponName: "Hammer", force: 40)
        currentWeapon = Weapon(weaponName: "Hammer", force: 40)
        description = "1. The Warrior 🪖 with Weapon: \(currentWeapon.weaponName) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)"
        characterType = "Warrior 🪖"
    }
}
