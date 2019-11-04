//
//  FirstViewController.swift
//  MadRouletteAdmin
//
//  Created by Mathias Larsen on 21/10/2019.
//  Copyright © 2019 MadneZ. All rights reserved.
//

import UIKit
import Firebase

class FirstViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var kcalTextField: UITextField!
    
    @IBOutlet weak var carbsTextField: UITextField!
    
    
    @IBOutlet weak var protienTextField: UITextField!
    
    @IBOutlet weak var fatTextField: UITextField!
    
    //let firebase = Firebase()
    var ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func uploadButton(_ sender: Any) {
        let ingredient = Ingredient(name: nameTextField.text!, kcal: (kcalTextField.text! as NSString).floatValue, carbs: (carbsTextField.text! as NSString).floatValue, protien: (protienTextField.text! as NSString).floatValue, fat: (fatTextField.text! as NSString).floatValue)
        
        let tempDictionary = ["kcal": ingredient.kcal,
                              "carbs": ingredient.carbs,
                              "protien": ingredient.protien,
                              "fat": ingredient.fat] as [String : Any]
        
        ref.child("Ingredients").child(ingredient.name).child("kcal").observeSingleEvent(of: .value, with: {(snapshot) in
            let value = snapshot.value as? Int
            
            print(value)
            
            if value == nil {
                self.ref.child("Ingredients").child(ingredient.name).setValue(tempDictionary, withCompletionBlock: {err, ref in
                    if let error = err{
                        print("ingredient was not saved: \(error.localizedDescription)")
                    }else{
                        print("ingredient saved")
                        
                        let alert = UIAlertController(title: "Uploaded", message: "Ingrediensen er blevet uploaded.", preferredStyle: UIAlertController.Style.alert)
                        
                        // add an action (button)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        
                        // show the alert
                        self.present(alert, animated: true, completion: nil)
                    }
                })
            }else{
                let alert = UIAlertController(title: "Fejl", message: "Ingrediensen findes allerede.", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                
                print(value)
            }
            
        })
        self.nameTextField.placeholder = "name"
        self.carbsTextField.placeholder = "0"
        self.fatTextField.placeholder = "0"
        self.kcalTextField.placeholder = "0"
        self.protienTextField.placeholder = "0"
    }
    
}

