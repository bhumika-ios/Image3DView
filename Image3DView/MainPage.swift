//
//  Image3DViewApp.swift
//  Image3DView
//
//  Created by Bhumika Patel on 26/05/23.
//


import SwiftUI

struct MainPage: View {
    @StateObject var sharedData: SharedDataModel = SharedDataModel()
    @Namespace var animation
    var body: some View {
        
        VStack(spacing: 0){
                Home(animation: animation)
                    .environmentObject(sharedData)
            .padding([.horizontal, .top ])
            .padding(.bottom, 10)
        }
        .background(Color("HomeBG"))
        .overlay {
            ZStack{
               
                if let product = sharedData.detailProduct , sharedData.showDetailProduct {
                    
                    ProductDetailView(product: product, animation: animation)
                        .environmentObject(sharedData)
                   
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }
            }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}



