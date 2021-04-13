//
//  HomeView.swift
//  ShoppingCosmetic
//
//  Created by Habib Akbari on 1/19/21.
//

import SwiftUI
import NavigationStack

struct HomeView: View {
    
    @State private var searchBar: String = ""
    
    var body: some View {
        
        NavigationStackView(transitionType: .default,easing: .easeOut(duration: 0.30)) {
            
            ZStack {
                
                BackgroundColorGradientView()
                
                ScrollView {
                    
                    VStack {
                        
                        // Title
                        Text("Shopping Cosmetic")
                            .font(Font.body.bold())
                            .padding(.top,20)
                            .padding(.bottom,5)
                            .foregroundColor(.black)
                        
                        // Search
                        HStack(alignment: .center) {
                            
                            HStack {
                                
                                
                                if searchBar.isEmpty {
                                    
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        //.foregroundColor(.gray)
                                        .foregroundColor(Color("colorTabBar"))
                                }
                                
                                
                                TextField("Search for product", text: $searchBar)
                                    .font(Font.system(size: 20))
                                    .foregroundColor(.black)
                                
                                
                                if searchBar.isEmpty {
                                    Button(action:{
                                        // action camera
                                    }) {
                                        Image(systemName: "camera")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            //.foregroundColor(.gray)
                                            .foregroundColor(Color("colorTabBar"))
                                    }
                                    
                                } else {
                                    
                                    Button(action:{
                                        self.searchBar = ""
                                    }) {
                                        Image(systemName: "multiply.circle")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            //.foregroundColor(.gray)
                                            .foregroundColor(Color("colorTabBar"))
                                    }
                                    
                                }
                                
                                
                            }
                            .padding(20)
 
                        }
                        .background(Color(red: 253/256, green: 202/256, blue: 206/256))
                        .cornerRadius(30)
                        .padding(5)
                       
                        
                        
                        if searchBar.isEmpty {
                            CategoryAndShowProducts(selectedSearch: true)

                        } else {
                            CategoryAndShowProducts(selectedSearch: false, searchBar: searchBar)

                        }
                        
                    }
               
                }
                
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
