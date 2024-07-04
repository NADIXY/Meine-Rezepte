//
//  MainView.swift
//  MeineRezepte
//
//  Created by Nadia Marina Gaspar Baptista on 01.07.24.
//

import SwiftUI

struct MainView: View {
    @Binding var recipes: [Recipe]
    @Binding var favoritesCount: Int
    @Binding var shoppingList: [String]
    @Binding var showMainView: Bool
    @State private var isShoppingListPresented: Bool = false

    var body: some View {
        TabView {
            // Tab für die Liste der Rezepte
            NavigationStack {
                RecipeListView(recipes: $recipes, favoritesCount: $favoritesCount, shoppingList: $shoppingList)
                    .navigationTitle("Rezepte")
            }
            .tabItem {
                Label("Rezepte", systemImage: "fork.knife")
            }
            .badge(favoritesCount)
            
            // Tab für die Einkaufsliste
            NavigationStack {
                ShoppingListView(shoppingList: $shoppingList, recipes: $recipes, isPresented: $isShoppingListPresented)
                    .navigationTitle("Einkaufsliste")
            }
            .tabItem {
                Label("Einkaufsliste", systemImage: "cart")
            }
            .badge(shoppingList.count)
            
            // Tab für die Einstellungen
            SettingsView(showMainView: $showMainView)
                .tabItem {
                    Label("Einstellungen", systemImage: "gear")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(recipes: .constant([]), favoritesCount: .constant(0), shoppingList: .constant([]), showMainView: .constant(true))
    }
}
