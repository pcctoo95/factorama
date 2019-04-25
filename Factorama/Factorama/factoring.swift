//
//  factoring.swift
//  Travel Agent
//
//  Created by Student on 3/28/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

struct Factorizor {
    var numberToFactor: Int
    var factorPairs : [(Int, Int)]
    var factors : [Int]
    var numberOfFactorPairs : Int {
        return factorPairs.count
    } 
    
    init(numberToFactor: Int) {
        self.numberToFactor = numberToFactor
        self.factorPairs = FindFactorPairs(numberToFactor: self.numberToFactor)
        self.factors = FindFactors(numberToFactor: self.numberToFactor)
    }
    
    func IsFactorPair(factor1: Int, factor2: Int) -> Bool {
        for pair in self.factorPairs {
            if (pair == (factor1, factor2) || pair == (factor2, factor1)){
                return true
            }
        }
        return false
    }
}

func FindFactors(numberToFactor: Int) -> [Int] {
    var factors = [Int]()
    for factor in Range(1...Int(sqrt(Double(numberToFactor)) + 1)) {
        if numberToFactor % factor == 0{
            factors.append(factor)
            factors.append( numberToFactor / factor)
        }
    }
    return factors
}
func FindFactorPairs(numberToFactor: Int) -> [(Int, Int)] {
    var factorPairs = [(Int, Int)]()
    for factor in Range(1...Int(sqrt(Double(numberToFactor)) + 1)) {
        if numberToFactor % factor == 0{
            factorPairs.append((factor, numberToFactor / factor))
        }
    }
    return factorPairs
}
