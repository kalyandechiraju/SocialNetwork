//
//  SignupViewController.swift
//  SocialNetwork
//
//  Created by Kalyan Dechiraju on 14/04/17.
//  Copyright © 2017 Codelight Studios. All rights reserved.
//

import UIKit
import FBSDKLoginKit
//import SwiftKeychainWrapper
import FirebaseAuth

class SignupViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(FIRAuth.auth()?.currentUser?.displayName ?? "Not Logged in")
    }
    
    @IBAction func facebookLoginPressed(_ sender: UIButton) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print(error.debugDescription)
            } else if result?.isCancelled == true {
                print("User cancelled login")
            } else {
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Logged in as \(FIRAuth.auth()?.currentUser?.displayName)")
                        self.navigateToUserFeed()
                    }
                })
            }
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
            if let password = passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
                if email != "" && password != "" {
                    FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
                        if error != nil {
                            print("Login Failed")
                        } else {
                            print("Logged in successfully")
                            self.navigateToUserFeed()
                        }
                    }
                } else {
                    print("Enter email and password")
                }
            }
        }
    }
    
    @IBAction func signupButtonPressed(_ sender: UIButton) {
        if let email = emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
            if let password = passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
                if email != "" && password != "" {
                    FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
                        if error != nil {
                            print("Signup Failed")
                        } else {
                            print("Signed up successfully")
                            self.navigateToUserFeed()
                        }
                    }
                } else {
                    print("Enter email and password")
                }
            }
        }
    }
    
    func navigateToUserFeed() {
        
    }
}

