//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTyping: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double!")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        // Handles clicking operations.
        isFinishedTyping = true
        
        calculator.setNumber(displayValue)
        
        // Identify which operation to apply.
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        // Handles clicking digits.
        if var newValue = sender.currentTitle {
            
            // Handles edge-case for first digit.
            if isFinishedTyping {
                
                // Edge-case where first digit is a decimal.
                if newValue == "." {
                    newValue = "0."
                }
                
                // Update displayed value.
                displayLabel.text = newValue
                isFinishedTyping = false
                
            } else {
                let currentDisplayValue = displayLabel.text!
                if newValue == "." && currentDisplayValue.contains(".") {
                    return
                    
                }
                    
                // Update displayed value.
                displayLabel.text = currentDisplayValue + newValue
                
            }
        }
    
    }

}

