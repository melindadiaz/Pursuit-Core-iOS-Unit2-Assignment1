//
//  Player.swift
//  TicTacToe
//
//  Created by Melinda Diaz on 11/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

enum PlayerSelect {
    
    case playerO
    case playerX
    
    func playerMark() -> UIImage {
        switch self {
        case.playerO:
            return UIImage(named: "cursive-printable-letter-o")!
        case.playerX:
            return UIImage(named: "ximage")!
        }
}
}
