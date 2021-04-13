//
//  ForgotPasswordView.swift
//  ShoppingCosmetic
//
//  Created by Habib Akbari on 1/30/21.
//

import SwiftUI
import NavigationStack

struct ForgotPasswordView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @EnvironmentObject private var navigationStack : NavigationStack
    

    
    var body: some View {
        
        ZStack {
            
            BackgroundColorGradientView()
            
            VStack (alignment: .leading){
                
                
                HStack {
                    
                    Button(action: {
                        self.navigationStack.pop()
                    }, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .padding(10)
                            .font(.system(size: 50))
                            .foregroundColor(Color(red: 155/256, green: 201/256, blue: 167/256))
                    })
                    .padding(.top,10)
                    //Spacer()
                    
                    HStack(alignment: .center) {
                        Spacer()
                        Text("Forgot Password")
                            .font(.system(size: 25))
                        
                        Spacer()
                    }
                    
                    HStack {
                        Image(systemName: "chevron.left.circle.fill")
                            .padding(10)
                            .font(.system(size: 50))
                            .foregroundColor(Color.clear)
                    }
                    
                    
                }
                
                Spacer()
                
                
                HStack {
                    
                    ScrollView(.vertical,showsIndicators: false) {
                        
                        ZStack {
                            
                            
                            myRectangle(heightRectangle: 250)
                            
                            VStack {
                                
                                
                                HStack {
                                    Image(systemName: "envelope")
                                        .resizable()
                                        .frame(width: 20, height: 15, alignment: .leading)
                                        .foregroundColor(.gray)
                                        .padding()
                                    
                                    TextField("Email", text: $email)
                                        .frame(height: 60, alignment: .leading)
                                    
                                }
                                .background(Color(red: 253/256, green: 202/256, blue: 206/256))
                                .cornerRadius(30)
                                .padding(5)
                                
                                
                                HStack {
                                    Button(action: {
                                        // self.Print("Login")
                                    },label: {
                                        HStack(alignment: .center){
                                            Spacer()
                                            Text("Reset Password")
                                                .font(.system(size: 25))
                                                .foregroundColor(Color.white)
                                                .padding()
                                            Spacer()
                                        }
                                    })
                                    .background(Color.black)
                                    .cornerRadius(30)
                                    .disabled(email.isEmpty || password.count < 6)
                                }
                                
                                
                            }
                            .padding(30)
                            
                        }
                        
                        
                    }
                    
                }
                
                Spacer()
            }
            
        }
        
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
