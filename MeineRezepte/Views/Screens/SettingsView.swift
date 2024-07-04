//
//  SettingsView.swift
//  MeineRezepte
//
//  Created by Nadia Marina Gaspar Baptista on 04.07.24.
//

import SwiftUI

struct SettingsView: View {
    @Binding var showMainView: Bool

    var body: some View {
        VStack {
            NavigationStack {
                Form {
                    Section(header: Text("Allgemeine Informationen")) {
                        Text("Dies ist eine Rezept-App, die Ihnen hilft, Ihre Lieblingsrezepte zu verwalten.")
                        Link("Besuchen Sie unsere Webseite", destination: URL(string: "https://example.com")!)
                        Text("© 2024 MeineRezepte")
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
