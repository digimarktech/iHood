//
//  ProfileViewController.swift
//  iHood
//
//  Created by Marc Aupont on 6/24/17.
//  Copyright © 2017 Digimark Technical Solutions. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var profileImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "profile_image_white")
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(profileImageTapped)))
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 65/255, green: 66/255, blue: 84/255, alpha: 1)

        setupViews()
    }
    
    func profileImageTapped() {
        
        let imageActionSheet = UIAlertController(title: "Select One", message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { (action) in
            
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = false
            cameraPicker.sourceType = UIImagePickerControllerSourceType.camera
            cameraPicker.cameraCaptureMode = .photo
            cameraPicker.modalPresentationStyle = .fullScreen
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true)
        }
        
        let photoLibrary = UIAlertAction(title: "Photos", style: .default) { (action) in
            
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            self.present(imagePicker, animated: true)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        imageActionSheet.addAction(camera)
        imageActionSheet.addAction(photoLibrary)
        imageActionSheet.addAction(cancelButton)
        present(imageActionSheet, animated: true)
        
    }

    func setupViews() {
        
        view.addSubview(profileImageView)
        
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }

}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            
            profileImageView.image = editedImage
            
            dismiss(animated: true)
        }
        
        if let cameraPicture = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            profileImageView.image = cameraPicture
            dismiss(animated: true)
        }
        
        
    }
}
