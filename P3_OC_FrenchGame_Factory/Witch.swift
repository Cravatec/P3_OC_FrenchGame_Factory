//
//  Priest.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Witch: Character {
    
    private let mediumStick = Weapon(weaponName: "Medium Stick", force: Int.random(in: 4...22))
    private let highStick = Weapon(weaponName: "High Stick", force: Int.random(in: 23...44))
    private let magicWand = Weapon(weaponName: "Magic Wand", force: Int.random(in: 45...69))
    private let fire = Weapon(weaponName: "Fire", force: Int.random(in: 70...78))
    private let tordnado = Weapon(weaponName: "Tordnado", force: Int.random(in: 79...85))
    
    override init(name: String = "") {
        super.init(name: name)
        lifePoints = 30
        maxLifePoints = 100
        healSkill = 65
        defaultWeapon = Weapon(weaponName: "Little Stick", force: 65)
        currentWeapon = Weapon(weaponName: "Little Stick", force: 65)
        bonusWeapons = [magicWand, mediumStick, highStick, fire, tordnado]
        description = "5. The Witch 🧙 with Weapon: \(currentWeapon.weaponName) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)"
        characterType = "Witch 🧙"
    }
}
