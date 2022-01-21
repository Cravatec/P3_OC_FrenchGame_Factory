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
    
    //Array des joueurs
    private var playerNames: [String] {
        var names: [String] = []
        for player in players {
            names.append(player.name)
        }
        return names
    }
    //Déroulement du jeu
    func startGame() {
        print("⚔️ Welcome to the Ultime Game Combat ⚔️")
        
        for _ in 1...2 { //Création équipe pour les deux joueurs
            playerMaker()
            teamMaker()
        }
        rounds()
        gameEnd()
    }
    //Donner un nom à l'équipe
    private func playerMaker() {
        print("\n🤺 Player \(players.count+1), what's your team name? \n")

        if let nameTeam = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !nameTeam.isEmpty {
            if playerNames.contains(nameTeam) {
                print("❌ This name is already use ! ❌")
                playerMaker()
            } else {
                let player = Player(name: nameTeam)
                players.append(player)
                print("\n 🔥 Welcome to the \(nameTeam) Team 🔥 \n")
            }
        } else {
            print("❌ Try a another name ❌")
            playerMaker()
        }
    }
    //Création équipe, choix des personages
    func teamMaker() {
        print("\n 🤺 Choose yours 3 characters for your team 🤺 \n")
        for player in players {
            player.createTeams()
        }
    }
    //Déroulement d'un tour
    private func rounds() {
        
        while players[0].deadTeam == false && players[1].deadTeam == false {
            
            print("ROUND \(roundCount + 1)")
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
    //Fin de partie, appel des fonctions du résultat et stats
    private func gameEnd() {
        print("\n 🪦 Game Over 🪦 \n")
        winner()
        stats()
    }
    //Affichage du joueur gagnant
    private func winner() {
        if players[0].teamMembersAlive.count > players[1].teamMembersAlive.count {
            print("\n 🥇 Team \(players[0].name) win 🥇")
        } else {
            print("\n 🥇 Team \(players[1].name) win 🥇")
        }
    }
    //Stats de la partie
    private func stats() {
        print("\n Results: 🛎 \(players[0].name) VS \(players[1].name) end after \(roundCount+1) rounds 🛎")
        // stats:
        for player in players {
            print("\n ☠️☠️☠️ Death in \(player.name) team ☠️☠️☠️")
            for character in player.team where character.lifePoints == 0 {
                characterStats(character: character)
            }
            if player.teamMembersAlive.count > 0 {
                print("\n 🙌 Alive in \(player.name) team 🙌 ")
                for character in player.teamMembersAlive {
                    characterStats(character: character)
                }
            }
        }
        winner()
    }
    //Stats de l'équipe
    private func characterStats(character: Character) {
        print("\n \(character.name) the \(character.characterType) still have ❤️: \(character.lifePoints)")
    }
}
