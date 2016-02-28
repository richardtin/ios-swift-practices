//
//  SimpleCalculatorViewController.swift
//  004.SimpleCalculator
//
//  Created by Richard Ting on 2/28/16.
//  Copyright © 2016 Richard Ting. All rights reserved.
//

import UIKit

class SimpleCalculatorViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!

    var userIsInTheMiddleOfTypingANumber = false
    var previousOpIsABinaryOperator = false
    var brain = SimpleCalculatorBrain()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.operatorLabel.text = ""
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    var storedOperator: String {
        get {
            return operatorLabel.text!
        }
        set {
            operatorLabel.text = "\(newValue)"
        }
    }

    var displayValue: Double {
        get {
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = "\(newValue)"
        }
    }

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!

        if digit == "." && displayLabel.text!.containsString(".") {
            return
        }

        if userIsInTheMiddleOfTypingANumber {
            displayLabel.text = displayLabel.text! + digit
        } else {
            if digit != "0" || storedOperator != "" {
                displayLabel.text = digit
                userIsInTheMiddleOfTypingANumber = true
            }
        }
        previousOpIsABinaryOperator = false
    }

    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }

        switch sender.currentTitle! {
        case "AC", "±", "%":
            if let result = brain.performOperation(sender.currentTitle!) {
                displayValue = result
            } else {
                displayValue = 0
            }
            if sender.currentTitle! == "AC" { storedOperator = "" }
        case "÷", "×", "−", "+":
            if storedOperator != "" && !previousOpIsABinaryOperator {
                if let result = brain.performOperation(storedOperator) {
                    displayValue = result
                }
            }
            storedOperator = sender.currentTitle!
            previousOpIsABinaryOperator = true
        case "=":
            if let result = brain.performOperation(storedOperator) {
                displayValue = result
            }
            storedOperator = ""
        default: break
        }

    }

    func enter() {
        userIsInTheMiddleOfTypingANumber = false

        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        }
    }

}
