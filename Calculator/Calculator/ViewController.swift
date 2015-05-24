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
    
    var enteringNumber: Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if enteringNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            enteringNumber = true
        }
        
    }

}

