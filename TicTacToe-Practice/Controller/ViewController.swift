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

    var images: [[UIImageView]]? = nil

    //TODO: Create a model instance variable
    
    //TODO (in the View): Make sure all of the board images are blank.png

    //TODO (in the View, and link here in the Controller): Create a new label for "status text" Ex: Whose turn it is, whether someone won, and whether there was an invalid move
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        //Step 1 - Get the row number and column number from the button text (See hint in assignment instructions)
        
        //Step 2 - Place the marker in the *model*
        
        //If placing was successful....
           //Step 3 - Get the turn from the *model* and place the appropriate image in the spot in the images array
        
           //Step 4 - Check for a winner, updating the status message and creating a countdown timer to reset the game if necessary
           // Check the EggTimer assignment on Udemy for hints on creating the countdown timer
           // Make sure you reset the images to blank.png
        
           //Step 5 - If no one won, make the *model* go to the next turn, get the current turn from the model and update the status message.
        
        //If placing the marker wasn't successful, change the status message, so the user knows what's wrong
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // This loads the image array so it matches the model
        images = [[upperLeft, upperMiddle, upperRight],
                  [centerLeft, centerMiddle, centerRight],
                  [bottomLeft, bottomMiddle, bottomRight]]

    }


}

