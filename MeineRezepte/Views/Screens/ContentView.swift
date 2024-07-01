//
//  ContentView.swift
//  MeineRezepte
//
//  Created by Leonid Riedel on 23.02.24.
//

import SwiftUI
struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showMainView: Bool = false
    @State private var usernameError: String? = nil
    @State private var passwordError: String? = nil
    private let correctUsername = Content.correctUsername
    private let correctPassword = Content.correctPassword
    var body: some View {
        ZStack {
            // Hintergrundbild
            Image("apfelkuchen")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
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
                LoginFieldsView(username: $username, password: $password, usernameError: usernameError, passwordError: passwordError)
                    .frame(maxWidth: 300)
                // Login-Button
                Button(action: handleLogin) {
                    Text("Einloggen")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200)
                        .background(Color.blue)
                        .cornerRadius(10)}
                .padding(.top, 20)}
            .padding()}
        .fullScreenCover(isPresented: $showMainView) {
            MainView()}}
    // MARK: - Methoden
    private func handleLogin() {
        // Fehler zurücksetzen
        usernameError = nil
        passwordError = nil
        // Benutzername validieren
        if username.isEmpty {
            usernameError = "Es muss ein Benutzername eingegeben werden."
        } else if username != correctUsername {
            usernameError = "Der Benutzername ist nicht korrekt."}
        // Passwort validieren
        if password.isEmpty {
            passwordError = "Es muss ein Passwort eingegeben werden."
        } else if password != correctPassword {
            passwordError = "Der Benutzername ist nicht korrekt."}
        // Prüfen, ob keine Fehler vorliegen und die Hauptansicht anzeigen
        if usernameError == nil && passwordError == nil {
            showMainView = true}}}
#Preview {
    ContentView()
}

