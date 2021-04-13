//
//  Constant.swift
//  ShoppingCosmetic
//
//  Created by Habib Akbari on 1/19/21.
//

import Foundation
import SwiftUI
import UIKit
import NavigationStack
import Combine
import CryptoKit

let products = Bundle.main.decode([CategorySegmented].self, from: "menu.json")
public var selectedColorProductPublic = 0

struct BackgroundColorGradientView:View {
    
    var body: some View {

        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color(red: 250/256, green: 87/256, blue: 115/256), Color(red: 250/256, green: 108/256, blue: 92/256)]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Wave(graphWidt: 1.4, amplitude: 0.09,x: -89,y: 0.85)
                
            }
            //.frame(height: 300)
            .foregroundColor(Color(red: 251/256, green: 219/256, blue: 222/256))
            .opacity(0.2)
            
            VStack {
                Wave(graphWidt: 1.09, amplitude: 0.06,x: -75,y: 0.88)
                
            }
            //.frame(height: 500)
            .foregroundColor(Color(red: 251/256, green: 219/256, blue: 222/256))
            .opacity(0.2)
            
            VStack {
                Wave(graphWidt: 1.9, amplitude: 0.07,x: 49,y: 0.92)
            }
            //.frame(height: 300)
            .foregroundColor(Color(red: 251/256, green: 219/256, blue: 222/256))
            .opacity(0.2)
            
        }
 
    }
    
}


struct Wave: Shape {
    
    let graphWidt: CGFloat
    let amplitude: CGFloat
    let x:CGFloat
    let y: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let width = rect.width
        let height = rect.height
        
        let origin = CGPoint(x: x, y: height * y)
        
        var path = Path()
        path.move(to: origin)
        
        var endY: CGFloat = 0.0
        let step = 5.0
        for angle in stride(from: step, through: Double(width) * (step * step), by: step) {
            let x = origin.x + CGFloat(angle/360.0) * width * graphWidt
            let y = origin.y - CGFloat(sin(angle/180.0 * Double.pi)) * height * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
            endY = y
        }
        
        path.addLine(to: CGPoint(x: width, y: endY))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: origin.y))
       
        
        return path
        
    }
    

}

struct CategoryAndShowProducts: View {
    
    
    @State var dataToShow = "Perfume"
    var selectedSearch = false
    var searchBar = ""
    
    
    
    var body: some View {
        
        VStack {
            //          HStack {
            
            HStack {
                ForEach(products) { categoryItem in
                    // self.Print(section)
                    
                    //Section(header: Text(section.category)) {
                    
                    Button(action: {
                        self.dataToShow = categoryItem.category
                    }) {
                        Text(categoryItem.category)
                            .frame(alignment: .center)
                            .font(categoryItem.category == self.dataToShow
                                    ? .custom("DINCondensed-Bold", size:24)
                                    : .custom("DINCondensed-Bold", size:20))
                            .foregroundColor(categoryItem.category == self.dataToShow
                                                ? Color.black
                                                : Color("colorTabBar"))
                            .animation(nil)
                        
                    }
                    .padding(.leading, 40)
                    Spacer()
                    
                    
                    
                }
            }
            
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    
                    if selectedSearch {
                        //self.Print(products)
                        ForEach(products) { categoryItem in
                            
                            ForEach(categoryItem.items) { item in
                                
                                //                                NavigationLink(destination: ShoppingDetailNew(shoppingDetailNew: item, categorySelected: categoryItem.category) ) {
                                
                                PushView(destination: ShoppingDetail(shoppingDetail: item, categorySelected: categoryItem.category)) {
                                    if (self.dataToShow == categoryItem.category) {
                                        
                                        // ProductsRow(shoppingCosmetic: item)
                                        //productItem.append(item)
                                        ProductsRow(shoppingCosmetic: item, categorySelected: self.dataToShow)
                                    }
                                    
                                }
                                
                            }
                        }
                        
                    } else {
                        
                        ForEach(products) { categoryItem in
                            ForEach(categoryItem.items.filter {
                                self.searchBar.isEmpty ? true :
                                    $0.name.localizedCaseInsensitiveContains(self.searchBar)
                            }) { item in
                                
                                
                                PushView(destination: ShoppingDetail(shoppingDetail: item)) {
                                    ProductsRow(shoppingCosmetic: item, categorySelected: self.dataToShow)
                                }
                                
                            }
                            
                        }
                        
                        
                    }
                    
                }
                
                
            }
            
            .frame(height: 390)
            
            
        }
    }
    
}

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
    

}



func getDirectory(fileNmae:String) -> URL {
    
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let getFile = paths[0].appendingPathComponent(fileNmae)
    return getFile
    
}





//---------------- Sign In --------------------

public var checkSingIn = false

final class ProfilSingIn : ObservableObject {
    
    @Published var isLoggedIn : Bool = false
}

struct myRectangle: View {
    
    @State var heightRectangle = CGFloat()
    var body: some View {
        Rectangle()
            
            .fill(LinearGradient(gradient: Gradient(colors: [ Color(red: 250/256, green: 108/256, blue: 92/256),Color(red: 250/256, green: 87/256, blue: 115/256)]), startPoint: .topTrailing, endPoint: .bottomLeading))


            .frame(height: heightRectangle)
            .cornerRadius(40)

            .padding(10)
            .shadow(radius: 2)

    }
    
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        return HStack {
            
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
            .resizable()
            .frame(width: 22, height: 22)
                .onTapGesture {
                    configuration.isOn.toggle()
            }
             //Spacer()
            configuration.label
           
        }
    }
    
}


class SignUpFormModel: ObservableObject {
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    
    var validatedPassword: AnyPublisher<String?, Never> {
        
        return $password
                .debounce(for: 0.5, scheduler: RunLoop.main)
                .removeDuplicates()
                .flatMap { password in
                    return Future { promise in
                        passwordAvailable(password) { available in
                            promise(.success(available ? password : nil))
                        }
                        
                    }
            }
    .eraseToAnyPublisher()
    }
    
    var validatedUsername: AnyPublisher<String?, Never> {
        return $userName
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap { userName in
                return Future { promise in
                    usernameAvailable(userName) { available in
                        promise(.success(available ? userName : nil))
                    }
                    
                }
        }
    .eraseToAnyPublisher()
    }
    
    var validateConfermPassword : AnyPublisher<String?, Never> {
        
        return $confirmPassword
                .debounce(for: 0.5, scheduler: RunLoop.main)
                .removeDuplicates()
                .flatMap { confirmPassword in
                    return Future { promise in
                        confermPasswordAvailable(confirmPassword,password: self.password) { available in
                            promise(.success(available ? confirmPassword : nil))
                        }
                        
                    }
            }
    .eraseToAnyPublisher()
    }
    
    
    var validatedCredentials: AnyPublisher<(String, String)?, Never> {
        validatedUsername.combineLatest(validatedPassword) { userName, password in
            guard let uname = userName, let pwd = password else {return nil}
            return (uname, pwd)
        }
    .eraseToAnyPublisher()
    }
  
    
}

func usernameAvailable(_ username: String, completion: @escaping(Bool) -> ()) -> () {
    DispatchQueue.main.async {

        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)

        if(emailPredicate.evaluate(with: username)) {

            completion(true)
            
        } else {
            
            completion(false)
            
        }
    }
}

func passwordAvailable(_ password: String, completion: @escaping(Bool) -> ()) -> () {

    let passwordFormat = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
    
    if (passwordPredicate.evaluate(with: password)) {
        
        completion(true)
        
    } else {
        
        completion(false)
        
    }
    
}

func confermPasswordAvailable(_ confermPassword: String, password: String, completion: @escaping(Bool) -> ()) -> () {
    
    if (password == confermPassword) {
        completion(true)
    } else {
        completion(false)
    }
    
}
