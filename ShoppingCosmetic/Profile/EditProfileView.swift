//
//  EditProfileView.swift
//  ShoppingCosmetic
//
//  Created by Habib Akbari on 2/26/21.
//

import SwiftUI
import NavigationStack

struct EditProfileView: View {
    
    @State var accountDetils  = Accounts(id:"",firstName: "", lastName: "", email: "", password: "", phone: [Phones(type: "mobile", number: 98)], address: Addresses(street: "", city: "", zip: 000000))
   
   @ObservedObject var model = SignUpFormModel()
   @State private var firstName: String = ""
   @State private var first = true
   @State private var lastName: String = ""
   @State private var lastNameColor = true
   @State private var phone = Phones(type: "", number: 0)
   @State private var phoneNumber : String = ""
   @State private var phoneColor = true
   @State private var addressStreet : String = ""
   @State private var addressStreetColor = true
   @State private var addressCity : String = ""
   @State private var addressCityColor = true
   @State private var addressZip : String = ""
   @State private var addressZipC0lor = true
   @State var passwordsValid = false
   @EnvironmentObject private var navigationStack : NavigationStack
    
    @State var acountes = [Data]()
    
    var body: some View {
        
        ZStack {
            BackgroundColorGradientView()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        self.navigationStack.pop()
                    }, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .padding(10)
                            .font(.system(size: 50))
                            .foregroundColor(Color(red: 155/256, green: 201/256, blue: 167/256))
                    })
                    
                    
                    HStack(alignment: .center) {
                        Spacer()
                    Text("Edit Profile")
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
                            myRectangle(heightRectangle: 550)
                           
                            VStack {
                                
                                HStack {

                                    Image(systemName: "person")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .leading)
                                        .foregroundColor(.gray)
                                        .padding()
                                    
 
                                    TextField("\(first ? accountDetils.firstName : "FristName" )" , text: $firstName)
                                    
                                        .foregroundColor( first ? .black : .gray)
                                        .textContentType(.name)
                                        .frame(height: 60, alignment: .leading)
                                       
                                    
                                }
                                .background(Color(red: 253/256, green: 202/256, blue: 206/256))
                                 
                                .cornerRadius(30)
                                .padding(5)

                                
                                HStack {
                                    
                                    Image(systemName: "person")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .leading)
                                        .foregroundColor(.gray)
                                        .padding()
                                    
                                    TextField("\(accountDetils.lastName)", text: $lastName)
                                        .frame(height: 60, alignment: .leading)
                                        .foregroundColor(lastNameColor ? .black : .gray)
                                    
                                    
                                }
                                .background(Color(red: 253/256, green: 202/256, blue: 206/256))
                                .cornerRadius(30)
                                .padding(5)
                                
                                
                                HStack {

                                    Image(systemName: "phone")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .leading)
                                        .foregroundColor(.gray)
                                        .padding()

                                    TextField("\(accountDetils.phone[0].number)", text: $phoneNumber)
                                        .frame(height: 60, alignment: .leading)
                                        .foregroundColor(phoneColor ? .black : .gray)
                                    
                                    
                                }
                                .background(Color(red: 253/256, green: 202/256, blue: 206/256))
                                .cornerRadius(30)
                                .padding(5)
                                
                                HStack {
                                    
                                    Image(systemName: "mappin.and.ellipse")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .leading)
                                        .foregroundColor(.gray)
                                        .padding()
                                    
                                    TextField("\(accountDetils.address.street)", text: $addressStreet)
                                        .frame(height: 60, alignment: .leading)
                                        .foregroundColor(addressStreetColor ? .black : .gray)
                                    
                                    
                                }
                                .background(Color(red: 253/256, green: 202/256, blue: 206/256))
                                .cornerRadius(30)
                                .padding(5)
                                
                                HStack {

                                    
                                    Image(systemName: "mappin.and.ellipse")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .leading)
                                        .foregroundColor(.gray)
                                        .padding()
                                    
                                    TextField("\(accountDetils.address.city)", text: $addressCity)
                                        .frame(height: 60, alignment: .leading)
                                        .foregroundColor(addressCityColor ? .black : .gray)
                                    
                                    
                                }
                                .background(Color(red: 253/256, green: 202/256, blue: 206/256))
                                .cornerRadius(30)
                                .padding(5)

                                HStack {

                                    
                                    Image(systemName: "number.circle.fill")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .leading)
                                        .foregroundColor(.gray)
                                        .padding()
                                    
                                    TextField("\(accountDetils.address.zip)", text: $addressZip)
                                        .frame(height: 60, alignment: .leading)
                                        .foregroundColor(addressZipC0lor ? .black : .gray)
                                    
                                    
                                }
                                .background(Color(red: 253/256, green: 202/256, blue: 206/256))
                                .cornerRadius(30)
                                .padding(5)

                                
                                HStack {
                                    
                                    Button(action: {

                                        
                                        editProfile()

                                        
                                    }) {
                                        HStack(alignment: .center){
                                            Spacer()
                                            Text("Edit Profile")
                                                .font(.system(size: 25))
                                                .foregroundColor(Color.white)
                                                .padding()
                                            Spacer()
                                        }

                                        
                                    }
                                        
                                    .background(Color.black)
                                    .cornerRadius(30)

                                }
                            }
                        
                                .onAppear {
                                    self.chake()
                                }
                            .padding(30)
                        }
                        
                    }
                }
            }
        }
    }
    
    func chake() {
       
        
        if accountDetils.firstName != "" {
             firstName = accountDetils.firstName
             first = true

         } else {
             firstName = "First Name"
            
             first = false

         }
        
        
        
        if accountDetils.lastName != "" {
            lastName = accountDetils.lastName
            lastNameColor = true
        } else {
            lastName = "Last Name"
            lastNameColor = false
        }
        
        
        
        if accountDetils.phone[0].number != 0 {
            phoneNumber = String(accountDetils.phone[0].number)
            phoneColor = true
        } else {
            phoneNumber = "+98"
            phoneColor = false
        }
        
        
        if accountDetils.address.street != "" {
            addressStreet = String(accountDetils.address.street)
            addressStreetColor = true
        } else {
            addressStreet = "Street"
            addressStreetColor = false
        }
        
        
        if accountDetils.address.city != "" {
            addressCity = String(accountDetils.address.city)
            addressCityColor = true
        } else {
            addressCity = "City"
            addressCityColor = false
        }
        
        if accountDetils.address.zip != 0 {
            addressZip = String(accountDetils.address.zip)
            addressZipC0lor = true
        } else {
            addressZip = "000000"
            addressZipC0lor = false
        }
        
    }
    
    func editProfile()  {

           
        do {
            
            let filename = getDirectory(fileNmae: "accounts.json")
            
            let jsonDataRead = try Data(contentsOf: filename)
            
            
            let decoder = JSONDecoder()
            
            let decoded = try decoder.decode([Accounts].self, from: jsonDataRead)
            
            let filterDecoded = decoded.filter{ $0.id != accountDetils.id}
            
            let jsonEncoder = JSONEncoder()
            let jsonDataEncoder = try jsonEncoder.encode(filterDecoded)
            let jsonString = String(data: jsonDataEncoder, encoding: .utf8)
            let removeFirst = jsonString!.dropFirst(1)
            let removeLast = removeFirst.dropLast(1)
            
            let updateUser = Accounts(id:accountDetils.id,firstName: firstName, lastName: lastName, email: accountDetils.email, password: accountDetils.password, phone: [Phones(type: "mobile", number: Int(phoneNumber)!)], address: Addresses(street: addressStreet, city: addressCity, zip: Int(addressZip)!))
            
            
            let updateUserEncoder = try jsonEncoder.encode(updateUser)
            let updateUserEncoderString = String(data: updateUserEncoder, encoding: .utf8)
            let jsonStringComa = "\(updateUserEncoderString!),\n"
            let test = "[\(jsonStringComa+removeLast)]"
            try test.write(to: filename, atomically: true, encoding: .utf8)
            
            
        } catch {
               
           }

           
       }
    
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
