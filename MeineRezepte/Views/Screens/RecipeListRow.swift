//
//  RecipeListRow.swift
//  MeineRezepte
//
//  Created by Lutz und Nadia on 01.07.24.
//

import SwiftUI

struct RecipeListRow: View {
@Binding var recipe: Recipe
var isFavorite: Bool
@State private var showMore = false
    

    var body: some View {
        HStack {
            Image(recipe.foodImage.rawValue)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(8)
                .overlay(
                    isFavorite ? Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        .position(x: 15, y: 15) : nil
                    
                )
            VStack(alignment: .leading) {
                Text(recipe.title)
                    .font(.headline)
                Group {
                    if showMore || recipe.description.count <= 60 {    // Zeichenanzahl bis zum Anzeigen des Buttons 60 Zeichen
                        Text(recipe.description)
                            .font(.subheadline)
                        if recipe.description.count > 60 {
                            Button(action: { self.showMore.toggle() }) {
                                Text(showMore ? "Weniger anzeigen" : "Mehr anzeigen")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                            }.buttonStyle(PlainButtonStyle())   // sorgt dafür das der Button unabhängig der restlichen Navigation arbeitet
                        }
                    } else {
                        Text("\(recipe.description.prefix(60))...") // nach 60 Zeichen wird ein Prefix mit 3 Punkten angezeigt
                            .font(.subheadline)
                        Button(action: { self.showMore.toggle() }) {
                            Text("Mehr anzeigen")
                                .font(.caption)
                                .foregroundColor(.blue)
                        }.buttonStyle(PlainButtonStyle())      // sorgt dafür das der Button unabhängig der restlichen Navigation arbeitet
                    }
                }
                Text("Erstellt am \(recipe.date.string)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}
