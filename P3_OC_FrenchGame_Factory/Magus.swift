//
//  Magus.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Magus: Character {
    
    private let littleWand = Weapon(name: "Little Wand", force: 15)
    private let mediumWand = Weapon(name: "Medium Wand", force: 30)
    private let bigWand = Weapon(name: "Big Wand", force: 45)
    private let fireball = Weapon(name: "Fireball", force: 60)
    private let lavaBall = Weapon(name: "Lava Ball", force: 75)
    
    init(name: String = "") {
        let lifePoints = 45
        let healSkill = 10
        let defaultWeapon = Weapon(name: "Magic Wand", force: 50)
        let currentWeapon = Weapon(name: "Magic Wand", force: 50)
        let bonusWeapons = [littleWand, mediumWand, bigWand, fireball, lavaBall]
        let description = "2. The Magus 🧙‍♂️ with Weapon: \(currentWeapon.name) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)"
        let characterType = "Magus  🧙‍♂️"
        super.init(name: name, description: description, characterType: characterType, defaultWeapon: defaultWeapon, currentWeapon: currentWeapon, bonusWeapons: bonusWeapons, lifePoints: lifePoints, healSkill: healSkill)
    }
}
