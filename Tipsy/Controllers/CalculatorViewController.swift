//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var splitNumber = 2
    var billTotal = 0.0
    var resultTo2DecimalPlaces = ""

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let removePercentSign = String(buttonTitle.dropLast())
        tip = Double(removePercentSign)! / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
        splitNumber = Int(sender.value)
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        
        //If the text is not an empty String ""
        if bill != "" {
            
            //Turn the bill from a String e.g. "123.50" to an actual String with decimal places.
            //e.g. 125.50
            billTotal = Double(bill)!
            
            //Multiply the bill by the tip percentage and divide by the number of people to split the bill.
            let result = billTotal * (1 + tip) / Double(splitNumber)
            
            //Round the result to 2 decimal places and turn it into a String.
            resultTo2DecimalPlaces = String(format: "%.2f", result)
            self.performSegue(withIdentifier: "goResult", sender: self)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goResult"{
            let destination = segue.destination as! ResultsViewController
            destination.result = resultTo2DecimalPlaces
            destination.tip = Int(tip * 100)
            destination.split = splitNumber
        }
    }
}

