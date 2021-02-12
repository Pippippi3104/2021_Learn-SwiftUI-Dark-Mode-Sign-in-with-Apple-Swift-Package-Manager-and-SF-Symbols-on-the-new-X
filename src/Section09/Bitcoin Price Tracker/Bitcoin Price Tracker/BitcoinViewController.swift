//
//  BitcoinViewController.swift
//  Bitcoin Price Tracker
//
//  Created by Satoshi Shimamura Second on 2021/02/12.
//

import UIKit

class BitcoinViewController: UIViewController {
    
    // MARK: init
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var eurLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: use API
        // Crypto Compare(https://min-api.cryptocompare.com/documentation)
        getPrice()
    }
    
    // MARK: get Json data
    func getPrice() {
        if let url = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR") {
            URLSession.shared.dataTask(with: url) {
                (data: Data?, response: URLResponse?, error: Error?) in
                if error == nil {
                    // convert into Json
                    if data != nil {
                        if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Double] {
                            
                            // async actions
                            DispatchQueue.main.async {
                                if let usdPrice = json["USD"] {
                                    self.usdLabel.text = "$\(usdPrice)"
                                }
                                if let eurPrice = json["EUR"] {
                                    self.eurLabel.text = "$\(eurPrice)"
                                }
                                if let jpyPrice = json["JPY"] {
                                    self.jpyLabel.text = "$\(jpyPrice)"
                                }
                            }
                        }
                    }
                } else {
                    print("We have error.")
                }
            }.resume()
        }
    }
    
    // MARK: button actions
    @IBAction func refreshTapped(_ sender: Any) {
        getPrice()
    }
}

