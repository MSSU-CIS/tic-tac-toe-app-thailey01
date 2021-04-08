//
//  ViewController.swift
//  TicTacToe-Practice
//
//  Created by Borchert, Otto on 2/22/20.
//  Copyright © 2020 Borchert, Otto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var upperLeft: UIImageView!
    @IBOutlet var upperMiddle: UIImageView!
    @IBOutlet var upperRight: UIImageView!
    @IBOutlet var centerLeft: UIImageView!
    @IBOutlet var centerMiddle: UIImageView!
    @IBOutlet var centerRight: UIImageView!
    @IBOutlet var bottomLeft: UIImageView!
    @IBOutlet var bottomMiddle: UIImageView!
    @IBOutlet var bottomRight: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var oLabel: UILabel!
    @IBOutlet weak var tiesLabel: UILabel!
    
    var images: [[UIImageView]]? = nil

    //TODO: Create a model instance variable
    let board = TicTacToeBoard();
    let scoreboard = Scoreboard();
    var gameOn = false;
    
    //TODO (in the View): Make sure all of the board images are blank.png

    //TODO (in the View, and link here in the Controller): Create a new label for "status text" Ex: Whose turn it is, whether someone won, and whether there was an invalid move
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        if !gameOn {
            return;
        }
        //Step 1 - Get the row number and column number from the button text (See hint in assignment instructions)
        let buttonText = sender.titleLabel!.text;
        var index = 0;
        var charAt = buttonText!.index(buttonText!.startIndex, offsetBy: index);
        let row = buttonText![charAt].wholeNumberValue!;
        index = 2;
        charAt = buttonText!.index(buttonText!.startIndex, offsetBy: index);
        let column = buttonText![charAt].wholeNumberValue!;
        
        //Step 2 - Place the marker in the *model*
        let placementSuccessful = board.placeMarker(row: row, column: column);
        
        //If placing was successful....
           //Step 3 - Get the turn from the *model* and place the appropriate image in the spot in the images array
        if(placementSuccessful){
            var turn = board.getTurn();
            let currentImage = self.getImageFromPosition(row: row, column: column);
            if(turn == "X"){
                currentImage.image = UIImage(named: "X");
            }else{
                currentImage.image = UIImage(named: "O");
            }
        
           //Step 4 - Check for a winner, updating the status message and creating a countdown timer to reset the game if necessary
           // Check the EggTimer assignment on Udemy for hints on creating the countdown timer
           // Make sure you reset the images to blank.png
            let winner: String = board.didWin();
            if(winner != " "){
                gameOn = false;
                if(winner == "T"){
                    scoreboard.addTie();
                    statusLabel.text = "Tie!";
                }else{
                    if(winner == "X"){
                        scoreboard.addXWin();
                    }else{
                        scoreboard.addOWin();
                    }
                    statusLabel.text = winner + " wins!";
                }
                var runCount = 0;
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                    runCount += 1;
                    if runCount == 10{
                        timer.invalidate();
                        self.reset();
                    }
                }
           //Step 5 - If no one won, make the *model* go to the next turn, get the current turn from the model and update the status message.
            }else{
                board.nextTurn();
                turn = board.getTurn();
                statusLabel.text = turn + " turn!";
            }
            
        //If placing the marker wasn't successful, change the status message, so the user knows what's wrong
        }else{
            statusLabel.text = "Unable to pick that position";
        }
        
    }
    
    private func reset(){
        board.reset()
        upperLeft.image = UIImage(named: "blank");
        upperMiddle.image = UIImage(named: "blank");
        upperRight.image = UIImage(named: "blank");
        centerLeft.image = UIImage(named: "blank");
        centerMiddle.image = UIImage(named: "blank");
        centerRight.image = UIImage(named: "blank");
        bottomLeft.image = UIImage(named: "blank");
        bottomMiddle.image = UIImage(named: "blank");
        bottomRight.image = UIImage(named: "blank");
        statusLabel.text = board.getTurn() + " turn!";
        let records = scoreboard.getRecords();
        xLabel.text = "X Wins: " + records[0];
        oLabel.text = "O Wins: " + records[1];
        tiesLabel.text = "Ties: " + records[2];
        gameOn = true;
        
    }
    
    private func getImageFromPosition(row: Int, column: Int) -> UIImageView{
        switch row {
        case 0:
            switch column {
            case 0:
                return upperLeft;
            case 1:
                return upperMiddle;
            case 2:
                return upperRight;
            default:
                return upperLeft;
            }
        case 1:
            switch column {
            case 0:
                return centerLeft;
            case 1:
                return centerMiddle;
            case 2:
                return centerRight;
            default:
                return upperLeft;
            }
        case 2:
            switch column {
            case 0:
                return bottomLeft;
            case 1:
                return bottomMiddle;
            case 2:
                return bottomRight;
            default:
                return upperLeft;
            }
        default:
            return upperLeft;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // This loads the image array so it matches the model
        images = [[upperLeft, upperMiddle, upperRight],
                  [centerLeft, centerMiddle, centerRight],
                  [bottomLeft, bottomMiddle, bottomRight]]
        statusLabel.text = board.getTurn() + " turn!";
        gameOn = true;

    }


}

