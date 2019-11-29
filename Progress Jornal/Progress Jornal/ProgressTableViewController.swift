//
//  ProgressTableViewController.swift
//  Progress Jornal
//
//  Created by P21 Sistemas on 29/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import UIKit

class ProgressTableViewController: UITableViewController {
    
    var updates: [ProgressUpdate] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    func loadData() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let update = try? context.fetch(ProgressUpdate.fetchRequest()) as? [ProgressUpdate] {
                updates = update
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath)
        
        let progressUpdate = updates[indexPath.row]
        
        cell.textLabel?.text = progressUpdate.title

        return UITableViewCell()
    }
    

   

}
