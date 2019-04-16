//
//  FactorGame.swift
//  factorGame
//
//  Created by student on 4/2/19.
//  Copyright © 2019 com.joshuakneilson. All rights reserved.
//

import Foundation

struct FactorGame {
    var dificulty = ["Easy", "Medium", "Hard"]
    
    var Easy = [4,6,8,10,12,14,16,18,20]
    var Medium = [36,42,53,54]
    var Hard = [72,48,56,75,100]
    var currentSetting = 0
    var currentNumber = 0
    var answers = [""]
    var answerPairs = [(0,0)]
}
var factorGame = FactorGame()



