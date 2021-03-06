//
//  CalculatorController.swift
//  Calculator
//
//  Created by Mahmut MERCAN on 20.02.2021.
//

import UIKit

class CalculatorController: UIViewController {
    var numberOnScreen: Float = 0
    var previousNumber: Float = 0
    var total: Float = 0
    var operation = 0
    var performingMath = false
    

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            resultLabel.text = String(sender.tag-1)
            numberOnScreen = Float(resultLabel.text!)!
            performingMath = false
        } else if sender.tag == 17 {
            resultLabel.text = resultLabel.text! + "."
        } else {
            resultLabel.text = resultLabel.text! + String(sender.tag-1)
            numberOnScreen = Float(resultLabel.text!)!
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        previousNumber = 0
        numberOnScreen = 0
        total = 0
        resultLabel.text = ""
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var currentResult: Float = 0
        if previousNumber == 0 {
            previousNumber = numberOnScreen
            numberOnScreen = 0
            if sender.tag == 14 {
                currentResult = -1 * currentResult
            }
            if sender.tag == 13 {
                numberOnScreen = 1
            }
            if sender.tag == 12 {
                numberOnScreen = 1
            }
        }
        var value1 = previousNumber
        let value2 = numberOnScreen

        if resultLabel.text != "" && sender.tag != 11 && sender.tag != 16 {
            previousNumber = Float(resultLabel.text!)!
            if sender.tag == 15 {
                currentResult = optPlus(value1: value1, value2: value2)
                total = Float(currentResult)
                resultLabel.text = String(total)
                previousNumber = currentResult
                numberOnScreen = 0
            }
            
            else if sender.tag == 14 {
                currentResult = optMinus(value1: value1, value2: value2)
                total = Float(currentResult)
                resultLabel.text = String(total)
                previousNumber = currentResult
                numberOnScreen = 0
            }
            
            else if sender.tag == 13 {
                currentResult = optMultiply(value1: value1, value2: value2)
                total = Float(currentResult)
                resultLabel.text = String(total)
                previousNumber = currentResult
                numberOnScreen = 1
            }
            
            else if sender.tag == 12 {
                currentResult = optDivide(value1: value1, value2: value2)
                total = Float(currentResult)
                print(total)
                resultLabel.text = String(total)
            }
            
            else if sender.tag == 17 {
                value1 = previousNumber
                currentResult = optPercent(value1: value1)
                total = Float(currentResult)
                resultLabel.text = String(total)
                numberOnScreen = 0
                previousNumber = total
            }
            
            else if sender.tag == 18 {
                value1 = previousNumber
                currentResult = optPlusOrMinus(value1: value1)
                total = Float(currentResult)
                resultLabel.text = String(total)
                numberOnScreen = 0
                previousNumber = total
            }
            
            else if sender.tag == 19 {
                value1 = previousNumber
                currentResult = optSquared(value1: value1)
                total = Float(currentResult)
                resultLabel.text = String(total)
                numberOnScreen = 0
                previousNumber = total
            }
            
            else if sender.tag == 20 {
                value1 = previousNumber
                currentResult = optSinus(value1: value1)
                total = Float(currentResult)
                resultLabel.text = String(total)
                numberOnScreen = 0
                previousNumber = total
            }
            
            else if sender.tag == 21 {
                value1 = previousNumber
                currentResult = optCosinus(value1: value1)
                total = Float(currentResult)
                resultLabel.text = String(total)
                numberOnScreen = 0
                previousNumber = total
            }
            
            else if sender.tag == 22 {
                value1 = previousNumber
                currentResult = optTanjant(value1: value1)
                total = Float(currentResult)
                resultLabel.text = String(total)
                numberOnScreen = 0
                previousNumber = total
            }
            
            else if sender.tag == 23 {
                value1 = previousNumber
                currentResult = optSquareRoot(value1: value1)
                total = Float(currentResult)
                resultLabel.text = String(total)
                numberOnScreen = 0
                previousNumber = total
            }
            
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 16 {
            if operation == 12 { //Divide
                currentResult = optDivide(value1: value1, value2: value2)
                total = Float(currentResult)
                resultLabel.text = String(total)
            } else if operation == 13 { //Multiply
                currentResult = optMultiply(value1: value1, value2: value2)
                total = Float(currentResult)
                resultLabel.text = String(total)
            } else if operation == 14 { //Minus
                currentResult = optMinus(value1: value1, value2: value2)
                total = Float(currentResult)
                resultLabel.text = String(total)
            } else if operation == 15 { //Plus
                currentResult = optPlus(value1: value1, value2: value2)
                total = Float(currentResult)
                resultLabel.text = String(total)
            }
        }
    }
}

//Mark: Operator Funcs
extension CalculatorController {
    func optDivide(value1: Float, value2: Float) -> Float {
        return value1 / value2
    }

    func optPlus(value1: Float, value2: Float) -> Float {
        return value1 + value2
    }

    func optMinus(value1: Float, value2: Float) -> Float {
        return value1 - value2
    }

    func optMultiply(value1: Float, value2: Float) -> Float {
        return value1 * value2
    }
    
    func optPercent(value1: Float) -> Float {
        return value1 / 100
    }
    
    func optPlusOrMinus(value1: Float) -> Float {
        return value1 * -1
    }
    
    func optSinus(value1: Float) -> Float {
        return sin(value1 * Float(M_PI) / 180)
    }
    
    func optCosinus(value1: Float) -> Float {
        return cos(value1 * Float(M_PI) / 180)
    }
    
    func optTanjant(value1: Float) -> Float {
        return tan(value1 * Float(M_PI) / 180)
    }
    func optSquared(value1: Float) -> Float {
        return value1 * value1
    }
    
    func optSquareRoot(value1: Float) -> Float {
        let x = previousNumber
        let value1 = x.squareRoot()
        return value1
    }
}


//print("value1: \(value1)")
//print("value2: \(value2)")
//print("current: \(currentResult)")
