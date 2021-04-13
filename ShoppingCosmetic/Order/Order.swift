//
//  Order.swift
//  ShoppingCosmetic
//
//  Created by Habib Akbari on 1/20/21.
//

import Foundation
import SwiftUI

struct SelectedProductsItems:Identifiable,Hashable {
    
    var id = UUID()
    var items = [ProductsItems]()
    var countItem: Int
    var category : String
    var selctedImagesProductNumber : Int
    
    
    init(items:ProductsItems,count:Int,categorySelected:String,selctedImagesProductNumber:Int) {
        self.items = [items]
        self.countItem = count
        self.category = categorySelected
        self.selctedImagesProductNumber = selctedImagesProductNumber
    }
}

class Order: ObservableObject {
    
    @Published var selectedProductsItems = [SelectedProductsItems]()
    
    var uintProduct = [Int]()
    
    var total : Int {
        
        if selectedProductsItems.count > 0 {
            
            var total = 0
            
            for index in self.selectedProductsItems.indices {
                total += selectedProductsItems[index].items[0].price * selectedProductsItems[index].countItem
                
                
            }
            return total
            
        } else {
            
            return 0
        }
    }
    
    
    func add(item: SelectedProductsItems) {
        selectedProductsItems.append(item)
        
    }
    
    func remove(at indexSet: IndexSet) {
        
        self.selectedProductsItems.remove(atOffsets: indexSet)
    }
    
    func removeAll() {
        self.selectedProductsItems.removeAll()
    }
    
    
}


