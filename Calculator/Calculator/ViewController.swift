//
//  ViewController.swift
//  Calculator
//
//  Created by Martin Rist on 24/05/2015.
//  Copyright (c) 2015 Martin Rist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            enteringNumber = false
        }
    }
    
    var enteringNumber: Bool = false
    var operandStack = Array<Double>()
    
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if enteringNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            enteringNumber = true
        }
        
    }

    @IBAction func enter() {
        enteringNumber = false
        operandStack.append(displayValue)
        println("\(operandStack)")
    }
 
    @IBAction func operate(sender: UIButton) {
        
        let operation = sender.currentTitle!
        if enteringNumber {
            enter()
        }
        
        switch operation {
        case "×":
            performOperation({(x, y) in y * x})
        case "÷":
            performOperation({(x, y) in y / x})
        case "+":
            performOperation({(x, y) in y + x})
        case "−":
            performOperation({(x, y) in y - x})
        default: break
            
        }
        
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    
}

