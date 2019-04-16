//
//  puzzleManager.swift
//  Prototype
//
//  Created by student on 4/4/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

class PuzzleManager{
    var easyPuzzles : Array<Puzzle>
    var mediumPuzzles : Array<Puzzle>
    var hardPuzzles : Array<Puzzle>
    var currentPuzzle: Puzzle
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
        easyPuzzles = Array<Puzzle>()
        var usedArray = Array<Int>()
        for x in 1...144{
            let puzzle = Puzzle(numToSplit: x)
            
            
        }
        currentPuzzle = easyPuzzles[0]
        
    }
    
    func submitFactor(lhs: Int, rhs: Int)->Bool{
        let f = Factor(left: lhs, right: rhs)
        if let index = currentPuzzle.possibleFactors.firstIndex(of: f){
            puzzles[currentPuzzle].foundFactors.append(f)
            puzzles[currentPuzzle].possibleFactors.remove(at: index)
            return true
        }
        return false
    }
    
    
    
}
var manager = PuzzleManager()

