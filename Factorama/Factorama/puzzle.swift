//
//  puzzle.swift
//  Prototype
//
//  Created by student on 4/2/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation


class Puzzle{
    var numToSplit : Int
    var foundFactors : [Factor]
    var possibleFactors : [Factor]
    var leftOfset: Int
    var rightOfset : Int
    var possibleScore: Int
    var numFactors : Int {
        get{
            return foundFactors.count + possibleFactors.count
        }
    }
    var currentScore:Int {
        get{
            return min(totalR, totalL)
        }
    }
    
    var imbalance : Int {
        get{
            var left = leftOfset
            var right = rightOfset
            for factor in foundFactors{
                left += factor.left
                right += factor.right
                
            }
            return right - left
        }
    }
    var totalR : Int{
        get{
            var total = rightOfset
            for factor in foundFactors{
                total += factor.right
            }
            return total
        }
    }
    var totalL : Int{
        get{
            var total = leftOfset
            for factor in foundFactors{
                total += factor.left
            }
            return total
        }
    }
    
    
    init(numToSplit:Int){
        self.numToSplit = numToSplit
        self.foundFactors = [Factor]()
        self.possibleFactors = [Factor]()
        self.leftOfset = 0
        self.rightOfset = 0
        self.possibleScore = 0
        GenerateFactors(num: numToSplit)
        
        CreateOfset()
    }
    
    func CreateOfset(){
        var rightTotal = 0
        var leftTotal = 0
        for x in possibleFactors{
            leftTotal += x.left
            rightTotal += x.right
        }
        let base = Int.random(in: 1 ... 5)
        let difference = leftTotal - rightTotal
        if(difference < 0){
            leftOfset = base + (difference * -1)
            rightOfset = base
        }else{
            leftOfset = base
            rightOfset = base + difference
        }
        self.possibleScore = rightTotal + rightOfset
    }
    
    func GenerateFactors(num: Int){
        for n in 1...(num/2)+1{
            if (num % n == 0){
                let right = num/n
                var factor = Factor(left:n,right:right)
                if !possibleFactors.contains(factor){
                    if(Bool.random()){
                        factor.swap()
                    }
                    possibleFactors.append(factor)
                }
            }
        }
    }
}

struct Factor : Equatable {
    static func == (lhs: Factor, rhs: Factor) -> Bool {
        if lhs.left == rhs.left && lhs.right == rhs.right{
            return true;
        }else if lhs.left == rhs.right && lhs.right == rhs.left{
            return true
        }else{
            return false
        }
    }
    
    init(left: Int, right: Int){
        self.left = left
        self.right = right
    }
    init(factor: String){
        let factors = factor.split(separator: " ")
        self.left = Int(factors[0].description)!
        self.right = Int(factors[2].description)!
        
        
    }
    
    
    var left : Int
    var right : Int
    mutating func swap(){
        let temp = left
        left = right
        right = temp
    }
}
