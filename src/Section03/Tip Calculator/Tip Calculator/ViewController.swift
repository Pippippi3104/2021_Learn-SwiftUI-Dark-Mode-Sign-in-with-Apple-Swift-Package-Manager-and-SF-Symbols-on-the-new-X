//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Satoshi Shimamura Second on 2021/02/10.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlet
    @IBOutlet weak var billTotalTextfield: UITextField!
    @IBOutlet weak var tipPercentageTextfield: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    
    // MARK: Load InitView
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Action
    @IBAction func calculateTapped(_ sender: Any) {
        print(billTotalTextfield.text!)
        print(tipPercentageTextfield.text!)
        
        let billTotal = Double(billTotalTextfield.text!)
        let tipPercentage = Double(tipPercentageTextfield.text!)
        
        let tip = billTotal! * (tipPercentage! / 100)
        tipLabel.text = "Tip: $\(Int(tip))"
    }
}

