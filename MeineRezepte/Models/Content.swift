//
//  Content.swift
//  ProjektwocheOne
//
//  Created by Leonid Riedel on 15.02.24.
//

import Foundation

enum Content {
    static let correctUsername = "User1"
    static let correctPassword = "12345"
    
    static let defaultRecipes = [
        Recipe(
            title: "Apfelkuchen",
            description: "Ein leckerer Apfelkuchen für gemütliche Nachmittage.",
            ingredients: ["Äpfel", "Mehl", "Zucker", "Eier", "Zimt"],
            foodImage: .apfelkuchen,
            date: Date(timeIntervalSince1970: 100000)
        ),
        Recipe(
            title: "Spaghetti Bolognese",
            description: "Ein klassisches italienisches Nudelgericht mit würziger Fleischsoße.",
            ingredients: ["Spaghetti", "Hackfleisch", "Tomaten", "Zwiebeln", "Knoblauch"],
            foodImage: .spaghettiBolognese,
            date: Date(timeIntervalSince1970: 200000)
        ),
        Recipe(
            title: "Kartoffelsalat",
            description: "Ein frischer Kartoffelsalat mit leckerem Dressing.",
            ingredients: ["Kartoffeln", "Gurken", "Zwiebeln", "Essig", "Öl"],
            foodImage: .kartoffelsalat,
            date: Date(timeIntervalSince1970: 300000)
        ),
        Recipe(
            title: "Gemüsesuppe",
            description: "Eine gesunde und wärmende Gemüsesuppe für kalte Tage.",
            ingredients: ["Karotten", "Sellerie", "Kartoffeln", "Lauch", "Gemüsebrühe"],
            foodImage: .gemuesesuppe,
            date: Date(timeIntervalSince1970: 400000)
        ),
        Recipe(
            title: "Pfannkuchen",
            description: "Fluffige Pfannkuchen mit verschiedenen Toppings.",
            ingredients: ["Mehl", "Milch", "Eier", "Zucker", "Butter"],
            foodImage: .pfannkuchen,
            date: Date(timeIntervalSince1970: 500000)
        ),
        Recipe(
            title: "Lasagne",
            description: "Eine köstliche Lasagne mit vielen Schichten und würziger Soße.",
            ingredients: ["Lasagneplatten", "Hackfleisch", "Tomatensoße", "Mozzarella", "Parmesan"],
            foodImage: .lasagne,
            date: Date(timeIntervalSince1970: 600000)
        ),
        Recipe(
            title: "Hähnchensalat",
            description: "Ein leichter Salat mit gegrilltem Hähnchenbrustfilet.",
            ingredients: ["Hähnchenbrust", "Salat", "Tomaten", "Gurken", "Dressing"],
            foodImage: .haehnchensalat,
            date: Date(timeIntervalSince1970: 700000)
        ),
        Recipe(
            title: "Kaiserschmarrn",
            description: "Ein traditionelles österreichisches Gericht mit zerrissenem Pfannkuchen und Puderzucker.",
            ingredients: ["Eier", "Mehl", "Milch", "Rosinen", "Puderzucker"],
            foodImage: .kaiserschmarrn,
            date: Date(timeIntervalSince1970: 800000)
        ),
        Recipe(
            title: "Rindergulasch",
            description: "Ein deftiges Gulasch aus zartem Rindfleisch und würziger Soße.",
            ingredients: ["Rindfleisch", "Zwiebeln", "Paprika", "Tomatenmark", "Rinderbrühe"],
            foodImage: .rindergulasch,
            date: Date(timeIntervalSince1970: 900000)
        ),
        Recipe(
            title: "Schokoladenkuchen",
            description: "Ein saftiger Schokoladenkuchen, perfekt für Naschkatzen.",
            ingredients: ["Schokolade", "Mehl", "Zucker", "Eier", "Butter"],
            foodImage: .schokoladenkuchen,
            date: Date(timeIntervalSince1970: 1000000)
        )
    ]
}
