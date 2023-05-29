//
//  SharedDataModel.swift
//  eCommerce
//
//  Created by Diki Dwi Diro on 09/10/22.
//

import SwiftUI

//enum Shipping: String, CaseIterable, Identifiable{
//    case SiCepat = "SiCepat"
//    case JNE = "JNE"
//    case JnT = "J&T"
//    case Anteraja = "Anteraja"
//    case Tiki = "Tiki"
//
//    var id: String{self.rawValue}
//}

class SharedDataModel: ObservableObject {
    
    @Published var detailProduct: Product?
    @Published var showDetailProduct: Bool = false
    @Published var show3DModelProduct: Bool = false
    @Published var discPrice: Int = 50
    @Published var discCode: String = "BLACKFRIDAY"
    @Published var discText: String = ""
 
    @Published var likedProducts: [Product] = []
    
    //Chart products
    @Published var cartProducts: [Product] = []
    
    //Calculating total price of products
//    func getDiscPrice()-> String {
//        discPrice =
//
//        cartProducts.forEach { product in
//            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
//
//            let quantities = product.quantity
//            if (quantities == 1) {
//
//            }
//            let totalPrice = price.integerValue * quantities
//
//            total += totalPrice
//        }
//        return "$\(discPrice)"
//    }
    
//    func getSubtotalPrice()-> String {
//        var total: Int = 0
//        
//        cartProducts.forEach { product in
//            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
//            
//            let quantities = product.quantity
//            let totalPrice = price.integerValue * quantities
//            
//            total += totalPrice
//        }
//        return "$\(total)"
//    }
//    
//    func getTotalPrice()-> String {
//        var total: Int = 0
//        var shippingPrice: Int = 0
//
//        if selectedShipper == .SiCepat {
//            shippingPrice = 5
//        } else if selectedShipper == .JNE {
//            shippingPrice = 3
//        } else if selectedShipper == .JnT {
//            shippingPrice = 4
//        } else if selectedShipper == .Anteraja {
//            shippingPrice = 3
//        } else if selectedShipper == .Tiki {
//            shippingPrice = 2
//        }
        
//        cartProducts.forEach { product in
//            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
//
//            let quantities = product.quantity
//            let totalPrice = price.integerValue * quantities
//
//            total += totalPrice
//        }
//
//        if total > 0 && discText == discCode || discText == "blackfriday" {
//            return "$\(total + shippingPrice - discPrice)"
//        } else if total == 0{
//            return "$\(total)"
//        } else {
//            return "$\(total + shippingPrice)"
//        }
//    }
//
//    func getShippingPrice()-> String{
//        var price: Int = 0
//        if selectedShipper == .SiCepat {
//            price = 5
//            return "$\(price)"
//        } else if selectedShipper == .JNE {
//            price = 3
//            return "$\(price)"
//        } else if selectedShipper == .JnT {
//            price = 4
//            return "$\(price)"
//        } else if selectedShipper == .Anteraja {
//            price = 3
//            return "$\(price)"
//        } else if selectedShipper == .Tiki {
//            price = 2
//            return "$\(price)"
//        }
//        return "$\(price)"
//    }
}
