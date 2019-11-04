//
//  CreateUserViewController.swift
//  MadRouletteAdmin
//
//  Created by Mathias Larsen on 26/10/2019.
//  Copyright © 2019 MadneZ. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class CreateUserViewController: UIViewController {

   
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "Login", sender: self)
        }else{
            print("No user")
        }
    }
    
    
    
    @IBAction func CreateUser(_ sender: Any) {
        Auth.auth().createUser(withEmail: (emailTextField.text ?? ""), password: (passwordTextField.text ?? "")) { (result, error) in
            if let _eror = error {
                //something bad happning
                print(_eror.localizedDescription )
                print("der er sket en fejl")
            }else{
                //user registered successfully
                
                Auth.auth().signIn(withEmail: (self.emailTextField.text ?? ""), password: (self.passwordTextField.text ?? "")) { (result, error) in
                    if let _eror = error{
                        print(_eror.localizedDescription)
                    }else{
                        if let _res = result{
                            print(_res)
                        }
                    }
                }
                self.performSegue(withIdentifier: "Login", sender: self)
            }
        }
    }
}
