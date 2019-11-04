//
//  Firebase.swift
//  
//
//  Created by Mathias Larsen on 22/10/2019.
//

import Foundation
import Firebase
import FirebaseDatabase

class Firebase{
    var ref = Database.database().reference()
    
    init(){
    }

    func getDatabase()->DatabaseReference!{
        return ref
    }

    func uploadIngredient(ingredient: Ingredient){
        
        let tempDictionary = ["name": ingredient.name,
            "kacl": ingredient.kcal,
            "carbs": ingredient.carbs,
            "protien": ingredient.protien,
            "fat": ingredient.fat] as [String : Any]
        
        ref.child("Ingredients").setValue(tempDictionary, withCompletionBlock: {err, ref in 
            if let error = err{
                print("ingredient was not saved: \(error.localizedDescription)")
            }else{
                print("ingredient saved")
            }
        })
    }
}
