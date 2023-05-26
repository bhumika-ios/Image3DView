//
//  MainPage.swift
//  eCommerce
//
//  Created by Diki Dwi Diro on 27/09/22.
//

import SwiftUI

struct MainPage: View {
    //State Current Tab
    @State var currentTab: Tab = .Home
    
    @StateObject var sharedData: SharedDataModel = SharedDataModel()
//    @StateObject var loginData: LoginPageModel = LoginPageModel()
    
    //Animation namespace
    @Namespace var animation
    
    //Hiding Tab Bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        VStack(spacing: 0){
            
            //Tab View...
           // TabView(selection: $currentTab) {
                
                Home(animation: animation)
                    .environmentObject(sharedData)
                    .tag(Tab.Home)
                
//                LikedPage()
//                    .environmentObject(sharedData)
//                    .tag(Tab.Liked)
//
//                CartPage()
//                    .environmentObject(sharedData)
//                    .environmentObject(loginData)
//                    .tag(Tab.Cart)
         //   }
            
        //Custom Tab Bar...
//            HStack(spacing: 0){
//                ForEach(Tab.allCases, id: \.self){tab in
//                    
//                    Button {
//                         currentTab = tab
//                    } label: {
//                        ZStack(alignment: .topTrailing){
//                            if tab.rawValue == "Liked" {
//                                if sharedData.likedProducts.count > 0 {
//                                    Text("\(sharedData.likedProducts.count)")
//                                        .font(.caption2).bold()
//                                        .foregroundColor(.white)
//                                        .frame(width: 12, height: 12)
//                                        .background(Color.red.cornerRadius(10))
//                                        .offset(x: -30)
//                                }
//                            }
//                            
//                            if tab.rawValue == "Cart" {
//                                if sharedData.cartProducts.count > 0 {
//                                    Text("\(sharedData.cartProducts.count)")
//                                        .font(.caption2).bold()
//                                        .foregroundColor(.white)
//                                        .frame(width: 12, height: 12)
//                                        .background(Color.red.cornerRadius(10))
//                                        .offset(x: -30)
//                                }
//                            }
//                            
//                            Image(tab.rawValue)
//                                .resizable()
//                                .renderingMode(.template)
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 22, height: 22 )
//                            //Applying little shadow at background
//                                .background(
//                                    Color("Purple")
//                                        .opacity(0.1)
//                                        .cornerRadius(5)
//                                    //Bluring
//                                        .blur(radius: 5)
//                                    //Make it bigger
//                                        .padding(-7)
//                                        .opacity(currentTab == tab ? 1 : 0)
//                                )
//                                .frame(maxWidth: .infinity)
//                                .foregroundColor(currentTab == tab ? Color("Purple") : Color.black.opacity(0.3))
//                        }
//                    }
//                }
//            }
            .padding([.horizontal, .top ])
            .padding(.bottom, 10)
        }
        .background(Color("HomeBG"))
        .overlay {
            ZStack{
                //Detail page
                if let product = sharedData.detailProduct , sharedData.showDetailProduct {
                    
                    ProductDetailView(product: product, animation: animation)
                        .environmentObject(sharedData)
                    //Adding transitions from the right
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

//Making Case Iteratable
//Tab Cases

enum Tab: String, CaseIterable {
    
    //Raw Value must be image's Name in asset
    case Home = "Home"
    case Liked = "Liked"
    case Cart = "Cart"
}

