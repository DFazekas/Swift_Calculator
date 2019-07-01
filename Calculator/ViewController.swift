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
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        // Handles clicking operations.
        isFinishedTyping = true
        
        // Get displayed number.
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display lable text to a Double.")
        }
        
        // Identify which operation to apply.
        if let calcMethod = sender.currentTitle {
            // Reset displayed number.
            if calcMethod == "AC" {
                displayLabel.text = "0"
            }
            
            // Toggle negativity.
            else if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            }
                
            // Convert to percentage.
            else if calcMethod == "%" {
                displayLabel.text = String(number / 100)
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

