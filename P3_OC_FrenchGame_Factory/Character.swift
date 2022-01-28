//
//  Character.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

//Characters init

class Character {
    
    var description = ""
    
    var name: String
    
    var characterType = ""
    
    var defaultWeapon = Weapon(name: "", force: 0)
    
    var currentWeapon = Weapon(name: "", force: 0)
    
    var bonusWeapons: [Weapon] = []
    
    var lifePoints: Int = 1
    
    let maxLifePoints: Int = 100
    
    var healSkill = 0
    
    static var charactersNames: [String] = []
    
    init(name: String) {
        self.name = name
    }
}
