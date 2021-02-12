//
//  ViewProgressUpdateViewController.swift
//  Progress Journal
//
//  Created by Satoshi Shimamura Second on 2021/02/12.
//

import UIKit

class ViewProgressUpdateViewController: UIViewController {
    
    // init
    @IBOutlet weak var photoImageView: UIImageView!
    var progressUpdate: ProgressUpdate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = progressUpdate?.title
        if let imageData = progressUpdate?.image {
            photoImageView.image = UIImage(data: imageData)
        }
    }
}
