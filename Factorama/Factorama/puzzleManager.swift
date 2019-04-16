//
//  puzzleManager.swift
//  Prototype
//
//  Created by student on 4/4/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

class PuzzleManager{
    var puzzles : Array<puzzle>
    var currentPuzzle: Int
    var totalScore :Int{
        get{
            var runningTotal = 0.0
            var maxTotal = 0.0
            for x in puzzles{
                runningTotal += Double(x.currentScore)
                maxTotal += Double(x.possibleScore)
            }
            
            return Int((runningTotal / maxTotal) * 100.0)
        }
        
        
    }
    var goodNumbers = [12, 18, 20, 24, 28, 30, 32, 36, 40, 42, 44, 45, 48, 50, 52, 54, 56, 60, 63, 64, 66, 68, 70, 72, 75, 76, 78, 80, 84, 88, 90, 92, 96, 98, 99, 100, 102, 104, 105, 108, 110, 112, 114, 116, 117, 120, 124, 126, 128, 130, 132, 135, 136, 138, 140, 144]
    init(){
        puzzles = Array<puzzle>()
        var usedArray = Array<Int>()
        for _ in 0...5{
            var index = 0
            
            while index == 0 || usedArray.contains(index){
                index = Int.random(in: 0..<goodNumbers.count)
            }
            usedArray.append(index)
            puzzles.append(puzzle(numToSplit: self.goodNumbers[index]))
            
        }
        currentPuzzle = 0
        
    }
    
    func submitFactor(lhs: Int, rhs: Int)->Bool{
        let f = Factor(left: lhs, right: rhs)
        if let index = puzzles[currentPuzzle].possibleFactors.firstIndex(of: f){
            puzzles[currentPuzzle].foundFactors.append(f)
            puzzles[currentPuzzle].possibleFactors.remove(at: index)
            return true
        }
        return false
    }
    
    
    
}
var manager = PuzzleManager()

