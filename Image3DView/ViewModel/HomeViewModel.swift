//
//  Image3DViewApp.swift
//  Image3DView
//
//  Created by Bhumika Patel on 26/05/23.
//


import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var productType: ProductType = .Wearable
    
    //Sample Products
    @Published var products: [Product] = [
    
        Product(type: .Wearable, title: "Apple Airpods Max", productImage: "airpodsMaxSilver", modelName: "Airpods_Max_Silver.usdz" ),
        Product(type: .Wearable, title: "Apple Airpods Pro", productImage: "airpodsPro", modelName: "Airpods_Pro.scn"),
        Product(type: .Wearable, title: "Apple Airpods Gen 2", productImage: "airpodsGen2", modelName: "Airpods_Gen2.scn"),
        Product(type: .Wearable, title: "Apple Watch", productImage: "AppleWatch7", modelName: "iWatch_7_Red.scn"),
        Product(type: .Phones, title: "iPhone 14 Pro", productImage: "iPhone14Pro", modelName: "iPhone_14Pro.scn"),
        Product(type: .Phones, title: "iPhone 13 Pro", productImage: "iPhone13Pro", modelName: "iPhone_13Pro.scn"),
        Product(type: .Phones, title: "iPhone 12 Pro", productImage: "iPhone12Pro", modelName: "iPhone_12Pro.scn"),
        Product(type: .Phones, title: "iPhone 13", productImage: "iPhone13", modelName: "iPhone_13_Pink.scn"),
        Product(type: .Laptops, title: "MacBook Air 2022", productImage: "MacBookAirM2", modelName: "MacBook_Air_M2_2022.scn"),
        Product(type: .Laptops, title: "MacBook Pro 2021", productImage: "MacBookPro2021", modelName: "MacBook_Pro_2021.scn"),
        Product(type: .Laptops, title: "iMac 2021", productImage: "iMacM12021", modelName: "iMac_M1_2021.scn"),
        Product(type: .Laptops, title: "Mac Studio 2022", productImage: "MacStudio", modelName: "Mac_Studio.scn"),
        Product(type: .Tablets, title: "iPad Mini 6", productImage: "iPadMini", modelName: "iPadMini6.scn"),
        Product(type: .Tablets, title: "iPad Pro 2021", productImage: "iPadPro2021", modelName: "iPadPro2021.scn"),
        Product(type: .Tablets, title: "iPad Air 4", productImage: "iPadAir4", modelName: "iPadAir4.scn"),
    ]
    
   
    @Published var showText: String = ""
  
    @Published var showProducts: [Product]?
    
    var showCancellable: AnyCancellable?
    
    //Filtered Products
    @Published var filteredProducts: [Product] = []
        
    init(){
        filterProductByType()
        
        showCancellable = $showText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                if str != "" {
                    self.filterProductByShow()
                } else {
                    self.showProducts = nil
                }
            })
    }
    
    func filterProductByType(){
        let results = self.products
            .filter { product in
                return product.type == self.productType
            }
        
        self.filteredProducts = results.compactMap({ product in
            return product
        })
    }
    
    func filterProductByShow (){
        let results = self.products
            .filter { product in
                return product.title.lowercased().contains(self.showText.lowercased())
            }
        
        self.showProducts = results.compactMap({ product in
            return product
        })
    }
}
