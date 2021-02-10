//
//  ViewController.swift
//  My First App
//
//  Created by Satoshi Shimamura Second on 2021/02/10.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: label
    @IBOutlet weak var middleLabel: UILabel!
    // init value
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: button
    @IBAction func buttonTapped(_ sender: Any) {
        // count
        count += 1
        if count >= 10 {
            // background color
            view.backgroundColor = .purple
        }
        
        // Label
        middleLabel.text = String(count)
    }
}

