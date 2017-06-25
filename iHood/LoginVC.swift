//
//  LoginVC.swift
//  OpalResidents
//
//  Created by Marc Aupont on 6/5/17.
//  Copyright © 2017 Digimark Technical Solutions. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseStorage

class LoginVC: UIViewController, UITextFieldDelegate {
    
    var loginMode = true
    
    lazy var backgroundImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor(red: 65/255, green: 66/255, blue: 84/255, alpha: 1)
        //imageView.image = UIImage(named: "opal-background")
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        return imageView
    }()
    
    let nameContainerView = ShadowView()
    let emailContainerView2 = ShadowView()
    let passwordContainerView2 = ShadowView()
    
    
    let emailContainerView = ShadowView()
    let passwordContainerView = ShadowView()
    
    
    
    let emailTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        textField.tintColor = .lightGray
        textField.clearButtonMode = .whileEditing
        textField.textColor = .lightGray
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let emailTextField2: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        textField.tintColor = .lightGray
        textField.clearButtonMode = .whileEditing
        textField.textColor = .lightGray
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let nameTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        textField.tintColor = .lightGray
        textField.clearButtonMode = .whileEditing
        textField.textColor = .lightGray
        textField.keyboardType = .namePhonePad
        textField.autocapitalizationType = .words
        return textField
    }()
    
    let passwordTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tintColor = .lightGray
        textField.textColor = .lightGray
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        textField.clearButtonMode = .whileEditing
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let passwordTextField2: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tintColor = .lightGray
        textField.textColor = .lightGray
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        textField.clearButtonMode = .whileEditing
        textField.isSecureTextEntry = true
        return textField
    }()
    
    
    let loginButton: UIButton = {
        
        let button = ShadowButton(type: .system)
        button.tintColor = .lightGray
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(performUserLogin), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()
    
    let createAccountButton: UIButton = {
        
        let button = ShadowButton(type: .system)
        button.tintColor = .lightGray
        button.setTitle("Create Account", for: .normal)
        button.addTarget(self, action: #selector(createUserAccount), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()
    
    let signUpInfoLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Don't have an account..."
        return label
    }()
    
    let signUpButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitle("Sign Up", for: .normal)
        button.addTarget(self, action: #selector(goToSignUpScreen), for: .touchUpInside)
        return button
    }()
    
    let loginInfoLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Already have an account..."
        return label
    }()
    
    let backToLoginScreenButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(goToLoginScreen), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        
        if loginMode {
            
            nameContainerView.center = CGPoint(x: nameContainerView.center.x + 400, y: nameContainerView.center.y)
            emailContainerView2.center = CGPoint(x: emailContainerView2.center.x + 400, y: emailContainerView2.center.y)
            passwordContainerView2.center = CGPoint(x: passwordContainerView2.center.x + 400, y: passwordContainerView2.center.y)
            createAccountButton.center = CGPoint(x: createAccountButton.center.x + 400, y: createAccountButton.center.y)
        
            loginInfoLabel.center = CGPoint(x: loginInfoLabel.center.x + 400, y: loginInfoLabel.center.y)
            backToLoginScreenButton.center = CGPoint(x: backToLoginScreenButton.center.x + 400, y: backToLoginScreenButton.center.y)
            
        } else {
            
            emailContainerView.center = CGPoint(x: emailContainerView.center.x - 400, y: emailContainerView.center.y)
            passwordContainerView.center = CGPoint(x: passwordContainerView.center.x - 400, y: passwordContainerView.center.y)
            loginButton.center = CGPoint(x: loginButton.center.x - 400, y: loginButton.center.y)
            signUpInfoLabel.center = CGPoint(x: signUpInfoLabel.center.x - 400, y: signUpInfoLabel.center.y)
            backToLoginScreenButton.center = CGPoint(x: backToLoginScreenButton.center.x - 400, y: backToLoginScreenButton.center.y)
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //loginButton.isEnabled = false

        setupViews()
    }
    
    
    func goToLoginScreen() {
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            
            self.emailContainerView.center = CGPoint(x: self.emailContainerView.center.x + 400, y: self.emailContainerView.center.y)
            
            self.passwordContainerView.center = CGPoint(x: self.passwordContainerView.center.x + 400, y: self.passwordContainerView.center.y)
            
            self.nameContainerView.center = CGPoint(x: self.nameContainerView.center.x + 400, y: self.nameContainerView.center.y)
            
            self.emailContainerView2.center = CGPoint(x: self.emailContainerView2.center.x + 400, y: self.emailContainerView2.center.y)
            
            self.passwordContainerView2.center = CGPoint(x: self.passwordContainerView2.center.x + 400, y: self.passwordContainerView2.center.y)
            
            self.createAccountButton.center = CGPoint(x: self.createAccountButton.center.x + 400, y: self.createAccountButton.center.y)
            
            self.loginButton.center = CGPoint(x: self.loginButton.center.x + 400, y: self.loginButton.center.y)
            
            self.signUpInfoLabel.center = CGPoint(x: self.signUpInfoLabel.center.x + 400, y: self.signUpInfoLabel.center.y)
            
            self.loginInfoLabel.center = CGPoint(x: self.loginInfoLabel.center.x + 400, y: self.loginInfoLabel.center.y)
            
            self.signUpButton.center = CGPoint(x: self.signUpButton.center.x + 400, y: self.signUpButton.center.y)
            
            self.backToLoginScreenButton.center = CGPoint(x: self.backToLoginScreenButton.center.x + 400, y: self.backToLoginScreenButton.center.y)
            
        }) { (done) in
            
            self.loginMode = true
        }
    }
    
    func goToSignUpScreen() {
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            
            self.emailContainerView.center = CGPoint(x: self.emailContainerView.center.x - 400, y: self.emailContainerView.center.y)
            
            self.passwordContainerView.center = CGPoint(x: self.passwordContainerView.center.x - 400, y: self.passwordContainerView.center.y)
            
            self.nameContainerView.center = CGPoint(x: self.nameContainerView.center.x - 400, y: self.nameContainerView.center.y)
            
            self.emailContainerView2.center = CGPoint(x: self.emailContainerView2.center.x - 400, y: self.emailContainerView2.center.y)
            
            self.passwordContainerView2.center = CGPoint(x: self.passwordContainerView2.center.x - 400, y: self.passwordContainerView2.center.y)
            
            self.createAccountButton.center = CGPoint(x: self.createAccountButton.center.x - 400, y: self.createAccountButton.center.y)
            
            self.loginButton.center = CGPoint(x: self.loginButton.center.x - 400, y: self.loginButton.center.y)
            
            self.signUpInfoLabel.center = CGPoint(x: self.signUpInfoLabel.center.x - 400, y: self.signUpInfoLabel.center.y)
            
            self.loginInfoLabel.center = CGPoint(x: self.loginInfoLabel.center.x - 400, y: self.loginInfoLabel.center.y)
            
            self.signUpButton.center = CGPoint(x: self.signUpButton.center.x - 400, y: self.signUpButton.center.y)
            
            self.backToLoginScreenButton.center = CGPoint(x: self.backToLoginScreenButton.center.x - 400, y: self.backToLoginScreenButton.center.y)
            
        }) { (done) in
            
            self.loginMode = false
        }
    }
    
    func createUserAccount() {
        
        guard let email = emailTextField2.text else { return }
        
        guard let password = passwordTextField2.text else { return }
        
        guard let name = nameTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                
                print(error.debugDescription)
            }
            
            let values = ["name": name, "email": email]
            
            self.registerUserIntoDatabase(uid: (user?.uid)!, values: values)
            
            self.dismiss(animated: true)
        }
        
        
    }
    
    func registerUserIntoDatabase(uid: String, values: [String: Any]) {
        
        let ref = Database.database().reference()
        
        ref.child("users").child(uid).updateChildValues(values, withCompletionBlock: { (err: Error?, dbRef: DatabaseReference) in
            
            if err != nil {
                
                print(err.debugDescription)
                
            } else {
                
                let user = User()
                user.setValuesForKeys(values)
                
                self.dismiss(animated: true)
            }
        })
        
    }
    
    func performUserLogin() {
        
        guard let email = emailTextField.text else { return }
        
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                
                print(error?.localizedDescription)
            }
            
            self.dismiss(animated: true)
        }
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    func setupViews() {
        
        nameContainerView.backgroundColor = .white
        emailContainerView.backgroundColor = .white
        emailContainerView2.backgroundColor = .white
        passwordContainerView.backgroundColor = .white
        passwordContainerView2.backgroundColor = .white
        
        view.addSubview(backgroundImageView)
        view.addSubview(nameContainerView)
        view.addSubview(emailContainerView)
        view.addSubview(emailContainerView2)
        view.addSubview(passwordContainerView)
        view.addSubview(passwordContainerView2)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(signUpInfoLabel)
        view.addSubview(signUpButton)
        view.addSubview(loginInfoLabel)
        view.addSubview(backToLoginScreenButton)
        
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        nameContainerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        nameContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        nameContainerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        nameContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        emailContainerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        emailContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        emailContainerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        emailContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        emailContainerView2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        emailContainerView2.topAnchor.constraint(equalTo: nameContainerView.bottomAnchor, constant: 16).isActive = true
        emailContainerView2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        emailContainerView2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordContainerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        passwordContainerView.topAnchor.constraint(equalTo: emailContainerView.bottomAnchor, constant: 16).isActive = true
        passwordContainerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        passwordContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordContainerView2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        passwordContainerView2.topAnchor.constraint(equalTo: emailContainerView2.bottomAnchor, constant: 16).isActive = true
        passwordContainerView2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        passwordContainerView2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordContainerView.bottomAnchor, constant: 32).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        createAccountButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        createAccountButton.topAnchor.constraint(equalTo: passwordContainerView2.bottomAnchor, constant: 32).isActive = true
        createAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        createAccountButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        signUpInfoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        signUpInfoLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        signUpInfoLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        signUpInfoLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
        signUpButton.leftAnchor.constraint(equalTo: signUpInfoLabel.rightAnchor).isActive = true
        signUpButton.topAnchor.constraint(equalTo: signUpInfoLabel.topAnchor).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
        loginInfoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        loginInfoLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        loginInfoLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        loginInfoLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
        backToLoginScreenButton.leftAnchor.constraint(equalTo: loginInfoLabel.rightAnchor).isActive = true
        backToLoginScreenButton.topAnchor.constraint(equalTo: loginInfoLabel.topAnchor).isActive = true
        backToLoginScreenButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backToLoginScreenButton.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
        nameContainerView.addSubview(nameTextField)
        emailContainerView.addSubview(emailTextField)
        emailContainerView2.addSubview(emailTextField2)
        passwordContainerView.addSubview(passwordTextField)
        passwordContainerView2.addSubview(passwordTextField2)
        
        nameTextField.leftAnchor.constraint(equalTo: nameContainerView.leftAnchor, constant: 8).isActive = true
        nameTextField.topAnchor.constraint(equalTo: nameContainerView.topAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: nameContainerView.rightAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameContainerView.bottomAnchor).isActive = true
        
        emailTextField.leftAnchor.constraint(equalTo: emailContainerView.leftAnchor, constant: 8).isActive = true
        emailTextField.topAnchor.constraint(equalTo: emailContainerView.topAnchor).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: emailContainerView.rightAnchor).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: emailContainerView.bottomAnchor).isActive = true
        
        emailTextField2.leftAnchor.constraint(equalTo: emailContainerView2.leftAnchor, constant: 8).isActive = true
        emailTextField2.topAnchor.constraint(equalTo: emailContainerView2.topAnchor).isActive = true
        emailTextField2.rightAnchor.constraint(equalTo: emailContainerView2.rightAnchor).isActive = true
        emailTextField2.bottomAnchor.constraint(equalTo: emailContainerView2.bottomAnchor).isActive = true
        
        passwordTextField.leftAnchor.constraint(equalTo: passwordContainerView.leftAnchor, constant: 8).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: passwordContainerView.topAnchor).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: passwordContainerView.rightAnchor).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: passwordContainerView.bottomAnchor).isActive = true
        
        passwordTextField2.leftAnchor.constraint(equalTo: passwordContainerView2.leftAnchor, constant: 8).isActive = true
        passwordTextField2.topAnchor.constraint(equalTo: passwordContainerView2.topAnchor).isActive = true
        passwordTextField2.rightAnchor.constraint(equalTo: passwordContainerView2.rightAnchor).isActive = true
        passwordTextField2.bottomAnchor.constraint(equalTo: passwordContainerView2.bottomAnchor).isActive = true
    }


}

