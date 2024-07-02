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

//#Preview {
   // RecipeListItemView()
//}



/*
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

                 Text(recipe.creationDate.formatted())
                     .font(.caption)
             }

             if recipe.isFavorite {
                 Image(systemName: "heart.fill")
                     .foregroundColor(.red)
             }
         }
         .padding()
         .onTapGesture {
             //
         }
         .gesture(
             DragGesture()
                 .onEnded { gesture in
                     if gesture.translation.width < 0 {
                         recipe.isFavorite.toggle()
                     } else if gesture.translation.width > 0 {
                         recipes.removeAll(where: { $0.id == recipe.id })
                     }
                 }
         )
     }
 }

 //#Preview {
    // RecipeListItemView()
 //}
 */
