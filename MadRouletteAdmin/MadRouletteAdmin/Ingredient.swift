//
//  Ingredient.swift
//  MadRouletteAdmin
//
//  Created by Mathias Larsen on 24/10/2019.
//  Copyright © 2019 MadneZ. All rights reserved.
//

import Foundation

class Ingredient {
    
    var name: String
    var kcal: Float
    var carbs: Float
    var protien: Float
    var fat: Float
    
    init(name: String, kcal: Float, carbs: Float, protien: Float, fat: Float){
        self.name = name
        self.kcal = kcal
        self.carbs = carbs
        self.protien = protien
        self.fat = fat
    }
}
