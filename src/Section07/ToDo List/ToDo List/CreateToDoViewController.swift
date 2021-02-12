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
    
    // MARK: loading View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: Buttom Actions (connecting Coredata)
    @IBAction func addTapped(_ sender: Any) {
        // connecting Coredata
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            // using Entity in Coredata
            let newToDo = ToDoItem(context: context)
            if let name = nameTextField.text {
                newToDo.name = name
                newToDo.important = importantSwitch.isOn
                
                // save new item to Coredata
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
