//
//  CreateProgressUpdateViewController.swift
//  Progress Journal
//
//  Created by Satoshi Shimamura Second on 2021/02/12.
//

import UIKit

class CreateProgressUpdateViewController: UIViewController {
    
    // MARK: Init
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    // MARK: loading view
    override func viewDidLoad() {
        super.viewDidLoad()

        // fixed button UI image
        addButton.layer.cornerRadius = addButton.frame.size.height / 2
    }
    
    // MARK: actions
    @IBAction func existingPhotoTapped(_ sender: Any) {
    }
    @IBAction func cameraTapped(_ sender: Any) {
    }
    @IBAction func addTapped(_ sender: Any) {
    }
}
