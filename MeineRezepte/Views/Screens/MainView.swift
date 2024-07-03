//
//  MainView.swift
//  MeineRezepte
//
//  Created by Lutz Brückner on 01.07.24.
//

import SwiftUI

struct MainView: View {
    @Binding var recipes: [Recipe]
    @Binding var favoritesCount: Int
    @Binding var shoppingList: [String]
    
    var body: some View {
        TabView {
            // Tab für die Liste der Rezepte
            NavigationView {
                RecipeListView(recipes: $recipes, favoritesCount: $favoritesCount, shoppingList: $shoppingList)
                    .navigationTitle("Rezepte")
            }
            .tabItem {
                Label("Rezepte", systemImage: "fork.knife")
            }
            .badge(favoritesCount)
            
            Text("Einkaufsliste")
                .tabItem {
                    Label("Einkaufsliste", systemImage: "cart")
                }
                .badge(shoppingList.count)
            
            Text("Einstellungen")
                .tabItem {
                    Label("Einstellungen", systemImage: "gear")
                }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(recipes: .constant(Content.defaultRecipes), favoritesCount: .constant(0), shoppingList: .constant([]))
    }
}
