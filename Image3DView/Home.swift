//
//  Home.swift
//  eCommerce
//
//  Created by Diki Dwi Diro on 27/09/22.
//

import SwiftUI
//import Firebase

struct Home: View {
    let customFont = "Raleway-Regular"
    var animation: Namespace.ID
    
    @AppStorage("log_status") var log_status: Bool = false
    
    //Shared data
    @EnvironmentObject var sharedData: SharedDataModel
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 15){
                    
                    //                ZStack{
                    //                    if homeData.searchActivated{
                    //                        SearchBar()
                    //                    } else {
                    //                        SearchBar()
                    //                            .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                    //                    }
                    //                }
                    //                .frame(width: getRect().width / 1.1)
                    //                .contentShape(Rectangle())
                    //                .onTapGesture {
                    //                    withAnimation(.easeInOut){
                    //                        homeData.searchActivated = true
                    //                    }
                    //                }
                    //
                    //                Text("Welcome Diki Dwi Diro, \nHappy Shopping!")
                    //                    .font(.custom(customFont, size: 26).bold())
                    //                    .foregroundColor(Color.black)
                    //                    .frame(maxWidth: .infinity, alignment: .center)
                    //                    .padding(.top)
                    //                    .padding(.horizontal, 25)
                    //                    .shadow(color: Color.black.opacity(0.25), radius: 5, x: 5, y: 5)
                    
                    //                HStack {
                    //                    Image("profilePhoto")
                    //                        .resizable()
                    //                        .aspectRatio(contentMode: .fit)
                    //                        .frame(width: 150, height: 150)
                    //
                    //                    VStack(alignment: .leading, spacing: 5){
                    //                        Text("Diki Dwi Diro")
                    //                            .fontWeight(.bold)
                    //                            .font(.custom(customFont, size: 20))
                    //
                    //                        HStack {
                    //                            Image(systemName: "star.square.fill")
                    //                                .renderingMode(.template)
                    //                                .foregroundColor(.yellow)
                    //
                    //                            Text("Gold merchant")
                    //                                .font(.custom(customFont, size: 16))
                    //
                    //                        }
                    //
                    //                        Button(action: {
                    //                            try! Auth.auth().signOut()
                    //                            withAnimation{log_status = false}
                    //                        }, label: {
                    //                            Text("Log Out Account")
                    //                                .font(.custom(customFont,size: 15))
                    //                                .fontWeight(.bold)
                    //                                .foregroundColor(.white)
                    //                                .padding(.horizontal, 10)
                    //                                .frame(height: 30)
                    //                                .background(
                    //                                    Color("Purple")
                    //                                        .opacity(0.7)
                    //                                        .cornerRadius(5)
                    //                                )
                    //                        })
                    //                    }
                    //                }
                    //                .padding (.top, 15)
                    
                    //                Image("discountImage")
                    //                    .resizable()
                    //                    .aspectRatio(contentMode: .fit)
                    //                    .padding(.horizontal, 25)
                    //                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    //                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 5, y: 5)
                    
                    //Products Tab
                    //                ScrollView(.horizontal, showsIndicators: false){
                    //
                    //                    HStack(spacing: 18){
                    //
                    //                        ForEach(ProductType.allCases, id: \.self){type in
                    //
                    //                            //Product Type View
                    //                            ProductTypeView(type: type)
                    //                        }
                    //                    }
                    //                    .padding (.horizontal, 25)
                    //                }
                    //                .padding(.top)
                    
                    //Products Page
                    //  ScrollView(.horizontal, showsIndicators: false) {
                    VStack(spacing: 25){
                        
                        ForEach(homeData.products){product in
                            
                            //Product Card View
                            ProductCardView(product: product)
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom)
                    .padding(.top, 80)
                    // }
                    //  .padding(.top)
                }
                .padding(.vertical)
            }
//            .overlay{
//                ZStack{
//                    if homeData.searchActivated{
//                        SearchView(animation: animation)
//                            .environmentObject(homeData)
//                    }
//                }
//            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("HomeBG"))
            // Updating data whenever tab changes
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
            //Moving image to top to look like its fixed at half top...
//            .offset(y: -80)
//            .padding(.bottom, -80)
            Spacer()
            Text(product.title)
                .font(.custom(customFont, size: 18))
                .foregroundColor(Color.black)
                .fontWeight(.semibold)
                .padding(.top)
            
//            Text(product.subtitle)
//                .font(.custom(customFont, size: 14))
//                .foregroundColor(Color.gray)
            
//            Text(product.price)
//                .font(.custom(customFont, size: 16))
//                .foregroundColor(Color("Purple"))
//                .fontWeight(.bold)
//                .padding(.top, 5)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
        .background(
                
            Color.white
                .cornerRadius(25)
        )
        
        //Showing detail product detail when tapped
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
            //Updating current type
            withAnimation {
                homeData.productType = type
            }
        } label: {
            Text(type.rawValue)
                .font(.custom(customFont, size: 15))
                .fontWeight(.semibold)
            //Changing Color Based on Current product type
                .foregroundColor(homeData.productType == type ? Color("Purple") : Color.gray)
                .padding(.bottom, 10)
            //Adding indicator at bottom
                .overlay(
                    
                    //Adding Matched Geometry Effect
                    ZStack{
                        if homeData.productType == type{
                            Capsule()
                                .fill(Color("Purple"))
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

