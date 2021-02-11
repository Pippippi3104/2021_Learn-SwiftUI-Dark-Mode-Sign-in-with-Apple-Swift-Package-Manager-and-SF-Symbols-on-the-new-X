//
//  CodeTermTableViewController.swift
//  Code Dictionary
//
//  Created by Satoshi Shimamura Second on 2021/02/11.
//

import UIKit

class CodeTermTableViewController: UITableViewController {
    
    // Term class Array
    var terms: [Term] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Term definition
        let term1 = Term()
        term1.name = "Boolean"
        term1.definition = "A true or false situation."
        term1.isType = true
        terms.append(term1)
        
        let term2 = Term()
        term2.name = "Double"
        term2.definition = "A number with decimals."
        term2.isType = true
        terms.append(term2)
        
        let term3 = Term()
        term3.name = "If Statement"
        term3.definition = "Code that allows us to go one way or another."
        term3.isType = false
        terms.append(term3)
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
        if terms[indexPath.row].isType {
            cell.textLabel?.text = terms[indexPath.row].name + "- Type"
        } else {
            cell.textLabel?.text = terms[indexPath.row].name
        }

        return cell
    }
    
    // MARK: Did selected row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTerm: Term = terms[indexPath.row]
        performSegue(withIdentifier: "goToDefinition", sender: selectedTerm)
    }
    
    //MARK: Prepare CodeViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let codeVC = segue.destination as? CodeViewController {
            if let selectedTerm = sender as? Term {
                // term = CodeViewController's term
                codeVC.term = selectedTerm
            }
        }
    }
}
