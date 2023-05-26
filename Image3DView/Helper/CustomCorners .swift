//
//  CustomCorners.swift
//  eCommerce
//
//  Created by Diki Dwi Diro on 25/09/22.
//

import SwiftUI

struct CustomCorners: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners , cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

 
extension View{
    func getRect()->CGRect {
        return UIScreen.main.bounds
    }
}
