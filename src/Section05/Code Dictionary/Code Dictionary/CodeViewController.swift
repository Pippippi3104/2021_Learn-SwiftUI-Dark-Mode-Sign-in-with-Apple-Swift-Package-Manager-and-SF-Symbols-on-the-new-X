//
//  CodeViewController.swift
//  Code Dictionary
//
//  Created by Satoshi Shimamura Second on 2021/02/11.
//

import UIKit

class CodeViewController: UIViewController {
    
    // init
    @IBOutlet weak var definitionLabel: UILabel!
    var term: Term = Term()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // title
        title = term.name
        definitionLabel.text = term.definition
        
        if term.isType {
            definitionLabel.textColor = .purple
        }
    }
}
