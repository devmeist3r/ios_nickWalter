//
//  ViewController.swift
//  Dark Fun
//
//  Created by Lucas Inocencio on 24/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switcherTheme: UISwitch!
    
    var DarkOn = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func DarkAction(_ sender: Any) {
        if switcherTheme.isOn == true {
            switcherTheme.isOn = true
            let DarkDefault = UserDefaults.standard.set(false, forKey: "DarkDefault")
        } else {
            switcherTheme.isOn = false
            let DarkDefault = UserDefaults.standard.set(false, forKey: "LightDefault")
        }
    }
    
}

