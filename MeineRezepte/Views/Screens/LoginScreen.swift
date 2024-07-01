//
//  LoginScreen.swift
//  MeineRezepte
//
//  Created by Nadia Marina Gaspar Baptista on 01.07.24.
//

import SwiftUI

struct LoginScreen: View {
    var body: some View {
        ZStack {
            Background()

            VStack {
                Divider()
                TitleText()
                CircleImage()
                //TitleText()
                    .padding()
                    .padding()
                
                    .padding()
                    .padding()
                    .padding()
                    .padding()
                    .padding()
                
                    .padding()
                    .padding()
                    .padding()
                    .padding()
                
                
            }
        }
    }
}
        

#Preview {
    LoginScreen()
}

/*
 struct LoginScreen: View {
     
     @State private var username = ""
     @State var password = ""
     @State private var errorMessage = ""
     
     let correctUsername = "admin"
     let correctPassword = "password"
     
     
     var body: some View {
         ZStack {
             Background()
             //VStack {
                 Divider()
                 TitleText()
                     .padding()
                     .padding()
                 CircleImage()
                     .padding()
                     .padding()
                 
                     .padding()
                     .padding()
                     .padding()
                     .padding()
                     .padding()
                 
     
                     Text("Login")
                         .font(.largeTitle)
                         .foregroundColor(.white)
                     
                     TextField("Username", text: $username)
                         .textFieldStyle(RoundedBorderTextFieldStyle())
                         .padding(.horizontal, 16) // Abstand von 16dp links und rechts
                         .padding()
                     
                     SecureField("Password", text: $password)
                         .textFieldStyle(RoundedBorderTextFieldStyle())
                         .padding(.horizontal, 16) // Abstand von 16dp links und rechts
                         .padding()
                     
                     Button(action: {
                         if username == correctUsername && password == correctPassword {
                             // Login successful
                             errorMessage = ""
                             // Add code to navigate to the main part of the app
                         } else {
                             errorMessage = "Invalid username or password"
                         }
                     }) {
                         HStack {
                             Image(systemName: "knife")
                             Image(systemName: "fork")
                             Text("Einloggen")
                                 .padding()
                                 .background(Color.blue)
                                 .foregroundColor(.white)
                                 .cornerRadius(10)
                         }
                     }
                     
                     if !errorMessage.isEmpty {
                         Text(errorMessage)
                             .foregroundColor(.red)
                             .padding()
                     }
                 }
                 .padding()
             }
         }
     

 #Preview {
     LoginScreen()
 }
 */
