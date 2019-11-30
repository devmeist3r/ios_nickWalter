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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCoreDataInfo()
    }
    
    func getCoreDataInfo() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataProgressUpdate = try? context.fetch(ProgressUpdate.fetchRequest()) as? [ProgressUpdate] {
                updates = coreDataProgressUpdate
                tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return updates.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath)
        
        let progressUpdate = updates[indexPath.row]
        
        if let imageData = progressUpdate.image {
            cell.imageView?.image = UIImage(data: imageData)
        }
        
        cell.textLabel?.text = progressUpdate.title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
   

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let progressUpdate = updates[indexPath.row]
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                context.delete(progressUpdate)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                getCoreDataInfo()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let progressUpdate = updates[indexPath.row]
        performSegue(withIdentifier: "showUpdate", sender: progressUpdate)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewProgressVC = segue.destination as? ViewProgressUpdateViewController {
            if let progressUpdate = sender as? ProgressUpdate {
                viewProgressVC.progressUpdate = progressUpdate
            }
        }
    }
    
}
