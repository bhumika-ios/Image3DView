//
//  Product.swift
//  eCommerce
//
//  Created by Diki Dwi Diro on 29/09/22.
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
    var subtitle: String
    var description: String = ""
    var price: String
    var productImage = ""
    var quantity: Int = 1
    var modelName: String = ""
}


