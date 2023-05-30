//
//  Image3DViewApp.swift
//  Image3DView
//
//  Created by Bhumika Patel on 26/05/23.
//

import SwiftUI

class SharedDataModel: ObservableObject {
    
    @Published var detailProduct: Product?
    @Published var showDetailProduct: Bool = false
    @Published var show3DModelProduct: Bool = false
}
