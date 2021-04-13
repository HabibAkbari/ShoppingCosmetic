//
//  ProductsRow.swift
//  ShoppingCosmetic
//
//  Created by Habib Akbari on 1/19/21.
//

import SwiftUI

struct ProductsRow: View {
    
     var shoppingCosmetic : ProductsItems
     var itemCategoryValue = 0
     var categorySelected = ""
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            
            
            Color(UIColor(red:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[0])!/256), green:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[1])!/256), blue:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[2])!/256), alpha: 1))

                VStack(alignment: .leading) {
                    
                    
                    Text(categorySelected)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .frame(width: 100, height: 10, alignment: .leading)
                        .foregroundColor(.white)
                        .padding(.top, 25)
                        .padding(.leading,5)

                    Text("\(shoppingCosmetic.name)")
                        .lineLimit(2)
                        .foregroundColor(.white)
                        .font(.system(size: 29, weight: .bold, design: .rounded))
                        .frame(width: 258, height: 50, alignment: .leading)
                        .minimumScaleFactor(0.01)
                        .padding([.top,.leading],5)

                    Text("$ \(shoppingCosmetic.price)")
                        .foregroundColor(Color(UIColor(red:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[0])!/256), green:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[1])!/256), blue:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[2])!/256), alpha: 1)))
                        .font(.system(size: 23, weight: .bold, design: .rounded))
                        .frame(width: 112, height: 46, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(15)
                        .padding([.top,.leading],5)
                    
                }
                    
                .padding(.top,20)
                .padding(.leading,20)
               
                
                
                shoppingCosmetic.image00.renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(x: 85, y: 140)
                    .frame(width: 200, height: 300, alignment: .bottom)
            
        }
        .frame(width: 250, height: 400)
        .cornerRadius(40)
        .shadow(radius:1,x: 5, y: 5)
        .padding(5)
        
    }
}

