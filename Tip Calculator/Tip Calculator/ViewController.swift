//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Lucas Inocencio on 24/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Outlet
    
    @IBOutlet weak var billTotalTextField: UITextField!
    @IBOutlet weak var tipPercentageTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Action
    @IBAction func calculateTapped(_ sender: Any) {
        guard let billTotal = billTotalTextField.text, billTotal != "" else {
            print("Campo vazio b")
            return
        }
        
        guard let tipPercentage = tipPercentageTextField.text, tipPercentage != "" else {
            print("Campo vazio t")
            return
        }
        
        let billDouble = Double(billTotal)
        let tipDouble = Double(tipPercentage)
        
        let tip = billDouble!  * (tipDouble! / 100)
        
        tipLabel.text = "Tip: $\(Int(tip))"
    }
    
}

