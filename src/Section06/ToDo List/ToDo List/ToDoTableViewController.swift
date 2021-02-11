//
//  ToDoTableViewController.swift
//  ToDo List
//
//  Created by Satoshi Shimamura Second on 2021/02/11.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    // init
    var toDos: [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // init
        let toDo1 = ToDo()
        toDo1.name = "Buy Milk"
        toDo1.important = true
        
        let toDo2 = ToDo()
        toDo2.name = "Walk the Dog"
        toDo2.important = false
        
        toDos = [toDo1, toDo2]
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
        let toDo = toDos[indexPath.row]
        if toDo.important {
            cell.textLabel?.text = "!" + toDo.name
        } else {
            cell.textLabel?.text = toDo.name
        }
        return cell
    }
    
    // MARK: selected actions
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo: ToDo = toDos[indexPath.row]
        performSegue(withIdentifier: "goToComplete", sender: selectedToDo)
    }
    
    // MARK: prepare for add component
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if destination is CreateVC
        if let createVC = segue.destination as? CreateToDoViewController {
            createVC.toDoTableVC = self
        }
        // if destination is CompleteVC
        if let completeVC = segue.destination as? CompleteViewController {
            if let toDo = sender as? ToDo {
                completeVC.toDo = toDo
                completeVC.toDoTableVC = self
            }
        }
    }
}
