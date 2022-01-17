//
//  Magus.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Magus: Character {
    
    private let littleWand = Weapon(weaponName: "Little Wand", force: 15)
    private let mediumWand = Weapon(weaponName: "Medium Wand", force: 30)
    private let bigWand = Weapon(weaponName: "Big Wand", force: 45)
    private let fireball = Weapon(weaponName: "Fireball", force: 60)
    private let lavaBall = Weapon(weaponName: "Lava Ball", force: 75)
    
    override init(name: String = "") {
        super.init(name: name)
        lifePoints = 45
        maxLifePoints = 100
        healSkill = 10
        defaultWeapon = Weapon(weaponName: "Magic Wand", force: 50)
        currentWeapon = Weapon(weaponName: "Magic Wand", force: 50)
        bonusWeapons = [littleWand, mediumWand, bigWand, fireball, lavaBall]
        description = "2. The Magus 🧙‍♂️ with Weapon: \(currentWeapon.weaponName) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)"
        characterType = "Magus  🧙‍♂️"
    }
}
