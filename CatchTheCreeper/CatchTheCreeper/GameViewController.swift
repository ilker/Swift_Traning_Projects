//
//  GameViewController.swift
//  CatchTheCreeper
//
//  Created by ILKER on 23.05.2023.
//

import UIKit

class GameViewController: UIViewController {

    var positionTimer = Timer()
    var gameTimer = Timer()
    var counter = 10 // Game Time
    var score = 0
    var highScore = 0
    
    @IBOutlet weak var creeperHead: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.title = "Time: \(counter)"
        
        positionTimer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(positionChange), userInfo: nil, repeats: true)
        
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(gameTime), userInfo: nil, repeats: true)
        
        creeperHead.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(creeperClicked))
        creeperHead.addGestureRecognizer(gestureRecognizer)
        
        //HighScore UserDefaults
        let storedScore = UserDefaults.standard.object(forKey: "highScore")
        
        if let storedHS = storedScore as? Int{
            highScore = storedHS
            highScoreLabel.text = "High Score: \(storedHS)"
        }
        
    }
    
    @objc func creeperClicked() {
        self.creeperHead.isHidden = true
        
        score += 1 //Score Up
        self.scoreLabel.text = "Score: \(score)"
    }
    
    // Position Change Timer
    @objc func positionChange() {
        //random position
        let width = view.frame.size.width
        let height = view.frame.size.height
        let positionWidth = Double.random(in: 100...width-100)
        let positionHeight = Double.random(in: 150...height-150)
        
        //Change Position
        self.creeperHead.frame.origin.x = positionWidth
        self.creeperHead.frame.origin.y = positionHeight
        
        self.creeperHead.isHidden = false
        
        
    }
    
    // Game Timer
    @objc func gameTime() {
        counter -= 1
        self.navigationItem.title = "Time: \(counter)"
        
        if counter == 0 {
            positionTimer.invalidate()
            gameTimer.invalidate()
            
            if score > highScore {
                highScore = score
                highScoreLabel.text = "High Score: \(highScore)"
                UserDefaults.standard.set(highScore, forKey: "highScore")
            }
            
            //Time's Up Alert
            let alert = UIAlertController(title: "Time's Up", message: "Score: \(score)", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
                self.navigationController?.popViewController(animated: true) //back to page
            }
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                //replay function
                self.score = 0
                self.counter = 10
                
                self.scoreLabel.text = "Score: \(self.score)"
                self.navigationItem.title = "Time: \(self.counter)"
                
                self.positionTimer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(self.positionChange), userInfo: nil, repeats: true)
                
                self.gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.gameTime), userInfo: nil, repeats: true)
                
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true)
        }
    }

}
