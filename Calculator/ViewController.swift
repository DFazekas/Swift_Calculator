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
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        // Handles clicking operations.
        isFinishedTyping = true
        
        // Identify which operation to apply.
        if let calcMethod = sender.currentTitle {
            // Reset displayed number.
            if calcMethod == "AC" {
                displayValue = 0
            }
            
            // Toggle negativity.
            else if calcMethod == "+/-" {
                displayValue *= -1
            }
                
            // Convert to percentage.
            else if calcMethod == "%" {
                displayValue *= 0.01
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

