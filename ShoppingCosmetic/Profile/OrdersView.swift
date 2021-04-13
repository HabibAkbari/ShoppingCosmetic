//
//  OrdersView.swift
//  ShoppingCosmetic
//
//  Created by Habib Akbari on 2/8/21.
//

import SwiftUI

struct OrdersView: View {
    
    var body: some View {
        ZStack {
            
            BackgroundColorGradientView()
            
            ScrollView(.vertical,showsIndicators: false) {
                
        Text("OrdersView")
            }
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
