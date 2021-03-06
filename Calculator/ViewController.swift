//
//  ViewController.swift
//  Calculator
//
//  Created by Mahmut MERCAN on 8.02.2021.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen: Float = 0
    var previousNumber: Float = 0
    var performingMath = false
    var operation = 0
    var totalPoint: Float = 0
    var gercekSayi: Float = 0
    
    @IBOutlet weak var resultLabel: UILabel!
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
    
    @IBAction func basicOperationsTapped(_ sender: UIButton) {
        if resultLabel.text != "" && sender.tag != 11 && sender.tag != 16 {
            previousNumber = Float(resultLabel.text!)!
            if sender.tag == 12 { //Divide
                resultLabel.text = "\(previousNumber)"
            } else if sender.tag == 13 { //Multiply
                totalPoint = totalPoint * previousNumber
                resultLabel.text = "\(totalPoint)"
            } else if sender.tag == 14 { //Minus
                resultLabel.text = "\(previousNumber)"
            } else if sender.tag == 15 { //Plus
                totalPoint = totalPoint + previousNumber
                resultLabel.text = "\(totalPoint)"
            }
            operation = sender.tag
            performingMath = true
        } else if sender.tag == 16 {
            if operation == 12 { //Divide
                resultLabel.text = String(previousNumber / numberOnScreen)
            } else if operation == 13 { //Multiply
                resultLabel.text = String(previousNumber * numberOnScreen)
            } else if operation == 14 { //Minus
                resultLabel.text = String(previousNumber - numberOnScreen)
            } else if operation == 15 { //Plus
                resultLabel.text = String(totalPoint + numberOnScreen)
            }
            previousNumber = 0
            numberOnScreen = 0
            totalPoint = 0

        } else if sender.tag == 11 {
            clearText()
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton ) {
        clearText()
    }
    
    func clearText(){
        resultLabel.text = ""
        previousNumber = 0
        numberOnScreen = 0
        operation = 0
        totalPoint = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
}

