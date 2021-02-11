//
//  CodeTermTableViewController.swift
//  Code Dictionary
//
//  Created by Satoshi Shimamura Second on 2021/02/11.
//

import UIKit

class CodeTermTableViewController: UITableViewController {
    
    var terms: [String] = ["Boolean", "Int", "Double", "String", "Array"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: How many rows ?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return terms.count
    }

    // MARK: What goes in each cell ?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        // Configure the cell...
        print(indexPath.row)
        cell.textLabel?.text = terms[indexPath.row]

        return cell
    }
    
    // MARK: Did selected row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTerm: String = terms[indexPath.row]
        performSegue(withIdentifier: "goToDefinition", sender: selectedTerm)
    }
    
    //MARK: Prepare CodeViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let codeVC = segue.destination as! CodeViewController
        let selectedTerm = sender as! String
        
        // term = CodeViewController's term
        codeVC.term = selectedTerm
    }
}
