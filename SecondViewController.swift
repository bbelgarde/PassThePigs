//
//  GamePageViewController.swift
//  Pass The Pigs
//
//  Created by Bryce Belgarde on 2/27/22.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var quitButton: UIButton!
    
    @IBOutlet weak var playerOneTitle: UILabel!
    @IBOutlet weak var playerTwoTitle: UILabel!
    
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    
    @IBOutlet weak var pigOne: UIImageView!
    @IBOutlet weak var pigTwo: UIImageView!
    
    
    var numberOfPlayers = 0
    var receivedString = ""
    var savedScore : Int? = nil
    var targetLabel : UILabel? = nil
    var turnScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfPlayers = Int(receivedString)!
        playerOneScore.text = "0"
        playerTwoScore.text = "0"
        savedScore = Int(playerOneScore.text!)!
        targetLabel = playerOneScore
        playerOneTitle.backgroundColor = UIColor.red
    }
    
    @IBAction func rollAction(_ sender: UIButton) {
        let pigValue1 = Int.random(in: 0...99)
        let pigValue2 = Int.random(in: 0...99)
        let pigScoreOne = pValue(pigValue: pigValue1, picture: pigOne)
        let pigScoreTwo = pValue(pigValue: pigValue2, picture: pigTwo)
        turnScore = getRollScore(pig1: pigScoreOne, pig2: pigScoreTwo)
        if turnScore == 0{
            targetLabel!.text = "\(String(describing: savedScore!))"
            switchUser()
        } else {
            targetLabel!.text = "\(String(describing: Int(targetLabel!.text!)! + turnScore))"
        }
    }
    
    @IBAction func passAction(_ sender: UIButton) {
        switchUser()
    }
    
    func switchUser () {
        if targetLabel == playerOneScore {
            playerOneTitle.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.0)       //clear background for player 1
            playerTwoTitle.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)       //red background for player 2
            targetLabel = playerTwoScore
            savedScore = Int(playerTwoScore.text!)
        } else {
            playerTwoTitle.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.0)       //remove highlight player 2
            playerOneTitle.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)       //highlight player 1
            targetLabel = playerOneScore
            savedScore = Int(playerOneScore.text!)
            
        }
    }
    
    func pValue(pigValue : Int, picture : UIImageView) -> Int {
        switch(pigValue){
        case(0...32):       //dotted side
            picture.image = UIImage(named: "SiderWithDot")
            return 1
        case(33...65):      //non-dotted side
            picture.image = UIImage(named: "SiderNoDot")
            return 2
        case(66...90):      //razorback
            picture.image = UIImage(named: "Razorback")
            return 4
        case(90...95):      //trotter
            picture.image = UIImage(named: "Trotter")
            return 8
        case(96...98):      //snouter
            picture.image = UIImage(named: "Snouter")
            return 16
        default:            //leaning jowler
            picture.image = UIImage(named: "LeaningJowler")
            return 32
        }
    }
    
    
    func getRollScore(pig1 : Int, pig2 : Int) -> Int {
        let total = pig1 + pig2
        switch(total){
        case(2):            //double dotted side
            return 1
        case(4):            //double non-dotted side
            return 1
        case(5...6):        //one razorback
            return 5
        case(8):            //double razorback
            return 20
        case(9...10):       //one trotter
            return 5
        case(12):           //one trotter, one razorback
            return 10
        case(16):           //double trotter
            return 20
        case(17...18):      //one snouter
            return 10
        case(20):           //snouter + razorback
            return 15
        case(24):           //snouter + trotter
            return 15
        case(32):           //double snouter
            return 40
        case(33...34):      //leaning jowler
            return 15
        case(36):           //leaning jowler + razorback
            return 20
        case(40):           //leaning jowler + trotter
            return 20
        case(48):           //leaning jowler + snouter
            return 25
        case(64):           //double leaning jowler
            return 60
        default:            //pig out
            return 0
        }
    }
    
}
