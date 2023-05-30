//
//  Image3DViewApp.swift
//  Image3DView
//
//  Created by Bhumika Patel on 26/05/23.
//


import SwiftUI

//Product Types...
enum ProductType: String, CaseIterable{
    case Wearable = "Wearable"
    case Laptops = "Laptops"
    case Phones = "Phones"
    case Tablets = "Tablets"
}

//Product Model...
struct Product: Identifiable, Hashable {
    var id = UUID().uuidString
    var type: ProductType
    var title: String
    var productImage = ""
    var modelName: String = ""
}


