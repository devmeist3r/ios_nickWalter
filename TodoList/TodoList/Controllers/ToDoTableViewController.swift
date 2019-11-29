//
//  ToDoTableViewController.swift
//  TodoList
//
//  Created by Lucas Inocencio on 28/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var toDos: [ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataToDoItem = try? context.fetch(ToDoItem.fetchRequest()) as? [ToDoItem] {
                toDos = coreDataToDoItem
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            if let name = toDo.name {
                cell.textLabel?.text = "❗️" + name
            }
        } else {
            cell.textLabel?.text = toDo.name
        }
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let seletectedToDo = toDos[indexPath.row]
        performSegue(withIdentifier: "goToComplete", sender: seletectedToDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let completeVC = segue.destination as? CompleteViewController {
            if let toDo = sender as? ToDoItem {
                completeVC.toDo = toDo
            }
        }
    }
    
    
}
