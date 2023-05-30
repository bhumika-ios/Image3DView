//
//  Image3DViewApp.swift
//  Image3DView
//
//  Created by Bhumika Patel on 26/05/23.
//

import SwiftUI
//import Firebase

struct Home: View {
    let customFont = "Raleway-Regular"
    var animation: Namespace.ID
    @EnvironmentObject var sharedData: SharedDataModel
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 0){
                    VStack(spacing: 015){
                        
                        ForEach(homeData.products){product in
                            
                            ProductCardView(product: product)
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom)
                    .padding(.top, 80)
                    .padding(.top,-75)
                }
                .padding(.vertical)
            }

            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("HomeBG"))
            .onChange(of: homeData.productType) { newValue in
                homeData.filterProductByType()
            }
            .navigationTitle("3D Image View")
            
        }
      
        
    }
    @ViewBuilder
    func ProductCardView(product: Product)-> some View{
        
        HStack(spacing: 10) {
            ZStack{
                if sharedData.showDetailProduct{
                    Image(product.productImage)
                        .resizable()
                        .frame(width: 300, height: 280)
                        .aspectRatio(contentMode: .fit)
                    
                } else {
                    Image(product.productImage)
                        .resizable()
                        .frame(width: 140, height: 120)
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "\(product.id)IMAGE", in: animation)
                }
            }
            .frame(width: getRect().width / 2.5, height: getRect().width / 2.5)

            Spacer()
            Text(product.title)
                .font(.custom(customFont, size: 18))
                .foregroundColor(Color.black)
                .fontWeight(.semibold)
                .padding(.top)
            
             .padding(.top, 5)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
        .background(
                
            Color.white
                .cornerRadius(25)
        )
        
        .onTapGesture {
            withAnimation(.easeInOut){
                sharedData.detailProduct = product
                sharedData.showDetailProduct = true
            }
        }
    }
    
    @ViewBuilder
    func ProductTypeView(type: ProductType)-> some View{
        
        Button {
            withAnimation {
                homeData.productType = type
            }
        } label: {
            Text(type.rawValue)
                .font(.custom(customFont, size: 15))
                .fontWeight(.semibold)
           
                .foregroundColor(homeData.productType == type ? Color("Orange") : Color.gray)
                .padding(.bottom, 10)
            
                .overlay(
                    
                    //Adding Matched Geometry Effect
                    ZStack{
                        if homeData.productType == type{
                            Capsule()
                                .fill(Color("Orange"))
                                .matchedGeometryEffect(id: "PRODUCTTAB", in: animation)
                                .frame(height: 2)
                        } else {
                            Capsule()
                                .fill(Color.clear)
                                .frame(height: 2)
                        }
                    }
                    .padding(.horizontal,-5)
                    ,alignment: .bottom
                )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

