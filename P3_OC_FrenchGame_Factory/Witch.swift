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
    private let tornado = Weapon(name: "Tornado", force: 75)
    
    init(name: String = "") {
        let lifePoints = 55
        let healSkill = 20
        let defaultWeapon = Weapon(name: "Little Stick", force: 40)
        let currentWeapon = Weapon(name: "Little Stick", force: 40)
        let bonusWeapons = [magicWand, mediumStick, highStick, fire, tornado]
        let description = "5. The Witch 🧙 with Weapon: \(currentWeapon.name) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)\n"
        let characterType = "Witch  🧙"
        super.init(name: name, description: description, characterType: characterType, defaultWeapon: defaultWeapon, currentWeapon: currentWeapon, bonusWeapons: bonusWeapons, lifePoints: lifePoints, healSkill: healSkill)
    }
}
