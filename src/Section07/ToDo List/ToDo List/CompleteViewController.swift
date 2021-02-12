//
//  CompleteViewController.swift
//  ToDo List
//
//  Created by Satoshi Shimamura Second on 2021/02/12.
//

import UIKit

class CompleteViewController: UIViewController {
    
    // MARK: Init Components
    @IBOutlet weak var toDoLabel: UILabel!
    var toDo: ToDoItem? = nil
    
    // MARK: loading View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get todo item
        if toDo != nil {
            if toDo!.important {
                if let name = toDo?.name {
                    toDoLabel.text = "!" + name
                }
            } else {
                toDoLabel.text = toDo!.name
            }
        }
        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions
    @IBAction func completeTapped(_ sender: Any) {
        // connecting Coredata
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if toDo != nil {
                // delete item
                context.delete(toDo!)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
            }
        }
        
//        if let toDos = toDoTableVC?.toDos {
//            var index: Int = 0
//            for x in toDos {
//                if x.name == toDo.name {
//                    // delete item
//                    toDoTableVC?.toDos.remove(at: index)
//                    toDoTableVC?.tableView.reloadData()
//                    navigationController?.popViewController(animated: true)
//                    return
//                }
//                index += 1
//            }
//        }
    }
}
