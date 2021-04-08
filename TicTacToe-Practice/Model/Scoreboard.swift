//
//  Scoreboard.swift
//  TicTacToe-Practice
//
//  Created by Trevor Hailey on 4/8/21.
//  Copyright © 2021 Borchert, Otto. All rights reserved.
//

import Foundation

class Scoreboard{
    var xWins: Int;
    var oWins: Int;
    var ties: Int;
    
    init(){
        xWins = 0;
        oWins = 0;
        ties = 0;
    }
    
    func reset(){
        xWins = 0;
        oWins = 0;
        ties = 0;
    }
    
    func getRecords() -> [String] {
        return [String(xWins), String(oWins), String(ties)];
    }
    
    func addXWin(){
        xWins += 1;
    }
    
    func addOWin(){
        oWins += 1;
    }
    
    func addTie(){
        ties += 1;
    }
}
