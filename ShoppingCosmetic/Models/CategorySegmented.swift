//
//  CategorySegmented.swift
//  ShoppingCosmetic
//
//  Created by Habib Akbari on 1/19/21.
//

import SwiftUI

struct CategorySegmented: Codable, Identifiable {
    
    var id: UUID
    var category: String
    var items: [ProductsItems]
    
}

struct ProductsItems: Codable, Equatable, Identifiable,Hashable {
    
    var id: UUID
    var name: String
    var size: String
    var brand: String
    var price: Int
    var backgroundColorProduct: [String]
    var selectColorProduct: ColorProductItems
    var imageBackgroundProductDetails: String
    var imagesProduct: ImagesProductItems
    var description: String
}

extension ProductsItems {
    
    var image00: Image {
        ImageStore.shared.image(name: imagesProduct
            .image00)
        
        }
    
    var image01: Image {
        ImageStore.shared.image(name: imagesProduct.image01)
    }
    
    var image02: Image {
      
        ImageStore.shared.image(name: imagesProduct.image02)
    }
    
       
    var imageBackground: Image {
        ImageStore.shared.image(name: imageBackgroundProductDetails)
    }
}


struct ImagesProductItems: Hashable, Codable {
    var image00 : String
    var image01 : String
    var image02 : String
}

struct ColorProductItems: Hashable, Codable {
    var colorProduct00 : ColorRGBItem
    var colorProduct01 : ColorRGBItem
    var colorProduct02 : ColorRGBItem
}

struct ColorRGBItem: Hashable, Codable {
    var red :String
    var green: String
    var blue: String
}



