//
//  TitleText.swift
//  MeineRezepte
//
//  Created by Nadia Marina Gaspar Baptista on 01.07.24.
//

import SwiftUI

struct TitleText: View {
    var body: some View {
        Text("Meine Rezepte")
            .font(.title)
            .foregroundColor(Color.black).bold().italic()
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        TitleText()
    }
}
