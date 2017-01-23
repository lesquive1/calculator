//
//  ViewController.swift
//  Caculator
//
//  Created by Luis Esquivel on 2017-01-17.
//  Copyright © 2017 luis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var previousValue = String()
    var currentOperator = String()
    var flagNewOperation = false

    @IBOutlet weak var displayLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if (displayLabel.text == "0" || flagNewOperation)
        {
            displayLabel.text = sender.currentTitle
            flagNewOperation = false
        } else {
            displayLabel.text = "\(displayLabel.text!)\(sender.currentTitle!)"
        }
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if !(displayLabel.text?.contains("."))! {
            displayLabel.text = "\(displayLabel.text!)\(sender.currentTitle!)"
        }
    }
    

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
    
    // Clear display
    @IBAction func clearButton(_ sender: UIButton) {
        displayLabel.text = "0"
        previousValue = ""
        currentOperator = ""
    }
    


}

