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
    var operandStack = [Double]()

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
    }

    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddleOfTypingANumber {
            operandStack.append(displayValue)
            enter()
        }

        // Binary operation needs 2 operands, it will execute next time
        switch storedOperator {
        case "÷": performBinaryOperation { $1 / $0 }
        case "×": performBinaryOperation { $0 * $1 }
        case "−": performBinaryOperation { $1 - $0 }
        case "+": performBinaryOperation { $0 + $1 }
        default: break
        }

        storedOperator = sender.currentTitle!

        // Unary operation should execute immediately
        switch storedOperator {
        case "AC":
            displayValue = 0
            operandStack.removeAll()
            enter()
            storedOperator = ""
        case "±": performUnaryOperation { -$0 }
        case "%": performUnaryOperation { $0 / 100.0 }
        default: break
        }

    }

    func performUnaryOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            operandStack.append(displayValue)
            enter()
            storedOperator = ""
        }
    }

    func performBinaryOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            operandStack.append(displayValue)
            enter()
        }
    }

    func enter() {
        userIsInTheMiddleOfTypingANumber = false

        print("operandStack = \(operandStack)")
    }

}
