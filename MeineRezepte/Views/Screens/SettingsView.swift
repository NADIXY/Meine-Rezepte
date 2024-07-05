//
//  SettingsView.swift
//  MeineRezepte
//
//  Created by Lutz und Nadia on 04.07.24.
//

import SwiftUI

struct SettingsView: View {
    @Binding var showMainView: Bool
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        VStack {
            NavigationStack {
                Form {
                    Section(header: Text("Info")) {
                        Text("Projektwoche 1 - SwiftUI")
                        Link("syntax-institut.de", destination: URL(string: "https://www.syntax-institut.de")!)
                        Text("© Syntax-Institut, 2024")
                    }
                    Section(header: Text("Dark Mode")) {     // Umschalter Dark/Light hierv wird der Zustand von isDarkMode festgelegt
                        Toggle(isOn: $isDarkMode) {
                            Text("Dark Mode")
                        }
                    }
                    
                }
                
                .navigationTitle("Einstellungen")
            }
            
            Spacer()
            
            Button(action: {
                showMainView = false
            }) {
                Text("Logout")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.bottom, 30)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showMainView: .constant(true))
    }
}
