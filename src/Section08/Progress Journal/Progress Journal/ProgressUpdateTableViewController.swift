//
//  ProgressUpdateTableViewController.swift
//  Progress Journal
//
//  Created by Satoshi Shimamura Second on 2021/02/12.
//

import UIKit

class ProgressUpdateTableViewController: UITableViewController {
    
    // init
    var update: [ProgressUpdate] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // reload view
    override func viewWillAppear(_ animated: Bool) {
        getCoreDataInfo()
    }
    
    // MARK: get info
    func getCoreDataInfo() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataProgressUpdates = try? context.fetch(ProgressUpdate.fetchRequest()) as? [ProgressUpdate] {
                update = coreDataProgressUpdates
                tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return update.count
    }
    
    
    // MARK: cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath)
        
        // Configure the cell...
        let progressUpdate = update[indexPath.row]
        if let imageData = progressUpdate.image {
            cell.imageView?.image = UIImage(data: imageData)
        }
        cell.textLabel?.text = progressUpdate.title
        
        return cell
    }
    
    // MARK: swipe action (delete)
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let progressUpdate = update[indexPath.row]
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                context.delete(progressUpdate)
                
                // reload view
                getCoreDataInfo()
            }
        }
    }
    
    // MARK: selected action
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let progressUpdate = update[indexPath.row]
        performSegue(withIdentifier: "showUpdate", sender: progressUpdate)
    }
    
    // MARK: prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewProgressUpdateVC = segue.destination as? ViewProgressUpdateViewController {
            if let progressUpdate = sender as? ProgressUpdate {
                viewProgressUpdateVC.progressUpdate = progressUpdate
            }
        }
    }
}
