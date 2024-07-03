//
//  RezepteListe.swift
//  MeineRezepte
//
//  Created by Nadia Marina Gaspar Baptista on 01.07.24.
//

import SwiftUI

struct RecipeListItemView: View {
    @Binding var recipe: Recipe

    var body: some View {
        HStack {
            Image(recipe.foodImage.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)

            VStack(alignment: .leading) {
                Text(recipe.title)
                    .font(.headline)

                Text(recipe.description)
                    .font(.subheadline)
            }

            if recipe.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}
