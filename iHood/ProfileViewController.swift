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
    
    let nameLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Next", size: 24)
        label.textColor = .white
        label.text = "Name:"
        return label
    }()
    
    let nameTextField: UITextField = {
        
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.font = UIFont(name: "Avenir Next", size: 24)
        textfield.text = "Johnny Appleseed"
        textfield.backgroundColor = .white
        return textfield
    }()
    
    let updateProfileButton: UIButton = {
        
        let button = ShadowButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .lightGray
        button.setTitle("Update Profile", for: .normal)
        button.backgroundColor = .white
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 65/255, green: 66/255, blue: 84/255, alpha: 1)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))

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
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(updateProfileButton)
        
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 60).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        updateProfileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        updateProfileButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 40).isActive = true
        updateProfileButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        updateProfileButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
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
