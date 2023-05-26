//
//  ProductDetailView.swift
//  eCommerce
//
//  Created by Diki Dwi Diro on 09/10/22.
//

import SwiftUI
import SceneKit

struct ProductDetailView: View {
    let customFont = "Raleway-Regular"
    var product: Product
    
    //For matched geometry effect
    var animation: Namespace.ID
     
    //Shared Data Model
    @EnvironmentObject var sharedData: SharedDataModel
    
    @EnvironmentObject var homeData: HomeViewModel
    
    var body: some View {
        
        VStack{
            
            //Title bar and product image
            VStack{
                //Title bar
                HStack{
                    Button {
                        //Closing detail view
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
                    
                   
                    
                    Spacer()
                    
//                    Button {
//                        addToLiked()
//                    } label: {
//                        Image("Liked")
//                            .renderingMode(.template)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 22, height: 22)
//                            .foregroundColor(isLiked() ? .red : Color.black.opacity(0.7))
//                    }
                }
                .padding()
                
                if sharedData.show3DModelProduct {
                    CustomSceneView(product: product)
                        .frame(width: UIScreen.main.bounds.width)
                    
                } else {
                    //Product image
                    //Adding matched geometry effect
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
                
                
                
            //Product details
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
                                    Color("Purple")
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 5, y: 5)
                                )
                }
                .offset(y:50)
                //Product data
//                VStack(alignment: .leading, spacing: 15){
//                    Text(product.title)
//                        .font(.custom(customFont, size: 20).bold())
//
//                    Text(product.subtitle)
//                        .font(.custom(customFont, size: 18))
//                        .foregroundColor(Color.gray)
//
//                    Text("Get Apple TV+ free for a year")
//                        .font(.custom(customFont, size: 16).bold())
//                        .padding(.top)
//
//                    Text("Available when you purchase any new iPhone, iPad, iPod Touch, Mac or Apple TV, £4.99/month after free trial.")
//                        .font(.custom(customFont, size: 15))
//                        .foregroundColor(Color.gray)
//
//                    HStack {
//                        Text("Total")
//                            .font(.custom(customFont, size: 17).bold())
//
//                        Spacer()
//
//                        Text(product.price)
//                            .font(.custom(customFont, size: 20).bold())
//                            .foregroundColor(Color("Purple"))
//                    }
//                    .padding(.vertical, 20)
//
//                    Button {
//                        addToCart()
//                    } label: {
//                        Text("\(isAddedToCart() ? "Sucess! added" : "add") to cart")
//                            .font(.custom(customFont,size: 20).bold())
//                            .foregroundColor(.white)
//                            .padding(.vertical, 20)
//                            .frame(maxWidth: .infinity)
//                            .background(
//                                Color("Purple")
//                                    .cornerRadius(15)
//                                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 5, y: 5)
//                            )
//                    }
//                }
//                .padding([.horizontal, .bottom], 20)
//                .padding(.top, 25)
//                .frame(maxWidth: .infinity, alignment: .leading)
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color("HomeBG")
                    //Corner radius for only top side
                        .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
                        .ignoresSafeArea()
                )
                .zIndex(0)
            }
        .animation(.easeInOut, value: sharedData.likedProducts)
        .animation(.easeInOut, value: sharedData.cartProducts)
        .background(
            Color("HomeBG")
                    .ignoresSafeArea()
        )
    }
    
    func isLiked()-> Bool {
        return sharedData.likedProducts.contains { product in
            return self.product.id == product.id
        }
    }
    
    func isAddedToCart()-> Bool {
        return sharedData.cartProducts.contains { product in
            return self.product.id == product.id
        }
    }
    
    func addToLiked(){
        //Checking whether the first element of liked products is the same or not
        if let index = sharedData.likedProducts.firstIndex(where: { product in
            return self.product.id == product.id
        }){
            //Remove from liked
            sharedData.likedProducts.remove(at: index)
        } else {
            sharedData.likedProducts.append(product)
        }
    }
    
    func addToCart(){
        if let index = sharedData.cartProducts.firstIndex(where: { product in
            return self.product.id == product.id
        }){
            //Remove from cart
            sharedData.cartProducts.remove(at: index)
        } else {
            sharedData.cartProducts.append(product)
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        MainPage()
    }
}
