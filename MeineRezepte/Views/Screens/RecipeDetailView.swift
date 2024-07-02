//
//  RecipeDetailView.swift
//  MeineRezepte
//
//  Created by Nadia Marina Gaspar Baptista on 02.07.24.
//

import SwiftUI

struct RecipeDetailView: View {
    @Binding var recipe: Recipe
    @Binding var favoritesCount: Int
    @Binding var shoppingList: [String]

    var body: some View {
        ZStack {
            Image(recipe.foodImage.rawValue)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.5)
            
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    
                    HStack {
                        Spacer()
                        
                        
                        
                            .padding()
                    }
                    
                    VStack(spacing: 20) {
                        Text(recipe.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 40)
                        
                        Image(recipe.foodImage.rawValue)
                            .resizable()
                            .frame(width: 100, height: 100)  // Adjusted size
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 10)
                        
                        Text(recipe.description)
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .frame(maxWidth: 300)  // Adjusted width
                        
                        Text("Zutaten")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        VStack(spacing: 10) {
                            ForEach(recipe.ingredients, id: \.self) { ingredient in
                                HStack {
                                    Text(ingredient)
                                        .foregroundColor(.black)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                    Spacer()
                                    Button(action: {
                                        toggleShoppingList(ingredient: ingredient)
                                    }) {
                                        Image(systemName: shoppingList.contains(ingredient) ? "minus.circle.fill" : "plus.circle")
                                            .foregroundColor(shoppingList.contains(ingredient) ? .red : .green)
                                            .imageScale(.large)
                                    }
                                    .padding()
                                }
                                .frame(maxWidth: 300)  // Adjusted width
                                .padding(.horizontal)
                            }
                        }
                        .padding(.bottom, 40)  // Added bottom padding
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: toggleFavorite) {
                        Image(systemName: recipe.isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(recipe.isFavorite ? .red : .white)
                            .imageScale(.large)
                    }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    

    private func toggleFavorite() {
        recipe.isFavorite.toggle()
        if recipe.isFavorite {
            favoritesCount += 1
        } else {
            favoritesCount -= 1
        }
    }

    private func toggleShoppingList(ingredient: String) {
        if let index = shoppingList.firstIndex(of: ingredient) {
            shoppingList.remove(at: index)
        } else {
            shoppingList.append(ingredient)
        }
    }

  
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(
            recipe: .constant(Recipe(
                title: "Apfelkuchen",
                description: "Ein leckerer Apfelkuchen.",
                ingredients: ["Äpfel", "Mehl", "Zucker", "Butter", "Eier"],
                foodImage: .apfelkuchen,
                date: Date()
            )),
            favoritesCount: .constant(0),
            shoppingList: .constant([])
        )
    }
}
