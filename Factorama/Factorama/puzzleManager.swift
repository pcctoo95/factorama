//
//  puzzleManager.swift
//  Prototype
//
//  Created by student on 4/4/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

class PuzzleManager{
    var easyPuzzles : Array<puzzle>
    var mediumPuzzles : Array<puzzle>
    var hardPuzzles : Array<puzzle>
    var currentPuzzle: puzzle
    var totalScore :Int{
        get{
            var runningTotal = 0.0
            var maxTotal = 0.0
            for x in easyPuzzles{
                runningTotal += Double(x.currentScore)
                maxTotal += Double(x.possibleScore)
            }
            for x in mediumPuzzles{
                runningTotal += Double(x.currentScore)
                maxTotal += Double(x.possibleScore)
            }
            for x in hardPuzzles{
                runningTotal += Double(x.currentScore)
                maxTotal += Double(x.possibleScore)
            }
            
            return Int((runningTotal / maxTotal) * 100.0)
        }
        
        
    }
    init(){
        easyPuzzles = Array<puzzle>()
        var usedArray = Array<Int>()
        for _ in 1...144{
            let puzzle puzzles.append(puzzle(numToSplit: self.goodNumbers[index]))
            
        }
        currentPuzzle = easyPuzzles[0]
        
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

