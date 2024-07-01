//
//  ImageCircle.swift
//  MeineRezepte
//
//  Created by Nadia Marina Gaspar Baptista on 01.07.24.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("apfelkuchen")
            .resizable()
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/.stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}

