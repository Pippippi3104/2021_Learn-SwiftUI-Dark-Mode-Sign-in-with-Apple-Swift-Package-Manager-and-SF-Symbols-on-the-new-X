//
//  BitcoinViewController.swift
//  Bitcoin Price Tracker
//
//  Created by Satoshi Shimamura Second on 2021/02/12.
//

import UIKit

class BitcoinViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: use API
        // Crypto Compare(https://min-api.cryptocompare.com/documentation)
        if let url = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR") {
            URLSession.shared.dataTask(with: url) {
                (data: Data?, response: URLResponse?, error: Error?) in
                if error == nil {
                    // convert into Json
                    if data != nil {
                        if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Double] {
                            if let usdPrice = json["USD"] {
                                print(usdPrice)
                            }
                            if let eurPrice = json["EUR"] {
                                print(eurPrice)
                            }
                            if let jpyPrice = json["JPY"] {
                                print(jpyPrice)
                            }
                        }
                    }
                } else {
                    print("We have error.")
                }
            }.resume()
        }
    }
}

