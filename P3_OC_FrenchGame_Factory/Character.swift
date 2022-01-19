//
//  Character.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation
//init des Characters
class Character {
    
    var description = ""
    
    var name: String
    
    var characterType = String()
    
    var defaultWeapon = Weapon(weaponName: "", force: 0)
    
    var currentWeapon = Weapon(weaponName: "", force: 0)
    
    var bonusWeapons: [Weapon] = []
    
    var lifePoints: Int = 100
    
    var maxLifePoints: Int = 100
    
    var healSkill = Int()
    
    static var charactersNames: [String] = []
    
    init(name: String) {
        self.name = name
    }
}
