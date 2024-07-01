//
//  Recipe.swift
//  ProjektwocheOne
//
//  Created by Leonid Riedel on 15.02.24.
//

import Foundation

struct Recipe: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let ingredients: [String]
    let foodImage: FoodImage
    let date: Date
    var isFavorite: Bool = false
}
