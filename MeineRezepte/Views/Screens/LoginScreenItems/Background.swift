//
//  Background.swift
//  MeineRezepte
//
//  Created by Nadia Marina Gaspar Baptista on 01.07.24.
//

import SwiftUI

struct Background: View {
    var body: some View {
        Image("apfelkuchen")
            .resizable()
            .scaledToFill()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .opacity(0.2)
        
    }
}

#Preview {
    Background()
}
