//
//  FoodImage.swift
//  ProjektwocheOne
//
//  Created by Leonid Riedel on 16.02.24.
//

import Foundation

enum FoodImage: String, CaseIterable, Identifiable {
    case apfelkuchen = "apfelkuchen"
    case spaghettiBolognese = "spaghetti_bolognese"
    case kartoffelsalat = "kartoffelsalat"
    case gemuesesuppe = "gemuesesuppe"
    case pfannkuchen = "pfannkuchen"
    case lasagne = "lasagne"
    case haehnchensalat = "haehnchensalat"
    case kaiserschmarrn = "kaiserschmarrn"
    case rindergulasch = "rindergulasch"
    case schokoladenkuchen = "schokoladenkuchen"
    case pasteis_de_nata = "pasteis_de_nata"
    case sardinhasassadas = "sardinhas_assadas"
    case none
    
    var id: String { self.rawValue }
}
