//
//  Game.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 05/01/2022.
//

import Foundation

class Game {
    
    //Start all functions for the game
    
    func startGame() {
        print("āļø Welcome to the Ultime Game Combat āļø")
        
        //Create team for player 1 & 2
        
        for _ in 1...2 {
            playerMaker()
            teamMaker()
        }
        rounds()
        gameEnd()
    }
    
    //Counter for rounds
    private var numberRound = 0
    
    //Array for the two players
    private var players: [Player] = []
    //Property for the name and avoid to have a duplicate name
    
    private var playerNames: [String] {
        var names: [String] = []
        for player in players {
            names.append(player.name)
        }
        return names
    }
    
    //Name the team, and check if it's already use
    
    private func playerMaker() {
        print("\nš¤ŗ Player \(players.count + 1), what's your team name? \n")
        
        if let nameTeam = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !nameTeam.isEmpty {
            if playerNames.contains(nameTeam) {
                print("ā This name is already use ! ā")
                playerMaker()
            } else {
                let player = Player(name: nameTeam)
                players.append(player)
                print("\n š„ Welcome to the \(nameTeam) Team š„ \n")
            }
        } else {
            print("ā Try a another name ā")
            playerMaker()
        }
    }
    
    func teamMaker() {
        print("\n š¤ŗ Choose yours 3 characters for your team š¤ŗ \n")
        for player in players {
            player.createTeams()
        }
    }
    
    private func rounds() {
        
        //check if a team still have a character alive and start a new round
        
        while players[0].deadTeam == false && players[1].deadTeam == false {
            
            print("ROUND \(numberRound + 1)")
            for player in players {
                if player.deadTeam == false {
                    let opponent = players.filter { player.name != $0.name }[0]
                    player.chooseCharacter()
                    player.chooseAction(enemyTeams: opponent.team)
                }
            }
            numberRound += 1
        }
    }
    
    //Call for the Game Over, Winner and stats print
    
    private func gameEnd() {
        print("\n šŖ¦ Game Over šŖ¦ \n")
        winner()
        stats()
    }
    
    //Show which team won
    
    private func winner() {
        if players[0].teamMembersAlive.count > players[1].teamMembersAlive.count {
            print("\n š„ Team \(players[0].name) win š„")
        } else {
            print("\n š„ Team \(players[1].name) win š„")
        }
    }
    
    //Show the stats for each team
    
    private func stats() {
        print("\n Results: š \(players[0].name) VS \(players[1].name) end after \(numberRound+1) rounds š")
        
        for player in players {
            print("\n ā ļøā ļøā ļø Death in \(player.name) team ā ļøā ļøā ļø")
            for character in player.team where character.lifePoints == 0 {
                characterStats(character: character)
            }
            if player.teamMembersAlive.count > 0 {
                print("\n š Alive in \(player.name) team š ")
                for character in player.teamMembersAlive {
                    characterStats(character: character)
                }
            }
        }
        winner()
    }
    
    //print for the stats
    
    private func characterStats(character: Character) {
        print("\(character.name) the \(character.characterType) still have ā¤ļø: \(character.lifePoints)")
    }
}
