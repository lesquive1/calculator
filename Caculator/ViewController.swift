//
//  ViewController.swift
//  Caculator
//
//  Created by Luis Esquivel on 2017-01-17.
//  Student ID 300869199
//  Copyright © 2017 luis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var previousValue = String() // used to storage values on opeations which use more than one operator
    var currentOperator = String()
    var flagNewOperation = false // this flag allows to execute multiple operations without press "=" button

    @IBOutlet weak var displayLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This function evaluate each digit in order show it on display
    @IBAction func numberPressed(_ sender: UIButton) {
        if (displayLabel.text == "0" || flagNewOperation)
        {
            displayLabel.text = sender.currentTitle
            flagNewOperation = false
        } else {
            displayLabel.text = "\(displayLabel.text!)\(sender.currentTitle!)"
        }
    }
    
    // this function controls the use of dot sign; it does not allow to use dot sign more than once.
    @IBAction func dotPressed(_ sender: UIButton) {
        if !(displayLabel.text?.contains("."))! {
            displayLabel.text = "\(displayLabel.text!)\(sender.currentTitle!)"
        }
    }
    
    // here the operations are separeted in order to work according to its porpouse
    @IBAction func operatorPressed(_ sender: UIButton) {
        
        flagNewOperation = true

        if currentOperator != "" {
    
            switch currentOperator {
            case "+":
                displayLabel.text = "\(Float(previousValue)! + Float(displayLabel.text!)!)"
            case "-":
                displayLabel.text = "\(Float(previousValue)! - Float(displayLabel.text!)!)"
            case "X":
                displayLabel.text = "\(Float(previousValue)! * Float(displayLabel.text!)!)"
            case "/":
                displayLabel.text = "\(Float(previousValue)! / Float(displayLabel.text!)!)"
            default:
                displayLabel.text = displayLabel.text
            }
            
        }

        currentOperator = sender.currentTitle!
        previousValue = displayLabel.text!
    
    }
    
    @IBAction func percentButton(_ sender: UIButton) {
        displayLabel.text = "\(Float(displayLabel.text!)! / 100)"
    }
    
    
    // Clear display
    @IBAction func clearButton(_ sender: UIButton) {
        displayLabel.text = "0"
        previousValue = ""
        currentOperator = ""
    }
    


}

