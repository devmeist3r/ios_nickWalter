//
//  CodeTermTableViewController.swift
//  Code Dictionary
//
//  Created by Lucas Inocencio on 24/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import UIKit

class CodeTermTableViewController: UITableViewController {
    
    var terms: [Term] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // "Boolean", "Int", "Double", "String", "Array"
        let term1 = Term()
        term1.name = "Boolean"
        term1.definition = "A true or false situation"
        term1.isType = true
        terms.append(term1)
        
        let term2 = Term()
        term2.name = "Double"
        term2.definition = "A number with decimals"
        term2.isType = true
        terms.append(term2)
        
        let term3 = Term()
        term3.name = "Int"
        term3.definition = "A type thas is a whole number. Positive or negative."
        term3.isType = true
        terms.append(term3)
        
        let term4 = Term()
        term4.name = "If Statement"
        term4.definition = "Code that allows us to go one way or another."
        term4.isType = false
        terms.append(term4)
    }
    
    
    // How many row ?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return terms.count
    }
    
    // What goes in each cell?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if terms[indexPath.row].isType {
            cell.textLabel?.text = terms[indexPath.row].name + " - Type"
        } else {
            cell.textLabel?.text = terms[indexPath.row].name
        }
        
        
        return cell
    }
    
    // Navigation to other controller
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTerm = terms[indexPath.row]
        performSegue(withIdentifier: "goToDefinition", sender: selectedTerm)
    }
    
    // Passing Data do other controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let codeVC = segue.destination as? DetailViewController {
            if let selectedTerm = sender as? Term {
                codeVC.term = selectedTerm
            }
        }
    }
    
}
