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
        append(digit)
    }

    @IBAction func appendDecimalPoint() {
        
        if !enteringNumber {
            append("0.")
        } else if display.text!.rangeOfString(".") == nil {
            append(".")
        }
    }
    
    private func append(s: String) {
        
        if enteringNumber {
            display.text = display.text! + s
        } else {
            display.text = s
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
            performOperation { $1 * $0 }
        case "÷":
            performOperation { $1 / $0 }
        case "+":
            performOperation { $1 + $0 }
        case "−":
            performOperation { $1 - $0 }
        case "√":
            performOperation { sqrt($0) }
        default: break
            
        }
        
    }

    private func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    private func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    
}

