//
//  Player.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Player {
    
    var name: String
    
    //Array for team's character
    
    var team: [Character] = []
    
    //Array for alive character
    
    var teamMembersAlive: [Character] {
        team.filter { $0.lifePoints > 0 }
    }
    
    //Check if characters still have life point
    
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
    
    private var fighter = Character(name: "")
    
    func createTeams() {
        let allCharacters = [Warrior(), Magus(), Dwarf(), Archer(), Witch()]
        while team.count < 3 {
            print("🤺 Choose your character \(team.count + 1)! Type 1 to 5: 🤺")
            for character in allCharacters {
                print("\(character.description)")
            }
            let choice = readLine()
            switch choice {
            case "1" :
                team.append(Warrior())
                chooseName(typeCharacter: "Warrior 🪖")
            case "2" :
                team.append(Magus())
                chooseName(typeCharacter: "Magus 🧙‍♂️")
            case "3" :
                team.append(Dwarf())
                chooseName(typeCharacter: "Dwarf 💂‍♀️")
            case "4" :
                team.append(Archer())
                chooseName(typeCharacter: "Archer 🏹")
            case "5" :
                team.append(Witch())
                chooseName(typeCharacter: "Witch 🧙")
            default: print("\n 🚨 Type 1 to 5 to choose a Character 🚨 \n")
            }
        }
    }
    
    //Choose a name for the selected character and check if the name isn't already use
    
    private func chooseName(typeCharacter type: String) {
        print("\n Choose a name for \(type) \n")
        
        if let userInput = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !userInput.isEmpty {
            if Character.charactersNames.contains(userInput) {
                print("❌ This name is not available. ❌")
                chooseName(typeCharacter: type)
            } else {
                Character.charactersNames.append(userInput)
                team[team.count - 1].name = userInput
                print("\n Your \(type) is now \(userInput) !\n")
            }
        } else {
            print("Try a another name")
            chooseName(typeCharacter: type)
        }
    }
    
    //Choose a Character for each round
    
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
    
    //Choose a action each round
    
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
    
    //The chosen character print is status and bonus
    
    private func chosenFighter(characterNumber: Int) {
        fighter = team[characterNumber]
        print("\n You choose \(fighter.name), it's a \(fighter.characterType)  with a \(fighter.currentWeapon.name) (\(fighter.currentWeapon.force) dammage points) & \(fighter.healSkill) rescue points")
        bonus()
    }
    
    //Bonus with one chance in two to have a weapon
    
    private func bonus() {
        let bonusChances = Int.random(in: 1...10)
        if bonusChances <= 5, let bonusWeapon = fighter.bonusWeapons.randomElement() {
            print("\n 🎁 This is a bonus 🎁")
            print("\n 🎁 You won this weapon 🗡️ \(bonusWeapon.name), the damage point is \(bonusWeapon.force) 🎁")
            chooseBonus(acceptBonusWeapon: bonusWeapon)        }
    }
    
    //Accept or refuse the bonus
    
    private func chooseBonus(acceptBonusWeapon: Weapon) {
        print("\n Do you want it\n\n"
              + "1. Yes 👍 \n"
              + "2. No 👎 \n")
        
        if let choice = readLine() {
            switch choice {
            case "1" :
                fighter.currentWeapon = acceptBonusWeapon
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
    
    //Choose the team member you want to help
    
    private func healChoices() {
        print("⛑ Which Character do you want to help ? You will had \(fighter.healSkill) life points ⛑")
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
    
    //Add the heal skill to the character life points
    
    private func heal(characterNumber: Int) {
        let target = team[characterNumber]
        if target.lifePoints <= target.maxLifePoints - fighter.healSkill {
            target.lifePoints += fighter.healSkill
            print("\(fighter.name) give \(fighter.healSkill) ❤️. Now \(target.name) the \(target.characterType) has \(target.lifePoints) ❤️ \n")
        } else if target.lifePoints == target.maxLifePoints {
            print("\n He has already the maximum life point")
        } else {
            print("\(target.name) get back \(target.maxLifePoints - target.lifePoints) life point")
            target.lifePoints += target.maxLifePoints - target.lifePoints
            print(" \(target.name) has now \(target.maxLifePoints) life \n")
        }
    }
    
    //Attack and choose which enemy
    
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
    
    //Attack, reduce the life point & print the result
    
    private func attack(target: Character) {
        target.lifePoints -= fighter.currentWeapon.force
        print("\n  \(target.name) the \(target.characterType) lose \(fighter.currentWeapon.force) life Points 💔 \n")
        if target.lifePoints > 0 {
            print("\(target.name) the \(target.characterType) has now \(target.lifePoints)/\(target.maxLifePoints) ❤️ \n")
        } else {
            print("☠️☠️☠️ \(target.name) the \(target.characterType) is dead ☠️☠️☠️ \n")
            target.lifePoints = 0
        }
        fighter.currentWeapon = fighter.defaultWeapon // ‣ Character takes back his default weapon at the end of his turn
    }
}
