//
//  LoginFieldsView.swift
//  MeineRezepte
//
//  Created by Lutz Brückner on 01.07.24.
//

import SwiftUI

// MARK: - Subviews

struct LoginFieldsView: View {
    @Binding var username: String
    @Binding var password: String
    var usernameError: String?
    var passwordError: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Benutzername-Feld und Fehlermeldung
            if let usernameError = usernameError {
                Text(usernameError)
                    .foregroundColor(.red)
                    .padding(5)
                    .background(Color.white)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.red, lineWidth: 1))
                    .padding(.bottom, -10)
                    .font(.caption2)
            }
            TextField("Benutzername", text: $username)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding(.bottom, 10)
                .frame(maxWidth: 300)
            
            // Passwort-Feld und Fehlermeldung
            if let passwordError = passwordError {
                Text(passwordError)
                    .foregroundColor(.red)
                    .padding(5)
                    .background(Color.white)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.red, lineWidth: 1))
                    .padding(.bottom, -10)
                    .font(.caption2)
            }
            SecureField("Passwort", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding(.bottom, 10)
                .frame(maxWidth: 300)
        }
    }
}
