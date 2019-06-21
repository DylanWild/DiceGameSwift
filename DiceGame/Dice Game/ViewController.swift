//
//  ViewController.swift
//  Dice Game
//
//  Created by Codenation13 on 20/06/2019.
//  Copyright © 2019 codenation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Variables
    var dice = [#imageLiteral(resourceName: "Kismet-Ace.png"),#imageLiteral(resourceName: "Kismet-Deuce"),#imageLiteral(resourceName: "Kismet-Trey"),#imageLiteral(resourceName: "Kismet-Four"),#imageLiteral(resourceName: "Kismet-Five"),#imageLiteral(resourceName: "Kismet-Six")]
    var randomDiceIndex : Int = 0
    var scorePlayerOne: Int = 0
    var scorePlayerTwo: Int = 0
    var playerOneRollCount = 0
    var playerTwoRollCount = 0
    
    //MARK:Outlets
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var rulesLabel: UILabel!
    
    @IBOutlet weak var mainMessageLabel: UILabel!
    
    @IBOutlet weak var secMessageLabel: UILabel!
    
    @IBOutlet weak var diceImage: UIImageView!
    
    @IBOutlet weak var rollButton: UIButton!
    
   
    
    @IBOutlet weak var playerTwoScore: UILabel!
    
    
    @IBOutlet weak var playerTwoButton: UIButton!
    
    
    @IBOutlet weak var pOneRollCountLabel: UILabel!
    
    
    @IBOutlet weak var pTwoRollCountLabel: UILabel!
    
    //MARK:Action
    @IBAction func rollButtonAction(_ sender: Any) {
       
        randomDiceIndex = Int.random(in: 0...5)//random number from 0 to 5

        diceImage.image = dice[randomDiceIndex]
        scorePlayerOne += randomDiceIndex+1
        scoreLabel.text = "\(scorePlayerOne)"
        diceLogicPlayerOne()
//        playerOneRollCount += 1
//        pOneRollCountLabel.text = "\(playerOneRollCount)"
        playerOneSwitch()
    }
    
    
    @IBAction func playerTwoAction(_ sender: Any) {
        randomDiceIndex = Int.random(in: 0...5)//random number from 0 to 5

        diceImage.image = dice[randomDiceIndex]
        scorePlayerTwo += randomDiceIndex+1
        playerTwoScore.text = "\(scorePlayerTwo)"
        diceLogicPlayerTwo()
//        playerTwoRollCount += 1
//        pTwoRollCountLabel.text = "\(playerTwoRollCount)"
        playerTwoSwitch()
    }
    
    //MARK: Functions

    func diceLogicPlayerOne(){

        if(randomDiceIndex == 0){
            scorePlayerOne = 0
            print("loser")
            secMessageLabel.text = "Back to 0, Player 1"
        }
        else if(scorePlayerOne >= 21){
            scorePlayerOne = 0
            scorePlayerTwo = 0
            playerOneRollCount = 0
            playerTwoRollCount = 0
            print("winner")
            secMessageLabel.text = "Smash it laaaaaaa, player one wins, roll to play again!"
        }
        else {
            secMessageLabel.text = ""
            return
        }
        
    }
    
    func diceLogicPlayerTwo(){
        
        if(randomDiceIndex == 0){
            scorePlayerTwo = 0
            print("loser")
            secMessageLabel.text = "Back to 0, Player 2"
        }
        else if(scorePlayerTwo >= 21 ){
            scorePlayerTwo = 0
            scorePlayerOne = 0
            playerOneRollCount = 0
            playerTwoRollCount = 0
            print("winner")
            secMessageLabel.text = "Smash it laaaaaaa, player two wins, roll to play again!"
        }
        else {
            secMessageLabel.text = ""
            return
        }
        
    }
 
    
    func playerOneSwitch() { //function used to switch between buttons, function activated upon player one button pressed to hide p1 button and show p2
        rollButton.isHidden = true
        playerTwoButton.isHidden = false
    }
    
    func playerTwoSwitch() {
        playerTwoButton.isHidden = true
        rollButton.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        playerTwoButton.alpha = 0.0;
        view.self.backgroundColor = UIColor(red: 3/255, green: 188/255, blue: 34/255, alpha: 1)
        // Do any additional setup after loading the view, typically from a nib.
    }

}

