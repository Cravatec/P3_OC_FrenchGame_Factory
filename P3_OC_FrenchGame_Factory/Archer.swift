//
//  Colossus.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Archer: Character {
    
    private let littleStick = Weapon(name: "Little Stick", force: 15)
    private let mediumStick = Weapon(name: "Medium Stick", force: 30)
    private let bigStick = Weapon(name: "Big Stick", force: 45)
    private let ironBow = Weapon(name: "Iron Bow", force: 60)
    private let goldenBow = Weapon(name: "Golden Bow", force: 75)
    
    init(name: String = "") {
        let lifePoints = 65
        let healSkill = 15
        let defaultWeapon = Weapon(name: "Bow", force: 30)
        let currentWeapon = Weapon(name: "Bow", force: 30)
        let bonusWeapons = [littleStick, mediumStick, bigStick, ironBow, goldenBow]
        let description = "4. The Archer 🏹 with Weapon: \(currentWeapon.name) (\(currentWeapon.force) force) - ❤️: \(lifePoints) - ⛑: \(healSkill)"
        let characterType = "Archer  🏹"
        
        super.init(name: name, description: description, characterType: characterType, defaultWeapon: defaultWeapon, currentWeapon: currentWeapon, bonusWeapons: bonusWeapons, lifePoints: lifePoints, healSkill: healSkill)
    }
}
