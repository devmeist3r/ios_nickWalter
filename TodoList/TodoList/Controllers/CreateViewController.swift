//
//  CreateViewController.swift
//  TodoList
//
//  Created by Lucas Inocencio on 29/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var toDoTableVC: ToDoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func handleAdd(_ sender: Any) {
        let newTodo = ToDo()
        
        if let name = nameTextField.text {
            newTodo.name = name
            newTodo.important = importantSwitch.isOn
            toDoTableVC?.toDos.append(newTodo)
            DispatchQueue.main.async {
                self.toDoTableVC?.tableView.reloadData()
            }
            navigationController?.popViewController(animated: true)
        }
    }
}
