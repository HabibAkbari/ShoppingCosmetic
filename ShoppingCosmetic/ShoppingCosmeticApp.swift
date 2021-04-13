//
//  ShoppingCosmeticApp.swift
//  ShoppingCosmetic
//
//  Created by Habib Akbari on 1/18/21.
//

import SwiftUI

@main
struct ShoppingCosmeticApp: App {
    
   // @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
           
        }
    }
}
