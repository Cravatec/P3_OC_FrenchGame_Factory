//
//  Game.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 05/01/2022.
//

import Foundation

class Game {
    
    //Compte des tours
    private var roundCount = 0
    
    //Array du joueur
    private var players: [Player] = []
    
    //
    private var allPlayerNames: [String] {
        var names: [String] = []
        for player in players {
            names.append(player.name)
        }
        return names
    }
    
    func startGame() {
        print("⚔️ Welcome to the Ultime Game Combat ⚔️")
        
        for _ in 1...2 {
            playerMaker()
            teamMaker()
        }
        rounds()
        gameEnd()
    }
    //Donner un nom à l'équipe
//    func playerMaker() {
//        print("\n 🤺 Player \(players.count+1), what's your team name? \n")
//
//        if let userTeamName = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !userTeamName.isEmpty {
//            if userTeamName.contains(userTeamName) {
//                print("This name is already use")
//                playerMaker()
//            }
//            else {
//            //Assigné à un joueur
//            let player = Player(name: userTeamName)
//            players.append(player)
//                print("Welcome to the \(userTeamName) Team")
//
//        }
//        }
//    }
    private func playerMaker() {
        print("\n🤺 Player \(players.count+1), what's your team name? \n")

        if let nameTeam = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !nameTeam.isEmpty {
            if allPlayerNames.contains(nameTeam) {
                print("❌ This name is already use ! ❌")
                playerMaker()
            } else {
                let player = Player(name: nameTeam)
                players.append(player)
                print("\n 🔥 Welcome to the \(nameTeam) Team 🔥 \n")
            }
        } else {
            print("Try a another name")
            playerMaker()
        }
    }
    //Création équipe
    func teamMaker() {
        print("\n Choose yours 3 characters for your team \n")
        for player in players {
            player.createTeams()
            
        }
    }
    
    private func rounds() {
        
        while players[0].deadTeam == false && players[1].deadTeam == false {
            
            print("ROUND \(roundCount+1)")
            for player in players {
                if player.deadTeam == false {
                    let opponent = players.filter { player.name != $0.name }[0]
                    player.chooseCharacter()
                    player.chooseAction(enemyTeams: opponent.team)
                }
            }
            roundCount += 1
        }
    }
    
    private func gameEnd() {
        winner()
        stats()
    }
    
    private func winner() {
        print("Result")
        if players[0].teamMembersAlive.count > players[1].teamMembersAlive.count {
            print("🥇 Team \(players[0].name) win 🥇")
        } else {
            print("🥇 Team \(players[1].name) win 🥇")
        }
    }
    private func stats() {
        print("\n\n Results: \(players[0].name) VS \(players[1].name) end after \(roundCount+1) rounds")
        // stats:
        for player in players {
            print("\n-- ☠️ Death in \(player.name) team ☠️ --")
            for character in player.team where character.lifePoints == 0 {
                characterStats(character: character)
            }
            if player.teamMembersAlive.count > 0 {
                print("🙌 Alive in \(player.name) team 🙌 ")
                for character in player.teamMembersAlive {
                    characterStats(character: character)
                }
            }
        }
    }
    private func characterStats(character: Character) {
        print("\n • '\(character.name)'"
              + "\n- Character: \(character.characterType)"
              + "\n- Life Points: \(character.lifePoints)")
    }
}
