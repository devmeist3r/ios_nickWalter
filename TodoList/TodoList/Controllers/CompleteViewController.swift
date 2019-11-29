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
    var toDo: ToDoItem? = nil
    var toDoTableVC: ToDoTableViewController? = nil
    
    // Outlets
    @IBOutlet weak var toDoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if toDo != nil {
            if toDo!.important {
                if let name = toDo?.name {
                    toDoLabel.text = "❗️" + name
                }
            } else {
                toDoLabel.text = toDo!.name
            }
        }
        
    }
    
    
    @IBAction func completeTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if toDo != nil {
                context.delete(toDo!)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
            }
        }
    }

}
