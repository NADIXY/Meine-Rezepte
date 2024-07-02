//
//  ContentView.swift
//  MeineRezepte
//
//  Created by Lutz und Nadia 01.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showMainView: Bool = false
    @State private var usernameError: String? = nil
    @State private var passwordError: String? = nil
    @State private var recipes: [Recipe] = Content.defaultRecipes
    @State private var favoritesCount: Int = 0
    @State private var shoppingList: [String] = []

    private let correctUsername = Content.correctUsername
    private let correctPassword = Content.correctPassword

    var body: some View {
        ZStack {
            // Hintergrundbild
            Image("apfelkuchen")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.5)

            VStack(spacing: 20) {
                // Titel und Bild
                Text("MeineRezepte")
                    .font(.largeTitle)
                    .foregroundColor(.black)

                Image("apfelkuchen")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 10)

                // Stack mit den Textfeldern und Fehlermeldungen
                VStack(spacing: 10) {
                    // Benutzername
                    if let usernameError = usernameError {
                        Text(usernameError)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .frame(maxWidth: 300, alignment: .leading)
                            .padding(.horizontal)
                    }
                    TextField("Benutzername", text: $username)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .frame(maxWidth: 300)
                    
                    // Passwort
                    if let passwordError = passwordError {
                        Text(passwordError)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .frame(maxWidth: 300, alignment: .leading)
                            .padding(.horizontal)
                    }
                    SecureField("Passwort", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .frame(maxWidth: 300)
                }

                // Login-Button
                Button(action: handleLogin) {
                    Label("Einloggen",systemImage: "fork.knife")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.top, 20)
            }
            .padding()
        }
        .fullScreenCover(isPresented: $showMainView) {
            MainView(recipes: $recipes, favoritesCount: $favoritesCount, shoppingList: $shoppingList)
        }
    }

    // MARK: - Methoden

    private func handleLogin() {
        // Fehler zurücksetzen
        usernameError = nil
        passwordError = nil

        // Benutzername validieren
        if username.isEmpty {
            usernameError = "Es muss ein Benutzername eingegeben werden."
        } else if username != correctUsername {
            usernameError = "Der Benutzername ist nicht korrekt."
        }

        // Passwort validieren
        if password.isEmpty {
            passwordError = "Es muss ein Passwort eingegeben werden."
        } else if password != correctPassword {
            passwordError = "Das Passwort ist nicht korrekt."
        }

        // Prüfen, ob keine Fehler vorliegen und die Hauptansicht anzeigen
        if usernameError == nil && passwordError == nil {
            showMainView = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
