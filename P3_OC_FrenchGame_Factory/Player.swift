//
//  Player.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 13/01/2022.
//

import Foundation

class Player {
    
    private var fighter: Character!
    
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
    
    func createTeams() {
        let allCharacters = [Warrior(), Magus(), Dwarf(), Archer(), Witch()]
        while team.count < 3 {
            print("ðĪš Choose your character \(team.count + 1)! Type 1 to 5: ðĪš")
            for character in allCharacters {
                print("\(character.description)")
            }
            let choice = readLine()
            switch choice {
            case "1" :
                team.append(Warrior()); chooseName(typeCharacter: "Warrior ðŠ")
            case "2" :
                team.append(Magus()); chooseName(typeCharacter: "Magus ð§ââïļ")
            case "3" :
                team.append(Dwarf()); chooseName(typeCharacter: "Dwarf ðââïļ")
            case "4" :
                team.append(Archer()); chooseName(typeCharacter: "Archer ðđ")
            case "5" :
                team.append(Witch()); chooseName(typeCharacter: "Witch ð§")
            default: print("\n ðĻ Type 1 to 5 to choose a Character ðĻ \n")
            }
        }
    }
    
    //Choose a name for the selected character and check if the name isn't already use
    
    private func chooseName(typeCharacter type: String) {
        print("\n Choose a name for \(type) \n")
        
        if let userInput = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !userInput.isEmpty {
            if Character.charactersNames.contains(userInput) {
                print("â This name is not available. â")
                chooseName(typeCharacter: type)
            } else {
                Character.charactersNames.append(userInput)
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
                print("\(index + 1). \(character.name) the \(character.characterType) âĪïļ:\(character.lifePoints) (maxâĪïļ:\(Character.maxLifePoints))\n")
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
                print("â This is not a valid choice â")
                chooseCharacter()
            }
        }
    }
    
    //Choose a action each round
    
    func chooseAction(enemyTeams: [Character]) {
        print("What do you want to do?\n"
              + "\n 1. â Help a partner â"
              + "\n 2. âïļ Fight a ennemy âïļ \n")
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
            print("\n ð This is a bonus ð")
            print("\n ð You won this weapon ðĄïļ \(bonusWeapon.name), the damage point is \(bonusWeapon.force) ð")
            chooseBonus(acceptBonusWeapon: bonusWeapon)        }
    }
    
    //Accept or refuse the bonus
    
    private func chooseBonus(acceptBonusWeapon: Weapon) {
        print("\n Do you want it\n\n"
              + "1. Yes ð \n"
              + "2. No ð \n")
        
        if let choice = readLine() {
            switch choice {
            case "1" :
                fighter.currentWeapon = acceptBonusWeapon
                print("\n Ok, I take it ð \n")
            case "2" :
                print("\n Ok, I leave it ð \n")
                break
            default :
                print("Choose a answer")
                chooseBonus(acceptBonusWeapon: acceptBonusWeapon)
            }
        }
    }
    
    //Choose the team member you want to help
    
    private func healChoices() {
        print("â Which Character do you want to help ? You will had \(fighter.healSkill) life points â")
        for (index, character) in team.enumerated() {
            if character.lifePoints > 0 { // âĢ
                print("\(index + 1). â Nurse \(character.name) the \(character.characterType) (\(character.lifePoints)/\(Character.maxLifePoints) âĪïļ) â \n")
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
        if target.lifePoints <= Character.maxLifePoints - fighter.healSkill {
            target.lifePoints += fighter.healSkill
            print("\(fighter.name) give \(fighter.healSkill) âĪïļ. Now \(target.name) the \(target.characterType) has \(target.lifePoints) âĪïļ \n")
        } else if target.lifePoints == Character.maxLifePoints {
            print("\n He has already the maximum life point")
        } else {
            print("\(target.name) get back \(Character.maxLifePoints - target.lifePoints) life point")
            target.lifePoints += Character.maxLifePoints - target.lifePoints
            print(" \(target.name) has now \(Character.maxLifePoints) life \n")
        }
    }
    
    //Attack and choose which enemy
    
    private func attackChoices(enemyTeams: [Character]) {
        print("\n âïļ Choose your enemy âïļ \n")
        for (index, character) in enemyTeams.enumerated() {
            if character.lifePoints > 0 {
                print("\(index + 1). Attack \(character.name) the \(character.characterType) âĪïļ:\(character.lifePoints) (maxâĪïļ:\(Character.maxLifePoints)) \n")
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
        print("\n  \(target.name) the \(target.characterType) lose \(fighter.currentWeapon.force) life Points ð \n")
        if target.lifePoints > 0 {
            print("\(target.name) the \(target.characterType) has now \(target.lifePoints)/\(Character.maxLifePoints) âĪïļ \n")
        } else {
            print("â ïļâ ïļâ ïļ \(target.name) the \(target.characterType) is dead â ïļâ ïļâ ïļ \n")
            target.lifePoints = 0
        }
        fighter.currentWeapon = fighter.defaultWeapon // âĢ Character takes back his default weapon at the end of his turn
    }
}
