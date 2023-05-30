//
//  Image3DViewApp.swift
//  Image3DView
//
//  Created by Bhumika Patel on 26/05/23.
//

import SwiftUI
import SceneKit

struct ProductDetailView: View {
    let customFont = "Raleway-Regular"
    var product: Product
    var animation: Namespace.ID
     
    @EnvironmentObject var sharedData: SharedDataModel
    
    @EnvironmentObject var homeData: HomeViewModel
    
    var body: some View {
        
        VStack{
            VStack{
                HStack{
                    Button {
                        withAnimation(.easeInOut) {
                            sharedData.showDetailProduct = false
                            sharedData.show3DModelProduct = false
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    
                    Spacer()
                    
                }
                .padding()
                
                if sharedData.show3DModelProduct {
                    CustomSceneView(product: product)
                        .frame(width: UIScreen.main.bounds.width)
                    
                } else {
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "\(product.id)IMAGE", in: animation)
                        .padding(.horizontal)
                        .offset(y: -12)
                        .frame(maxHeight: .infinity)
                }
            }
            .frame(height: getRect().height / 2.7)
            .zIndex(1)
            
            ScrollView(.vertical, showsIndicators: false) {
                Button {
                    sharedData.show3DModelProduct.toggle()
                } label: {
                    Text(sharedData.show3DModelProduct ? "Hide 3D Model" : "Show 3D Model")
                        .font(.custom(customFont,size: 20).bold())
                        .foregroundColor(.white)
                        .padding(.vertical, 20)
                        .frame(width:350)
                        .background(
                                    Color("Orange")
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 5, y: 5)
                                )
                }
                .offset(y:50)
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color("HomeBG")
                        .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
                        .ignoresSafeArea()
                )
                .zIndex(0)
            }
        .background(
            Color("HomeBG")
                    .ignoresSafeArea()
        )
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        MainPage()
    }
}
