//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Devon Fazekas on 2019-07-01.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?

    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }

    mutating func calculate (symbol: String) -> Double? {
        if let num = number {
            
            switch symbol {
            case "AC":
                return 0
                
            case "+/-":
                return num * -1
            
            case "%":
                return num * 0.01
        
            case "=":
                return performCalculation(num)
            
            default:
                intermediateCalculation = (n1: num, calcMethod: symbol)
            }
        }
        
        return nil
    }
    
    private func performCalculation(_ n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
            let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}
