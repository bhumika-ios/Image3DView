//
//  HomeViewModel.swift
//  eCommerce
//
//  Created by Diki Dwi Diro on 29/09/22.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var productType: ProductType = .Wearable
    
    //Sample Products
    @Published var products: [Product] = [
    
        Product(type: .Wearable, title: "Apple Airpods Max", subtitle: "Max - Silver", price: "$549", productImage: "airpodsMaxSilver", modelName: "Airpods_Max_Silver.usdz" ),
        Product(type: .Wearable, title: "Apple Airpods Pro", subtitle: "Pro - White", price: "$249", productImage: "airpodsPro", modelName: "Airpods_Pro.scn"),
        Product(type: .Wearable, title: "Apple Airpods Gen 2", subtitle: "Generation 2 - White", price: "$129", productImage: "airpodsGen2", modelName: "Airpods_Gen2.scn"),
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 7: Red", price: "$359",productImage: "AppleWatch7", modelName: "iWatch_7_Red.scn"),
        Product(type: .Phones, title: "iPhone 14 Pro", subtitle: "512GB - Deep Purple", price: "$1999", productImage: "iPhone14Pro", modelName: "iPhone_14Pro.scn"),
        Product(type: .Phones, title: "iPhone 13 Pro", subtitle: "256GB - Sierra Blue", price: "$1599", productImage: "iPhone13Pro", modelName: "iPhone_13Pro.scn"),
        Product(type: .Phones, title: "iPhone 12 Pro", subtitle: "256GB - Pacific Blue", price: "$1099", productImage: "iPhone12Pro", modelName: "iPhone_12Pro.scn"),
        Product(type: .Phones, title: "iPhone 13", subtitle: "128GB - Pink", price: "$899", productImage: "iPhone13", modelName: "iPhone_13_Pink.scn"),
        Product(type: .Laptops, title: "MacBook Air 2022", subtitle: "M2 - Midnight", price: "$999", productImage: "MacBookAirM2", modelName: "MacBook_Air_M2_2022.scn"),
        Product(type: .Laptops, title: "MacBook Pro 2021", subtitle: "M1 - Silver", price: "$1299", productImage: "MacBookPro2021", modelName: "MacBook_Pro_2021.scn"),
        Product(type: .Laptops, title: "iMac 2021", subtitle: "M1 - Green", price: "$1599", productImage: "iMacM12021", modelName: "iMac_M1_2021.scn"),
        Product(type: .Laptops, title: "Mac Studio 2022", subtitle: "M1 Max - Silver", price: "$2999", productImage: "MacStudio", modelName: "Mac_Studio.scn"),
        Product(type: .Tablets, title: "iPad Mini 6", subtitle: "A15 - Purple", price: "$599", productImage: "iPadMini", modelName: "iPadMini6.scn"),
        Product(type: .Tablets, title: "iPad Pro 2021", subtitle: "M1 - Space Grey", price: "$999", productImage: "iPadPro2021", modelName: "iPadPro2021.scn"),
        Product(type: .Tablets, title: "iPad Air 4", subtitle: "A14 - Blue", price: "$699", productImage: "iPadAir4", modelName: "iPadAir4.scn"),
    ]
    
    //Search Data
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    @Published var searchedProducts: [Product]?
    
    var searchCancellable: AnyCancellable?
    
    //Filtered Products
    @Published var filteredProducts: [Product] = []
        
    init(){
        filterProductByType()
        
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                if str != "" {
                    self.filterProductBySearch()
                } else {
                    self.searchedProducts = nil
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
    
    func filterProductBySearch (){
        let results = self.products
            .filter { product in
                return product.title.lowercased().contains(self.searchText.lowercased())
            }
        
        self.searchedProducts = results.compactMap({ product in
            return product
        })
    }
}
