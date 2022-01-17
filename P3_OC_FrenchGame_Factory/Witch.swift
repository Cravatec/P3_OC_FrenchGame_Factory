//
//  Priest.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Witch: Character {
    
    private let mediumStick = Weapon(weaponName: "Medium Stick", force: 15)
    private let highStick = Weapon(weaponName: "High Stick", force: 30)
    private let magicWand = Weapon(weaponName: "Magic Wand", force: 45)
    private let fire = Weapon(weaponName: "Fire", force: 60)
    private let tordnado = Weapon(weaponName: "Tordnado", force: 75)
    
    override init(name: String = "") {
        super.init(name: name)
        lifePoints = 55
        maxLifePoints = 100
        healSkill = 65
        defaultWeapon = Weapon(weaponName: "Little Stick", force: 40)
        currentWeapon = Weapon(weaponName: "Little Stick", force: 40)
        bonusWeapons = [magicWand, mediumStick, highStick, fire, tordnado]
        description = "5. The Witch 🧙 with Weapon: \(currentWeapon.weaponName) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)"
        characterType = "Witch 🧙"
    }
}
