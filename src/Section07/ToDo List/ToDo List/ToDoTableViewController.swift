//
//  ToDoTableViewController.swift
//  ToDo List
//
//  Created by Satoshi Shimamura Second on 2021/02/11.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    // init
    var toDos: [ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // update ToDo List
    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataToDoItems = try? context.fetch(ToDoItem.fetchRequest()) as? [ToDoItem] {
                toDos = coreDataToDoItems
                
                // reload view
                tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }
    
    // MARK: cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        // Configure the cell...
        let toDo: ToDoItem = toDos[indexPath.row]
        if toDo.important {
            if let name: String = toDo.name {
                cell.textLabel?.text = "!" + name
            }
        } else {
            cell.textLabel?.text = toDo.name
        }
        return cell
    }
    
    // MARK: selected actions
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo: ToDoItem = toDos[indexPath.row]
        performSegue(withIdentifier: "goToComplete", sender: selectedToDo)
    }
    
    // MARK: prepare for add component
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if destination is CompleteVC
        if let completeVC = segue.destination as? CompleteViewController {
            if let toDo: ToDoItem = sender as? ToDoItem {
                completeVC.toDo = toDo
            }
        }
    }
}
