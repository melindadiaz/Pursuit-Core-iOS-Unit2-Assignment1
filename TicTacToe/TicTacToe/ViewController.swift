//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winningLabel: UILabel!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet var gameButtons: [UIButton]!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: UIButton) {
        
        var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for i in 1..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
                winningLabel.isHidden = true
                playAgainButton.isHidden = true
                
                winningLabel.center = CGPoint(x: winningLabel.center.x - 500, y: winningLabel.center.y)
                playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
                
            }
            
            winningLabel.isHidden = true
            playAgainButton.isHidden = true
            
        }
        var activeGame = true
        var activePlayer = 1
        
        
        func gameButtons(_ sender: UIButton) {
            
            let activePosition = sender.tag - 1
            
            if gameState[activePosition] == 0 && activeGame {
                
                gameState[activePosition] = activePlayer
                
                if activePlayer == 1 {
                    
                    sender.setImage(UIImage(named: "ximage"), for: [])
                    activePlayer = 2
                    
                    
                } else {
                    
                    sender.setImage(UIImage(named: "cursive-printable-letter-o"), for: [])
                    activePlayer = 1
                }
                
                for combination in TicTacToeBrain.winningAlgorithm {
                    
                    if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                        
                        activeGame = false
                        
                        winningLabel.isHidden = false
                        playAgainButton.isHidden = false
                        
                        if gameState[combination[0]] == 1 {
                            
                            winningLabel.text = "Player 1 won!"
                            
                        } else {
                            
                            winningLabel.text = "Player 2 won!"
                            
                        }
                        
                        
                        
                        
                    }
                    
                    
                }
                
            }
        }
    }
}
