//
//  SingUpView.swift
//  ShoppingCosmetic
//
//  Created by Habib Akbari on 1/30/21.
//

import SwiftUI
import Combine

import CryptoKit
import NavigationStack

import Foundation

struct SingUpView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Environment(\.presentationMode) var presentation
    @State private var showingAlert = false
    @State private var title = ""
    @State private var message = ""
   
    @ObservedObject var model = SignUpFormModel()
    @State var usernameAvailable = false
    @State var passwordsValid = false
    @State var confermPasswordValid = false
    @State var signUpDisabled = true
    @State var alertShown = false
    
    @State private var textEmail : String = ""
    @State private var isEmailValid : Bool = true
    
     @EnvironmentObject private var navigationStack : NavigationStack
    
    @State var acountes = [Data]()
    
   
    
    var body: some View {
        
        ZStack{
            
            BackgroundColorGradientView()
            
            VStack (){
                
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
                        Text("Sing Up")
                            .font(.system(size: 30))
                        
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

                            myRectangle(heightRectangle: 400)
                            
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
                                                self.usernameAvailable = $0 != nil
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
                                                self.passwordsValid = $0 != nil
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
                                    

                                    SecureField("Confirm Password", text: $model.confirmPassword)
                                        .frame(height: 60, alignment: .leading)
                                    
                                    if model.confirmPassword != "" {
                                        Text(confermPasswordValid ? "⚉" : "⚉")
                                            
                                            .foregroundColor(confermPasswordValid ? .green : .red)
                                            .padding()
                                            .onReceive(model.validateConfermPassword) {
                                                self.confermPasswordValid = $0 != nil
                                        }
                                    }
                                    
                                    
                                    
                                    
                                }
                                .background(Color(red: 253/256, green: 202/256, blue: 206/256))
                                .cornerRadius(30)
                                .padding(5)
                                
                                
                                HStack {
                                    
                                    Button(action: {
                                        
                                        if (self.model.userName != ""   && self.model.password != "" && self.model.confirmPassword != "") {
                                            
                                            if self.singUp() != true {
                                                
                                                // Call message not registred!
                                                message(message: "This email has already been registred!")
                                                
                                                
                                            } else {
                                               
                                                // Call message successfully
                                                message(message: "Your account has been successfully.")
                                                
                                            }
                                            
                                        } else {
                                            
                                            // Call message emptiy text View
                                            message(message: "Not emtiy email , password and conferm password.")
                                            
                                        }
  
                                    }) {
                                        HStack(alignment: .center){
                                            Spacer()
                                            Text("Sing Up")
                                                .font(.system(size: 25))
                                                .foregroundColor(Color.white)
                                                .padding()
                                            Spacer()
                                        }
                                        .alert(isPresented: $showingAlert) {
                                            Alert(title: Text("\(self.title)"), message: Text("\(self.message)"),primaryButton: Alert.Button.default(Text("OK"), action: {
                                                self.navigationStack.pop()
                                            }), secondaryButton: .cancel())
                                        }
                                        
                                    }
                                        
                                    .background(Color.black)
                                    .cornerRadius(30)
                                    
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
    
    
    func message(message: String) {
        
        // Empty text View
        self.model.userName = ""
        self.model.password = ""
        self.model.confirmPassword = ""
        
        // show message
        self.title = "Message"
        self.message = message
        self.showingAlert = true
       
        
    }
    
    func singUp() -> Bool {

        do {
            
           
            // get file
            let filename = getDirectory(fileNmae: "accounts.json")

            
            // Chack Exists file to dirctory
            if  FileManager.default.fileExists(atPath: filename.path) == false {
                
                
                //Copy file to Documents
                let from = Bundle.main.url(forResource: "accounts", withExtension: "json")
                //let to = directory().appendingPathComponent("accounts.json")
                let to = getDirectory(fileNmae: "accounts.json")
                try FileManager.default.copyItem(at: from!, to: to)
                
                
                //write to accounts.json file "[]"
                //let test = "[]"
                let test = "[]"
                let testData = test.data(using: .utf8)
                try testData?.write(to: filename,options: [])
                
            }
            
            // read data file accounts.json
            let jsonDataEcode = try Data(contentsOf: filename)
            let decoder = JSONDecoder()
            let decoded = try decoder.decode([Accounts].self, from: jsonDataEcode)
            
            
            // chake count acounte
            if decoded.count != 0 {
                
                // loop for accountes to accounts.json
                for itemDecoded in decoded {

                    // ckake email
                    if itemDecoded.email
                    != model.userName {
                        
                        // call func add to array acountes
                        addToArray()
                        
                    } else {
                        
                        return false
                    }
                    
                }
                

                // call func write to file accounts.json
                writeToFile()
                

            } else {
                
                
                // call func add to array acountes
                addToArray()
                
                // call func write to file accounts.json
                writeToFile()
                
//                do {
//                    
//                    // call func add to array acountes
//                    addToArray()
//                    
//                    // call func write to file accounts.json
//                    writeToFile()
//  
//                } catch  {
//                    print(error)
//                }

            }

            
        } catch {
            print(error)
            return false
            
        }
        
      
        return true
        
    }
    

    func addToArray()  {
        
        do {
            
            //let filename = self.directory().appendingPathComponent("accounts.json")
            let filename = getDirectory(fileNmae: "accounts.json")
            
            // hash password
            let inputData = Data(model.password.utf8)
            let hashed = SHA256.hash(data: inputData)
            let hashString = hashed.compactMap{ String(format: "%02x", $0)}.joined()
            
            // crate new accounts
            let id = UUID().uuidString
            let newUser = Accounts(id:id,firstName: "", lastName: "", email: model.userName, password: hashString, phone: [Phones(type: "mobile", number: 98)], address: Addresses(street: "", city: "", zip: 000000))

            
            let jsonDataRead = try Data(contentsOf: filename)
            let jsonStringRead = String(data: jsonDataRead, encoding: .utf8)
            
            // removw [ ] on json
            let removeFirst = jsonStringRead!.dropFirst(1)
            let removeLast = removeFirst.dropLast(1)
            
            // encode data
            let jsonEncoder = JSONEncoder()
            let jsonDataEncoder = try jsonEncoder.encode(newUser)
          
            
            // convert data to string
            let jsonString = String(data: jsonDataEncoder, encoding: .utf8)
            let jsonStringComa = "\(jsonString!),\n"
            let test = "[\(jsonStringComa+removeLast)]"
            

            // add to array acountes
            let testData = test.data(using: .utf8)
            acountes.append(testData!)
            
        } catch  {
            print(error)
        }
    }
    
    func writeToFile() {
        //let filename = self.directory().appendingPathComponent("accounts.json")
        let filename = getDirectory(fileNmae: "accounts.json")
        for acountesItem in acountes {
            do {
            try acountesItem.write(to: filename, options: [])
            } catch {
                print(error)
            }
        }
    }

    func textFieldValidationEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4})"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
        
    }
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SingUpView()
    }
}


