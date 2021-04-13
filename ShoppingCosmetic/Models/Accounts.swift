//
//  Accounts.swift
//  ShoppingCosmetic
//
//  Created by Habib Akbari on 1/31/21.
//

import Foundation

struct Accounts: Codable,Identifiable {
    
    //let id = UUID()
    let id : String
    let firstName : String
    let lastName : String
    let email : String
    let password : String
    //    let password : Any
    let phone :  [Phones]
    let address : Addresses
    
}

struct Phones : Codable {
    
    let type: String
    let number: Int
    
}

struct Addresses : Codable {
    
    let street, city: String
    let zip : Int
    
}
