//
//  Player.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Player {
    
    //Nom de l'équipe
    var name: String
    
    //Array pour la création de l'équipe
    var team: [Character] = []
    
    //Liste des characteres encore avec de la vie
    var teamMembersAlive: [Character] {
        team.filter { $0.lifePoints > 0 }
    }
    //Vérifie qu'il reste encore des characters avec des points de vie
    var deadTeam: Bool {
        if teamMembersAlive.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    private var fightingCharacter = Character(name: "")
    
    func createTeams() {
        let playableCharacters = [Warrior(), Magus(), Dwarf(), Archer(), Witch()]
        while team.count < 3 {
            //choix des personnages dans la liste:
            print("🤺 Choose your character \(team.count+1)! Type 1 to 5: 🤺")
            for character in playableCharacters {
                print("\(character.description)")
            }
            let choice = readLine()
            switch choice {
            case "1" :
                team.append(Warrior())
                chooseName(of: "Warrior 🪖")
            case "2" :
                team.append(Magus())
                chooseName(of: "Magus 🧙‍♂️")
            case "3" :
                team.append(Dwarf())
                chooseName(of: "Dwarf 💂‍♀️")
            case "4" :
                team.append(Archer())
                chooseName(of: "Archer 🏹")
            case "5" :
                team.append(Witch())
                chooseName(of: "Witch 🧙")
            default: print("\n 🚨 Type 1 to 5 to choose a Character 🚨 \n")
            }
        }
    }
    //Choix du nom pour le personnage
    private func chooseName(of type: String) {
        print("\n Choose a name for \(type) \n")
        
        if let userInput = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !userInput.isEmpty {
            if Character.charactersNames.contains(userInput) {
                print("❌ This name is not available. ❌")
                chooseName(of: type)
            } else {
                Character.charactersNames.append(userInput)
                team[team.count-1].name = userInput
                print("\n Your \(type) is now \(userInput) !\n")
            }
        } else {
            print("Try a another name")
            chooseName(of: type)
        }
    }
    
    //Choix du personnage à chaque tour
    func chooseCharacter() {
        print("Team \(name) choose your fighter")
        
        for (index, character) in team.enumerated() {
            if character.lifePoints > 0 {
                print("\(index + 1). \(character.name) the \(character.characterType) ❤️:\(character.lifePoints) (max❤️:\(character.maxLifePoints))\n")
            }
        }
        if let choice = readLine() {
            switch choice {
            case "1" where team[0].lifePoints > 0 :
                chosenFighter(characterNumber: 0)
            case "2" where team[1].lifePoints > 0 :
                chosenFighter(characterNumber: 1)
            case "3" where team[2].lifePoints > 0 :
                chosenFighter(characterNumber: 2)
            default:
                print("❌ This is not a valid choice ❌")
                chooseCharacter()
            }
        }
    }
    //Choix actions soigner ou attaque
    func chooseAction(enemyTeams: [Character]) {
        print("What do you want to do?\n"
              + "\n 1. ⛑ Help a partner ⛑"
              + "\n 2. ⚔️ Fight a ennemy ⚔️ \n")
        if let choice = readLine() {
            switch choice {
            case "1" :
                healChoices()
            case "2" :
                attackChoices(enemyTeams: enemyTeams)
            default: print("Type 1 or 2")
                chooseAction(enemyTeams: enemyTeams)
            }
        }
    }
    //Sélection du personnage
    private func chosenFighter(characterNumber: Int) {
        fightingCharacter = team[characterNumber]
        print("\n You choose \(fightingCharacter.name), it's a \(fightingCharacter.characterType)  with a \(fightingCharacter.currentWeapon.name) (\(fightingCharacter.currentWeapon.force) dammage points) & \(fightingCharacter.healSkill) rescue points")
        bonus()
    }
    //Bonus, choix aléatoire 1 chance sur 2
    private func bonus() {
        let bonusChances = Int.random(in: 1...10)
        if bonusChances <= 5, let bonusWeapon = fightingCharacter.bonusWeapons.randomElement() {
            print("\n 🎁 This is a bonus 🎁")
            print("\n 🎁 You won this weapon 🗡️ \(bonusWeapon.name), the damage point is \(bonusWeapon.force) 🎁")
            chooseBonus(acceptBonusWeapon: bonusWeapon)        }
    }
    //Choix de prendre le bonus ou refuser
    private func chooseBonus(acceptBonusWeapon: Weapon) {
        print("\n Do you want it\n\n"
              + "1. Yes 👍 \n"
              + "2. No 👎 \n")
        
        if let choice = readLine() {
            switch choice {
            case "1" :
                fightingCharacter.currentWeapon = acceptBonusWeapon
                print("\n Ok, I take it 👍 \n")
            case "2" :
                print("\n Ok, I leave it 👎 \n")
                break
            default :
                print("Choose a answer")
                chooseBonus(acceptBonusWeapon: acceptBonusWeapon)
            }
        }
    }
    
    //fonction choix de soigner
    private func healChoices() {
        print("⛑ Which Character do you want to help ? You will had \(fightingCharacter.healSkill) life points ⛑")
        for (index, character) in team.enumerated() {
            if character.lifePoints > 0 { // ‣
                print("\(index + 1). ⛑ Nurse \(character.name) the \(character.characterType) (\(character.lifePoints)/\(character.maxLifePoints) ❤️) ⛑ \n")
            }
        }
        if let choice = readLine() {
            switch choice {
            case "1" where team[0].lifePoints > 0 :
                heal(characterNumber: 0)
            case "2" where team[1].lifePoints > 0 :
                heal(characterNumber: 1)
            case "3" where team[2].lifePoints > 0 :
                heal(characterNumber: 2)
            default :
                print("\n Type a number for selected")
                healChoices()
            }
        }
    }
    //fonction soin pour le personnage choisi
    private func heal(characterNumber: Int) {
        let target = team[characterNumber]
        if target.lifePoints <= target.maxLifePoints - fightingCharacter.healSkill {
            target.lifePoints += fightingCharacter.healSkill
            print("\(fightingCharacter.name) give \(fightingCharacter.healSkill) ❤️. Now \(target.name) the \(target.characterType) has \(target.lifePoints) ❤️ \n")
        } else if target.lifePoints == target.maxLifePoints {
            print("\n He has already the maximum life point")
        } else {
            print("\(target.name) get back \(target.maxLifePoints - target.lifePoints) life point")
            target.lifePoints += target.maxLifePoints - target.lifePoints
            print(" \(target.name) has now \(target.maxLifePoints) life \n")
        }
    }
   //Choix de l'adversaire à combattre
    private func attackChoices(enemyTeams: [Character]) {
        print("\n ⚔️ Choose your enemy ⚔️ \n")
        for (index, character) in enemyTeams.enumerated() {
            if character.lifePoints > 0 {
                print("\(index + 1). Attack \(character.name) the \(character.characterType) ❤️:\(character.lifePoints) (max❤️:\(character.maxLifePoints)) \n")
            }
        }
        if let choice = readLine() {
            switch choice {
            case "1" where enemyTeams[0].lifePoints > 0 : attack(target: enemyTeams[0])
            case "2" where enemyTeams[1].lifePoints > 0 : attack(target: enemyTeams[1])
            case "3" where enemyTeams[2].lifePoints > 0 : attack(target: enemyTeams[2])
            default: print("Choose a number")
                attackChoices(enemyTeams: enemyTeams)
            }
        }
    }
    //Attack de l'adversaire, diminution de ses points de vie, affichage du résultat
    private func attack(target: Character) {
        target.lifePoints -= fightingCharacter.currentWeapon.force
        print("\n  \(target.name) the \(target.characterType) lose \(fightingCharacter.currentWeapon.force) life Points 💔 \n")
        if target.lifePoints > 0 {
            print("\(target.name) the \(target.characterType) has now \(target.lifePoints)/\(target.maxLifePoints) ❤️ \n")
        } else {
            print("☠️☠️☠️ \(target.name) the \(target.characterType) is dead ☠️☠️☠️ \n")
            target.lifePoints = 0
        }
        fightingCharacter.currentWeapon = fightingCharacter.defaultWeapon // ‣ Character takes back his default weapon at the end of his turn
    }
}
