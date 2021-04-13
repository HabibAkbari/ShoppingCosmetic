//
//  SingInView.swift
//  ShoppingCosmetic
//
//  Created by Habib Akbari on 1/30/21.
//

import SwiftUI
import NavigationStack
// SHA256
import CryptoKit

struct SingInView: View {
    let accounts = Bundle.main.decode([Accounts].self, from: "accounts.json")
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var remember = false
    
    @State var presentingModel = false
    @State var showProfileView = false
    
    @ObservedObject var model = SignUpFormModel()
    @State var passwordsValid = false
    @State var usernameAvailable = false
    @State private var showingAlert = false
    
    
    @State private var title = ""
    @State private var message = ""
    
    @State private var accountDetils = Accounts(id:"",firstName: "", lastName: "", email: "", password: "", phone: [Phones(type: "mobile", number: 98)], address: Addresses(street: "", city: "", zip: 000000))
    @EnvironmentObject var profileSingIn : ProfilSingIn
    
    @ObservedObject var userAuth = ProfilSingIn()
    
    @State private var isActive = false
    
    var body: some View {
        
        NavigationStackView(transitionType: .default,easing: .easeOut(duration: 0.30)) {
            
            ZStack {
                
                BackgroundColorGradientView()
                
                VStack{
                    
                    HStack {
                        
                        Spacer()
                        
                        HStack(alignment: .center) {
                            
                            Text("Sing In")
                                .font(.system(size: 30))
                            
                            
                        }
                        .padding()
                        
                        Spacer()
                        
                    }
                    
                    Spacer()
                    
                    ScrollView(.vertical,showsIndicators: false) {
                        
                        ZStack {
                            
                            
                            myRectangle(heightRectangle: 500)
                            
                            VStack {
                                
                                
                                HStack {
                                    Image(systemName: "envelope")
                                        .resizable()
                                        .frame(width: 20, height: 15, alignment: .leading)
                                        .foregroundColor(.gray)
                                        .padding()
                                    
                                   
                                    TextField("Email", text: $model.userName)
                                        .frame(height: 60, alignment: .leading)
                                    
                                    if model.userName != "" {
                                        Text(usernameAvailable ? "⚉" : "⚉")
                                            .foregroundColor(usernameAvailable ? .green : .red)
                                            .padding()
                                            .onReceive(model.validatedUsername) {
                                                usernameAvailable = $0 != nil
                                            }
                                    }
                                    
                                }
                                .background(Color(red: 253/256, green: 202/256, blue: 206/256))
                                .cornerRadius(30)
                                .padding(5)
                                
                                HStack {
                                    Image(systemName: "key")
                                        .resizable()
                                        .frame(width: 15, height: 20, alignment: .leading)
                                        .foregroundColor(.gray)
                                        .padding()
                                    
                                    SecureField("Password", text: $model.password)
                                        .frame(height: 60, alignment: .leading)
                                    if model.password != "" {
                                        Text(passwordsValid ? "⚉" : "⚉")
                                            .foregroundColor(passwordsValid ? .green : .red)
                                            .padding()
                                            .onReceive(model.validatedPassword) {
                                                passwordsValid = $0 != nil
                                            }
                                        
                                    }
                                    
                                    
                                }
                                .background(Color(red: 253/256, green: 202/256, blue: 206/256))
                                .cornerRadius(30)
                                .padding(5)
                                
                                
                                HStack() {
                                    
                                    Toggle(isOn: $remember) {
                                        Text("Remamber me")
                                    }
                                    .labelsHidden()
                                    .toggleStyle(CheckboxToggleStyle())
                                    
                                    
                                    Spacer()
                                    
                                    PushView(destination: ForgotPasswordView()) {
                                        Text("Forgot Password?")
                                    }
                                    

                                    
                                }
                                .padding(5)
                                
                                
                                HStack {
                                    
                                    
                                    PushView(destination: ProfileView(accountDetils: accountDetils),isActive: $isActive) {
                                        
                                        Button(action: {
                                            
                                            if (model.userName != ""   && model.password != "") {
                                                
                                                if self.signIn() != false {

                                                    model.userName = ""
                                                    model.password = ""
                                                    checkSingIn = true
                                                    isActive.toggle()
                                                    
                                                } else {
                                                    
                                                    showingAlert = true
                                                    title = "Message"
                                                    message = "Email and password not correct !"
                                                }
                                            } else {
                                                showingAlert = true
                                                title = "Message"
                                                message = "Email and password not emtiy !"
                                            }
                                           
                                            
                                        }) {
                                            HStack(alignment: .center){
                                                Spacer()
                                                Text("Sing In")
                                                    .font(.system(size: 25))
                                                    .foregroundColor(Color.white)
                                                    .padding()
                                                Spacer()
                                            }
                                            .alert(isPresented: $showingAlert) {
                                                Alert(title: Text("\(title)"), message: Text("\(message)"),primaryButton: Alert.Button.default(Text("OK"), action: {
                                                    
                                                    //self.presentation.wrappedValue.dismiss()
                                                    
                                                }), secondaryButton: .cancel())
                                            }
                                            
                                            
                                        }
                                        .background(Color.black)
                                        .cornerRadius(30)
                                        
                                    }
                                    
                                    
                                }
                                
                                
                                
                                HStack {
                                    Text("OR")
                                        .foregroundColor(Color.white)
                                        .padding(5)
                                }
                                
                                HStack {
                                    Button(action: {
                                        
                                    }, label: {
                                        Spacer()
                                        HStack{
                                            Image("apple_logo")
                                                .foregroundColor(Color.white)
                                            Text("Sing in with Apple")
                                                .font(.system(size: 25))
                                                .foregroundColor(Color.white)
                                            
                                        }
                                        .padding()
                                        Spacer()
                                    })
                                    
                                    .background(Color(red: 57/256, green: 54/256, blue: 65/256))
                                    .cornerRadius(30)
                                }
                                
                                HStack {
                                    PushView(destination: SingUpView()) {
                                        Text("Sing Up")
                                    }
                                    
                                }
                                
                                
                                
                            }
                            .padding(30)
                            
                            
                        }
  
                    }
                    
                }
            }
        }
    }
    

    
    func signIn() -> Bool {
        
        do {
            
            let filename = getDirectory(fileNmae: "accounts.json")
            let jsonDataEcode = try Data(contentsOf: filename)
            let decoder = JSONDecoder()
            let decoded = try decoder.decode([Accounts].self, from: jsonDataEcode)
            
            // let decoded =  Bundle.main.decode([Accounts].self, from: "accounts.json")
            
            let inputData = Data(model.password.utf8)
            let hashed = SHA256.hash(data: inputData)
            let hashString = hashed.compactMap{ String(format: "%02x", $0)}.joined()
            
            
            for accent in decoded {
                
                if model.userName == accent.email && hashString == accent.password {
                    
                    accountDetils = accent
                    
                    return true
                }
                
            }
            
        } catch {
            
        }
        
        return false
    }
}

struct SingInView_Previews: PreviewProvider {
    static var previews: some View {
        SingInView()
    }
}


