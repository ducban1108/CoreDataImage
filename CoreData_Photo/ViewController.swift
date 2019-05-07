//
//  ViewController.swift
//  CoreData_Photo
//
//  Created by Just Kidding on 4/9/19.
//  Copyright © 2019 Just Kidding. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    var tableVC = TableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Dismiss the picker neu nguoi chon cancel
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        //dat imageView der hien thi hinh anh
        imageView.image = selectedImage
        // Dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    //MARK: Actions
    @IBAction func selectImageFromLibrary(_ sender: UITapGestureRecognizer) {
        //UIImagePickerController la mot view controller cho phep nguoi dung chon media tu thu vien anh cua ho
        let imagePickerController = UIImagePickerController()
        
        //chi cho phep chon anh , hong chup
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        if let content = imageView.image {
            let data = Entity(context: AppDelegate.context)
            data.image = content
            AppDelegate.saveContext()
            self.tableVC.fetchObject()
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

