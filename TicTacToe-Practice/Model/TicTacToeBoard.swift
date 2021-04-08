//
//  TicTacToeBoard.swift
//  TicTacToe-Practice
//
//  Created by Borchert, Otto on 3/29/21.
//  Copyright © 2021 Borchert, Otto. All rights reserved.
//

import Foundation

class TicTacToeBoard {
  var board : [[String]]
  var turn : String

  init() {
    board = [[" ", " ", " "],[" ", " ", " "], [" ", " ", " "]]
    turn = "X" //X's turn
  }

  func reset() {
    board = [[" ", " ", " "],[" ", " ", " "], [" ", " ", " "]]
    turn = "X" //X's turn
  }

  // Won't be used in this app
  func displayBoard() {
    print(" \(board[0][0]) | \(board[0][1]) | \(board[0][2])")
    print("-----------")
    print( " \(board[1][0]) | \(board[1][1]) | \(board[1][2])")
    print("-----------")
    print( " \(board[2][0]) | \(board[2][1]) | \(board[2][2])")
    print()

    // OR (as a hideous nested loop)
    //for row in 0...2 {
    //  for col in 0...2 {
    //    if (col == 2) {
    //      print(" \(board[row][col])")
    //    } else {
    //      print(" \(board[row][col]) |", terminator:"")
    //    }
    //  }
    //  if (row != 2) {
    //    print("-----------")
    //  }
    //}
  }

  func isFull() -> Bool {
    for row in 0...2 {
      for col in 0...2 {
        if board[row][col] == " " {
          return false
        }
      }
    }
    return true
  }

  func placeMarker(row : Int, column : Int) -> Bool {
    if (row > 2 || row < 0 || column > 2 || column < 0) {
      print("Invalid location - try again");
      return false
    } else {
      if board[row][column] == " " {
        board[row][column] = turn
        return true
      } else {
        print("That's not a valid location")
        return false
      }
    }
  }

  func nextTurn() {
    if turn == "O" {
      turn = "X"
    } else {
      turn = "O"
    }
  }

  func getTurn() -> String {
    return turn
  }

  func didWin() -> String {
    // Row wins
    for row in 0...2 {
       if (board[row][0] == board[row][1] && board[row][1] == board[row][2] && board[row][0] != " ") {
         return board[row][0]
        }
    }
    // Column wins
    for col in 0...2 {
       if (board[0][col] == board[1][col] && board[1][col] == board[2][col] && board[0][col] != " ") {
         return board[0][col]
       }
    }
    // Diagonal wins
    if (board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != " ") {
      return board[0][0]
    }
    if (board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != " ") {
      return board[0][2]
    }

    if (isFull()) {
      return "T"
    } else {
      return " "
    }
  }
}
