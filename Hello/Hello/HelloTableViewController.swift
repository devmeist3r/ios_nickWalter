//
//  HelloTableViewController.swift
//  Hello
//
//  Created by P21 Sistemas on 29/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import UIKit

class HelloTableViewController: UITableViewController {
    
    var hellos: [HelloItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    func loadData() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataToDoItem = try? context.fetch(HelloItem.fetchRequest()) as? [HelloItem] {
                hellos = coreDataToDoItem
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hellos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellHello", for: indexPath)
        
        let hello = hellos[indexPath.row]
        
        cell.textLabel?.text = hello.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hello = hellos[indexPath.row]
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            context.delete(hello)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            loadData()
        }
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newHello = HelloItem(context: context)
            newHello.name = "hello"
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
            loadData()
        }
    }
    
    
}
