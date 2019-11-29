//
//  CompleteViewController.swift
//  TodoList
//
//  Created by Lucas Inocencio on 29/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    // Variables
    var toDo = ToDo()
    var toDoTableVC: ToDoTableViewController? = nil

    // Outlets
    @IBOutlet weak var toDoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if toDo.important {
            toDoLabel.text = "❗️" + toDo.name
        } else {
            toDoLabel.text = toDo.name
        }
        
    }
    

    @IBAction func completeTapped(_ sender: Any) {
        if let toDos = toDoTableVC?.toDos {
            var index = 0
            for x in toDos {
                if x.name == toDo.name {
                    toDoTableVC?.toDos.remove(at: index)
                    toDoTableVC?.tableView.reloadData()
                    navigationController?.popViewController(animated: true)
                    return
                }
                
                index += 1
            }
        }
    }
    

}
