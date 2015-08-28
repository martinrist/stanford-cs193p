//
//  ViewController.swift
//  Calculator
//
//  Created by Martin Rist on 24/05/2015.
//  Copyright (c) 2015 Martin Rist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var history: UITextView!
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
        
        // If we're already entering a number and we're trying to add
        // a second decimal point, then abort
        if (digit == "." && enteringNumber
            && display.text!.rangeOfString(".") != nil) { return }

        if enteringNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            enteringNumber = true
        }
    }

    @IBAction func negate() {
        if enteringNumber {
            displayValue = -displayValue
            enteringNumber = true
        } else {
            performOperation { -$0 }
        }
        
    }
    
    @IBAction func clear() {
        history.text! = ""
        enteringNumber = false
        operandStack.removeAll()
        display.text! = "0"
    }
    
    private func updateStackAndHistory(value: Double, isOperationResult: Bool) {
        enteringNumber = false;
        operandStack.append(value)
        println("\(operandStack)")
        if isOperationResult {
            appendHistory("= \(value)")
        } else {
            appendHistory("\(value)")
        }
    }

    private func appendHistory(s: String) {
        history.text = s + "\n" + history.text!
    }
    
    @IBAction func enter() {
        updateStackAndHistory(displayValue, isOperationResult: false)
    }
    
    @IBAction func backspace() {

        if !enteringNumber { return }

        display.text = dropLast(display.text!)
        
        if (display.text! == "") || (display.text! == "-") {
            display.text! = "0"
            enteringNumber = false
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        
        let operation = sender.currentTitle!
        if enteringNumber {
            enter()
        }
        
        appendHistory("\(operation)");

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
        case "sin":
            performOperation { sin($0) }
        case "cos":
            performOperation { cos($0) }
        case "π":
            performOperation { M_PI }
        default: break
            
        }
    }

    private func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            updateStackAndHistory(displayValue, isOperationResult: true)
        }
    }
    
    private func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            updateStackAndHistory(displayValue, isOperationResult: true)
        }
    }
    
    private func performOperation(operation: () -> Double) {
        displayValue = operation()
        updateStackAndHistory(displayValue, isOperationResult: true)
    }
    
    
}

