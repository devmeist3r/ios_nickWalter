//
//  DetailViewController.swift
//  Code Dictionary
//
//  Created by Lucas Inocencio on 24/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var DetailLabel: UILabel!
    
    var term = Term()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = term.name
        DetailLabel.text = term.definition
        
        if term.isType {
            DetailLabel.textColor = .purple
        }
    }
    
    
    
    
}
