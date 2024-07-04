//
//  AddRecipeView.swift
//  MeineRezepte
//
//  Created by Nadia Marina Gaspar Baptista on 04.07.24.
//

import SwiftUI

struct AddRecipeView: View {
    @Binding var recipes: [Recipe]
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var ingredients: [String] = []
    @State private var ingredientText: String = ""
    @State private var selectedImage: FoodImage? = nil
    @State private var showImagePicker = false
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // Angepasste Navigations Bar
                HStack {
                    Spacer()
                    Text("Neues Rezept")
                        .font(.headline)
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .imageScale(.large)
                            .padding(.trailing)
                    }
                }
                .padding(.top)
                
                // Bereich für Name und Beschreibung
                VStack(alignment: .leading, spacing: 5) {
                    Text("Name und Beschreibung des Rezeptes")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    TextField("Rezeptname", text: $title)
                        .padding()
                        .background(Color(.systemGray6))
                        .foregroundColor(.gray)
                        .cornerRadius(8)
                    
                    TextEditor(text: $description)
                        .frame(height: 100)
                        .padding()
                        .background(Color(.systemGray6))
                        .foregroundColor(.gray)
                        .cornerRadius(8)
                }
                
                // Bereich Image Picker
                VStack(alignment: .leading, spacing: 5) {
                    Text("Bild")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    Button(action: {
                        showImagePicker = true
                    }) {
                        HStack {
                            Text(selectedImage == nil ? "Bild auswählen" : selectedImage!.rawValue)
                                .foregroundColor(.blue)
                            
                            Spacer()
                            
                            if let selectedImage = selectedImage {
                                Image(selectedImage.rawValue)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "fork.knife")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .background(
                                        Circle()
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(width: 50, height: 50)
                                    )
                                    .foregroundColor(.blue)
                            }
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    }
                    .sheet(isPresented: $showImagePicker) {
                        NavigationStack {
                            ImagePicker(selectedImage: $selectedImage)
                                .navigationBarTitle("Bild auswählen", displayMode: .inline)
                                .navigationBarItems(leading: Button(action: {
                                    showImagePicker = false
                                }) {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.blue)
                                    Text("Zurück")
                                        .foregroundColor(.blue)
                                        
                                })
                        }
                    }
                }
                
                // Zutaten Bereich
                VStack(alignment: .leading, spacing: 5) {
                    Text("Zutaten")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    HStack {
                        TextField("Zutat hinzufügen", text: $ingredientText)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .overlay(
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        addIngredient()
                                    }) {
                                        Image(systemName: "plus")
                                            .foregroundColor(.gray)
                                            .imageScale(.large)
                                            .padding(.trailing)
                                    }
                                }
                            )
                    }
                    
                    
                    VStack(spacing: 5) {
                        ForEach(ingredients, id: \.self) { ingredient in
                            Text(ingredient)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.gray)
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                        }
                    }
                }
                
                // Save Button
                Button(action: {
                    saveRecipe()
                }) {
                    Text("Speichern")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .padding(.top)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Fehler"), message: Text("Bitte Namen eingeben"), dismissButton: .default(Text("OK")))
                }
                
                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
        }
    }

    private func addIngredient() {
        if !ingredientText.isEmpty {
            ingredients.append(ingredientText)
            ingredientText = ""
        }
    }

    private func saveRecipe() {
        if title.isEmpty {
            showAlert = true
        } else {
            let newRecipe = Recipe(
                title: title,
                description: description,
                ingredients: ingredients,
                foodImage: selectedImage ?? .apfelkuchen,
                date: Date()
            )
            recipes.append(newRecipe)
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ImagePicker: View {
    @Binding var selectedImage: FoodImage?

    var body: some View {
        List {
            ForEach(FoodImage.allCases, id: \.self) { image in
                Button(action: {
                    selectedImage = image
                }) {
                    HStack {
                        Image(image.rawValue)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    
                    }
                }
            }
        }
    }
}
