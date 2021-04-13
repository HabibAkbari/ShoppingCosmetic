//
//  ProfileView.swift
//  ShoppingCosmetic
//
//  Created by Habib Akbari on 1/19/21.
//

import SwiftUI
import NavigationStack
import UIKit

struct ProfileView: View {
    
   

    @State var accountDetils  = Accounts(id:"",firstName: "", lastName: "", email: "", password: "", phone: [Phones(type: "mobile", number: 98)], address: Addresses(street: "", city: "", zip: 000000))
    
    @EnvironmentObject var profileSingIn : ProfilSingIn
    
    @State var showSingInView = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var userAuth = ProfilSingIn()
    
    @EnvironmentObject private var navigationStack : NavigationStack
    
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    
    var body: some View {
        
        NavigationStackView(transitionType: .default,easing: .easeOut(duration: 0.30)) {
            
            ZStack {
                BackgroundColorGradientView()
                
                
                VStack {
                    HStack {
                        
                        Spacer()
                        
                        HStack(alignment: .center) {
                            
                            Text("Profile")
                                .font(.system(size: 30))
                            
                            
                        }
                        .padding()
                        
                        Spacer()
                        
                    }
                    
                    Spacer()
                    
                    ScrollView(.vertical,showsIndicators: false) {
                        ZStack {
                            myRectangle(heightRectangle: 500)
                            VStack(alignment: .leading){
                                
                                HStack(alignment:.top) {
                                    
                                    VStack(){
                                        
                                        if image != nil {
                                            image?
                                            .resizable()
                                            .frame(width: 100, height: 100, alignment: .center)
                                            .cornerRadius(50)
                                            .padding()
                                            .overlay(ImageOvaerlay(), alignment: .bottom)
                                            
                                        } else {
                                            
                                            Image(systemName: "person.circle")
                                                .resizable()
                                                .frame(width: 100, height: 100, alignment: .center)
                                                .foregroundColor(.black)
                                                .background(Color.gray)
                                                .cornerRadius(50)
                                                .padding()
                                                .overlay(ImageOvaerlay(), alignment: .bottom)
                                        }
                                        

                                    }
                                    
                                    .padding(.top,5)
                                    .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
                                   
                                    .onTapGesture {
                                        self.showingImagePicker = true
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        checkSingIn = false
                                        self.navigationStack.pop()
                                        
                                    }, label: {
                                        Text("Log out")
                                    })
                                    .padding()
                                }
                                
                                
                                
                                PushView(destination: EditProfileView(accountDetils: accountDetils)) {
                                    HStack {
                                        
                                        Text("Edit Profile")
                                            .padding(.leading,5)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.compact.right")
                                            .resizable()
                                            .frame(width: 10, height: 10, alignment: .trailing)
                                            .padding(.trailing,5)
                                        
                                    }
                                    .padding()
                                }
                                
                                PushView(destination: OrdersView()) {
                                
                                HStack {
                                    
                                    Text("Orders")
                                        .padding(.leading,5)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.compact.right")
                                        .resizable()
                                        .frame(width: 10, height: 10, alignment: .trailing)
                                        .padding(.trailing,5)
                                    
                                }
                                .padding()
                                }
                                
                                PushView(destination: ChangePassword()) {
                                HStack {
                                    
                                    
                                    Text("ChangePassword")
                                        .padding(.leading,5)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.compact.right")
                                        .resizable()
                                        .frame(width: 10, height: 10, alignment: .trailing)
                                        .padding(.trailing,5)
                                }
                                .padding()
                                }
                                
                                
                                
//                                HStack {
//
//                                    Text("Others")
//                                        .padding(.leading,5)
//
//                                    Spacer()
//
//                                    Image(systemName: "chevron.compact.right")
//                                        .resizable()
//                                        .frame(width: 10, height: 10, alignment: .trailing)
//                                        .padding(.trailing,5)
//
//                                }
//                                .padding()
                                

                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $showingImagePicker,onDismiss: loadImage){
                ImagePicker(image: self.$inputImage)
            }
        }
        
    }
    
    func loadImage() {
        
        guard let inputImage = inputImage else { return  }
        image = Image(uiImage: inputImage)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ImageOvaerlay: View {
    
    var body: some View {
        ZStack {
            Text("Edit")
                .font(.system(size: 14))
                .padding(6)
                .foregroundColor(.white)
        }

        .padding(.bottom,18)
    }
    
}
