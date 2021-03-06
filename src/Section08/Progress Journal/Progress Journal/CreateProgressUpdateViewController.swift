//
//  CreateProgressUpdateViewController.swift
//  Progress Journal
//
//  Created by Satoshi Shimamura Second on 2021/02/12.
//

import UIKit

// add (UIImagePickerControllerDelegate, UINavigationControllerDelegate) using pickerController.delegate = self
class CreateProgressUpdateViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Init
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    // init pickerC
    var pickerController = UIImagePickerController()
    
    // MARK: loading view
    override func viewDidLoad() {
        super.viewDidLoad()

        // fixed button UI image
        addButton.layer.cornerRadius = addButton.frame.size.height / 2
        
        // run pickerC
        pickerController.delegate = self
    }
    
    // MARK: actions
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            // update imageView
            photoImageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    // MARK: button actions
    @IBAction func existingPhotoTapped(_ sender: Any) {
        // run (need Info.plist change before running)
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    @IBAction func cameraTapped(_ sender: Any) {
        // run (need Info.plist change before running)
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            // create new item
            let progressUpdateToSaved = ProgressUpdate(context: context)
            progressUpdateToSaved.title = titleTextField.text
            progressUpdateToSaved.image = photoImageView.image?.jpegData(compressionQuality: 1.0)
            
            // save item
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }
}
