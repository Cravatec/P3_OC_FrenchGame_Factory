//
//  Priest.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Witch: Character {
    
    private let mediumStick = Weapon(name: "Medium Stick", force: 15)
    private let highStick = Weapon(name: "High Stick", force: 30)
    private let magicWand = Weapon(name: "Magic Wand", force: 45)
    private let fire = Weapon(name: "Fire", force: 60)
    private let tordnado = Weapon(name: "Tordnado", force: 75)
    
    override init(name: String = "") {
        super.init(name: name)
        lifePoints = 55
        maxLifePoints = 100
        healSkill = 20
        defaultWeapon = Weapon(name: "Little Stick", force: 40)
        currentWeapon = Weapon(name: "Little Stick", force: 40)
        bonusWeapons = [magicWand, mediumStick, highStick, fire, tordnado]
        description = "5. The Witch 🧙 with Weapon: \(currentWeapon.name) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)\n"
        characterType = "Witch  🧙"
    }
}
