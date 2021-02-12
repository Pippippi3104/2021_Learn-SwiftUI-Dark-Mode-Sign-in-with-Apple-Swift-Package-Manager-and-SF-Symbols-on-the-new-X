//
//  HelloTableViewController.swift
//  Hello
//
//  Created by Satoshi Shimamura Second on 2021/02/12.
//

import UIKit

class HelloTableViewController: UITableViewController {
    
    // init
    var hellos: [Hello] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    // MARK: load function
    func loadData() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let hellos = try? context.fetch(Hello.fetchRequest()) as? [Hello] {
                self.hellos = hellos
                tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hellos.count
    }
    
    // MARK: cell definition
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = hellos[indexPath.row].title
        
        return cell
    }
    
    // delete item
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hello = hellos[indexPath.row]
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            context.delete(hello)
            
            // save
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            loadData()
        }
    }
    
    // MARK: button actions
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let hello = Hello(context: context)
            hello.title = "Hello!"
            
            // save
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            loadData()
        }
    }
    
}
