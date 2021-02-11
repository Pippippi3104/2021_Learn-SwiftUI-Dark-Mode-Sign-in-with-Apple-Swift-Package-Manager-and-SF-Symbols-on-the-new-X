//
//  CreateToDoViewController.swift
//  ToDo List
//
//  Created by Satoshi Shimamura Second on 2021/02/12.
//

import UIKit

class CreateToDoViewController: UIViewController {
    
    // MARK: View Init
    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var nameTextField: UITextField!
    var toDoTableVC: ToDoTableViewController? = nil
    
    // MARK: loading View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: Buttom Actions
    @IBAction func addTapped(_ sender: Any) {
        let newToDo = ToDo()
        if let name = nameTextField.text {
            newToDo.name = name
            newToDo.important = importantSwitch.isOn
            
            // add new item to ToDo list at todoTableVC
            toDoTableVC?.toDos.append(newToDo)
            toDoTableVC?.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
    }
}
