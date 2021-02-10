//
//  ViewController.swift
//  My First App
//
//  Created by Satoshi Shimamura Second on 2021/02/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var middleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // button
    @IBAction func buttonTapped(_ sender: Any) {
        // background color
        view.backgroundColor = .purple
        
        // Label
        middleLabel.text = "I like to sing !"
    }
}

