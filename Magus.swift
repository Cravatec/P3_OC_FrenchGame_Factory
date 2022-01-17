//
//  Magus.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Magus: Character {
    
    private let littleWand = Weapon(weaponName: "Little Wand", force: Int.random(in: 4...22))
    private let mediumWand = Weapon(weaponName: "Medium Wand", force: Int.random(in: 23...44))
    private let bigWand = Weapon(weaponName: "Big Wand", force: Int.random(in: 44...69))
    private let fireball = Weapon(weaponName: "Fireball", force: Int.random(in: 70...78))
    private let lavaBall = Weapon(weaponName: "Lava Ball", force: Int.random(in: 79...85))
    
    override init(name: String = "") {
        super.init(name: name)
        lifePoints = 20
        maxLifePoints = 100
        healSkill = 10
        defaultWeapon = Weapon(weaponName: "Magic Wand", force: 75)
        currentWeapon = Weapon(weaponName: "Magic Wand", force: 75)
        bonusWeapons = [littleWand, mediumWand, bigWand, fireball, lavaBall]
        description = "2. The Magus 🧙‍♂️ with Weapon: \(currentWeapon.weaponName) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)"
        characterType = "Magus 🧙‍♂️"
    }
}
