//
//  Game.swift
//  P3_OC_FrenchGame_Factory
//
//  Created by Sam on 05/01/2022.
//

import Foundation

class Game {
    var roundCount = 0
    
    var players = 0
    
    func startGame() {
        print("Welcome to the Game")
    }
    
    func createPlayer() {
        print("What's your team name?")
        
        if let userTeamName = readLine() {
            print("Welcome to the \(userTeamName) Team")
        }
            
    }
}


