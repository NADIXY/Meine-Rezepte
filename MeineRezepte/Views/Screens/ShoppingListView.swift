//
//  ShoppingListView.swift
//  MeineRezepte
//
//  Created by Lutz und Nadia on 01.07.24.
//


import SwiftUI

struct ShoppingListView: View {
    @Binding var shoppingList: [String]
    @Binding var recipes: [Recipe]
    @Binding var isPresented: Bool
    @State private var sortByAlphabeticalOrder: Bool = false
    
    var sortedShoppingList: [String] {
        return shoppingList.sorted()
    }
    
    var body: some View {
        VStack {
            if shoppingList.isEmpty {
                Text("Deine Einkaufsliste ist noch leer")
                    .font(.headline)
                    .padding()
                
                Image(systemName: "cart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding()
            } else {
                List {
                    ForEach(sortByAlphabeticalOrder ? shoppingList.sorted(by: <) : shoppingList.sorted(by: >), id: \.self) { item in
                        Text(item)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(PlainListStyle())
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {        // beim klick auf den pfeil nach unten wird die Liste alphabetisch geordnet A-Z
                Button {                                            // beim klick auf den pfeil nach oben wird die Reihenfolge gedreht von Z-A
                    sortByAlphabeticalOrder.toggle()
                } label: {
                    Image(systemName: sortByAlphabeticalOrder ? "arrow.up" : "arrow.down")
                }
            }
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {        // Funktion zum löschen der Items
    shoppingList.remove(atOffsets: offsets)
}

    
    struct ShoppingListView_Previews: PreviewProvider {
        static var previews: some View {
            ShoppingListView(shoppingList: .constant(["Milk", "Eggs", "Bread"]), recipes: .constant([]), isPresented: .constant(true))
        }
    }
}
