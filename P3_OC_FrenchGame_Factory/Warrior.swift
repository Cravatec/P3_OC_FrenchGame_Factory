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
    
    init(name: String = "") {
        let lifePoints = 55
        let healSkill = 15
        let defaultWeapon = Weapon(name: "Hammer", force: 40)
        let currentWeapon = Weapon(name: "Hammer", force: 40)
        let bonusWeapons = [ironAxe, nail, goldenHammer, axe, goldenAxe]
        let description = "1. The Warrior 🪖 with Weapon: \(currentWeapon.name) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)"
        let characterType = "Warrior  🪖"
        
        super.init(name: name, description: description, characterType: characterType, defaultWeapon: defaultWeapon, currentWeapon: currentWeapon, bonusWeapons: bonusWeapons, lifePoints: lifePoints, healSkill: healSkill)
    }
}
