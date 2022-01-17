//
//  Warrior.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Warrior: Character {
    
    private let nail = Weapon(weaponName: "Nail", force: Int.random(in: 4...22))
    private let goldenHammer = Weapon(weaponName: "Golden Hammer", force: Int.random(in: 23...44))
    private let axe = Weapon(weaponName: "Axe", force: Int.random(in: 44...69))
    private let ironAxe = Weapon(weaponName: "Iron Axe", force: Int.random(in: 70...78))
    private let goldenAxe = Weapon(weaponName: "Golden Axe", force: Int.random(in: 79...85))
    
    override init(name: String = "") {
        super.init(name: name)
        lifePoints = 35
        maxLifePoints = 100
        healSkill = 15
        bonusWeapons = [ironAxe, nail, goldenHammer, axe, goldenAxe]
        defaultWeapon = Weapon(weaponName: "Hammer", force: 60)
        currentWeapon = Weapon(weaponName: "Hammer", force: 60)
        description = "1. The Warrior 🪖 with Weapon: \(currentWeapon.weaponName) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)"
        characterType = "Warrior 🪖"
    }
}
