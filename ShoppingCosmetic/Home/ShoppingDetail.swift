//
//  ShoppingDetail.swift
//  ShoppingCosmetic
//
//  Created by Habib Akbari on 1/19/21.
//

import SwiftUI
import NavigationStack


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundCorner(radius: radius, corners: corners))
    }
}
struct RoundCorner: Shape {
    
    var radius : CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    
}

struct backgroundProductDiteals:View {
    var body: some  View {
        Image("Limited_Edition_Rouge_Dior_Lip_Color_background_product_details")
                                   .resizable()
                                   .frame(height: 400)

    }
    
}


struct ShoppingDetail: View {
    
    let shoppingDetail : ProductsItems
    var categorySelected = ""
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var order: Order

    @State private var selectedColorProduct = 0
    @State private var imageProduct: Image?
    
    @State private var selectProduct00 = false
    @State private var selectProduct01 = false
    @State private var selectProduct02 = false
    
    @State private var shadowSelectProduct00 = false
    @State private var shadowSelectProduct01 = false
    @State private var shadowSelectProduct02 = false
    
    @State private var red : Float = 171
    @State private var green : Float = 14
    @State private var blue : Float = 41

    
    
    
    @State private var uintProduct = 1
    
    @EnvironmentObject private var navigationStack : NavigationStack
    
    var body: some View {
        
        
        ZStack {
            

            BackgroundColorGradientView()
            
            VStack{
               
                    shoppingDetail.imageBackground
                    .resizable()
                    .cornerRadius(40, corners: [.topLeft,.topRight])
                    .frame(height: 400)
                    .blur(radius: 45)
                
                Spacer()
            }
            
            VStack {
                
                Wave(graphWidt: 1.4, amplitude: 0.09,x: -89,y: 0.85)
                
            }

                .foregroundColor(Color(red: 251/256, green: 219/256, blue: 222/256))
                .opacity(0.2)
            
            VStack {
                Wave(graphWidt: 1.09, amplitude: 0.06,x: -75,y: 0.88)
                
            }

                .foregroundColor(Color(red: 251/256, green: 219/256, blue: 222/256))
                .opacity(0.2)
            
            VStack {
                Wave(graphWidt: 1.9, amplitude: 0.07,x: 49,y: 0.92)
            }

                .foregroundColor(Color(red: 251/256, green: 219/256, blue: 222/256))
                .opacity(0.2)
            
            
            //Spacer()
            VStack {
                
                VStack{
                    Spacer()
                    HStack {
                        
                        Button(action:{
                            self.navigationStack.pop()

                        }){
                            
                            Image(systemName: "chevron.left.circle.fill")
                                
                                .font(.system(size: 50))
                                .foregroundColor(Color(red: 155/256, green: 201/256, blue: 167/256))

                        }
                        .padding(.top,10)
                        Spacer()
                        Text("\(shoppingDetail.name)")
                            .font(.custom("Helvetica", size: 23))
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .frame(alignment: .topLeading)
                            .padding(.top,15)
                            
                        Spacer()
                    }

                    Spacer()
                    HStack{
                        
                        ScrollView(.vertical,showsIndicators: false) {
                            
                            
                            VStack {
                                
                                HStack(alignment:.center) {
                                    
                                    VStack(alignment:.center) {
                                        
                                        imageProduct?
                                            .resizable()
                                            .frame(width: 202, height: 300, alignment: .center)
                                        
                                        HStack {
                                            
                                            if categorySelected == "LIPSTICK" {
                                              
                                                
                                                HStack {
                                                    
                                                    Button(action:{
                                                        
                                                        selectedColorProduct = 0
                                                        selectedColorProductPublic = 0
                                                        
                                                        self.loadImageProduct()
                                                        
                                                    }) {
                                                        
                                                        Text("")
                                                            .frame(width: 30, height: 30, alignment: .center)
                                                            .background(Color(UIColor(red: CGFloat(Float(shoppingDetail.selectColorProduct.colorProduct00.red)!/256), green: CGFloat(Float(shoppingDetail.selectColorProduct.colorProduct00.green)!/256), blue: CGFloat(Float(shoppingDetail.selectColorProduct.colorProduct00.blue)!/256), alpha: 1)))
                                                            .clipShape(Circle())
                                                            .transition(.move(edge: .bottom))
                                                            .overlay(Circle().stroke(Color(selectProduct00 ? .white : .clear), lineWidth: 2))
                                                            .shadow(color: Color(shadowSelectProduct00 ? .white : .clear), radius: 5)
                                                        
                                                    }
                                                    
                                                    Button(action:{
                                                        selectedColorProduct = 1
                                                        selectedColorProductPublic = 1
                                                        
                                                        self.loadImageProduct()
                                                    }) {
                                                        Text("")
                                                            .frame(width: 30, height: 30, alignment: .center)
                                                            .background(Color(UIColor(red: CGFloat(Float(shoppingDetail.selectColorProduct.colorProduct01.red)!/256), green: CGFloat(Float(shoppingDetail.selectColorProduct.colorProduct01.green)!/256), blue: CGFloat(Float(shoppingDetail.selectColorProduct.colorProduct01.blue)!/256), alpha: 1)))
                                                            .clipShape(Circle())
                                                            .transition(.move(edge: .bottom))
                                                            .overlay(Circle().stroke(Color(selectProduct01 ? .white : .clear), lineWidth: 2))
                                                            //.shadow(radius: 5)
                                                            .shadow(color: Color(shadowSelectProduct01 ? .white : . clear), radius: 5)
                                                        
                                                    }
                                                    
                                                    Button(action:{
                                                        selectedColorProduct = 2
                                                        selectedColorProductPublic = 2
                                                        self.loadImageProduct()
                                                        
                                                    }) {
                                                        Text("")
                                                            .frame(width: 30, height: 30, alignment: .center)
                                                            .background(Color(UIColor(red: CGFloat(Float(shoppingDetail.selectColorProduct.colorProduct02.red)!/256), green: CGFloat(Float(shoppingDetail.selectColorProduct.colorProduct02.green)!/256), blue: CGFloat(Float(shoppingDetail.selectColorProduct.colorProduct02.blue)!/256), alpha: 1)))
                                                            .clipShape(Circle())
                                                            .transition(.move(edge: .bottom))
                                                            .overlay(Circle().stroke(Color(selectProduct02 ? .white : .clear), lineWidth: 2))
                                                            .shadow(color: Color(shadowSelectProduct02 ? .white : .clear), radius: 5)
                                                        
                                                    }
                                                }

                                            }
                                        }
                                        .padding(.bottom,5)
                                        

                                        
                                    }
                                    .onAppear(perform: loadImageProduct)
                                    
                                }

                                
                                HStack {
                                    Spacer()
                                   
                                       
                                Text("$ \(shoppingDetail.price)")
                                    .frame(height: 46)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(15)

                                    Spacer()

                                }
                                .background(Color.black.blur(radius: 45))
                                .clipShape(RoundedRectangle(cornerRadius: 15.0))

                                .padding(.bottom,1)
                                .padding(.horizontal,15)
                                
                                
                                
                                HStack {
                                    
                                    Button(action: {
                                        
                                        if self.uintProduct != 1 {
                                            self.uintProduct -= 1
                                        }
                                    }) {

                                        Image(systemName: "minus").font(.system(size: 20)).foregroundColor(Color.gray)
                                            .frame(width: 60, height: 50, alignment: .center)
                                            .background(Color(red: 255/256, green: 217/256, blue: 227/256))
                                            .padding(-8)
                                    }
                                    .accessibility(sortPriority: 1)
                                    
                                    Spacer()
                                    
                                    Text("\(uintProduct)")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color.gray)
                                        .frame(height: 50)
                                        .accessibility(sortPriority: 2)
                                    Spacer()
                                    
                                    
                                    
                                    Button(action: {
                                        if self.uintProduct != 10 {
                                            self.uintProduct += 1
                                        }
                                    }) {
                                        
                                        Image(systemName: "plus").font(.system(size: 20)).foregroundColor(Color.gray)
                                            .frame(width: 60, height: 50, alignment: .center)
                                            .background(Color(red: 255/256, green: 217/256, blue: 227/256))
                                            .padding(-8)
                                    }
                                    
                                }
                                    
                                .background(Color(red: 255/256, green: 231/256, blue: 224/256))
                                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                                .overlay(RoundedRectangle(cornerRadius: 15.0).stroke(Color.gray, lineWidth: 1.5))
                                .accessibilityElement(children: .contain)
                                .offset(x: 0, y: 0)
                                .padding(.horizontal,15)
                                
                                Button(action: {
                                    

                                    
                                    
                                    if self.order.selectedProductsItems.count > 0 {
                                        
                                        
                                        if self.checkOrder() != true {
                                            self.addToOrder()
                                           
                                        } else {
                                            self.navigationStack.pop()
                                        }
                                        
                                    } else {
                                       
                                        self.addToOrder()
                                      
                                    }
                                    
                                }, label: {
                                    Spacer()
                                    HStack{
                                        Text("Add to cart")
                                            .font(.system(size: 15))
                                            .foregroundColor(Color.white)
                                        
                                    }
                                    .padding()
                                    Spacer()
                                })
                                    
                                    .background(Color("backgroundColorAddCart"))
                                    .cornerRadius(15)
                                .padding(.horizontal,15)
                                
                                
                                
                                
                                
                                Text("\(shoppingDetail.description)")
                                    .foregroundColor(Color("ironColor"))
                                    .font(.custom("Helvetica", size: 20))
                                    .padding()
                                    .multilineTextAlignment(.leading)
                                

                            }
                            
                            
                        }
                    }
                }
            }
            
            
        }

        .frame(minWidth: 0,  maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)

        
    }
    
    func checkOrder() -> Bool {
        var reternCheckOrder = false
        
        for index in 0...self.order.selectedProductsItems.count-1 {
            if self.order.selectedProductsItems[index].items[0].id == self.shoppingDetail.id {
                reternCheckOrder = true
                return reternCheckOrder
            } else {
                reternCheckOrder = false

            }
        }
        return reternCheckOrder
    }
    
    func addToOrder() {
        order.add(item: SelectedProductsItems(items: self.shoppingDetail, count: self.uintProduct,categorySelected: categorySelected,selctedImagesProductNumber: selectedColorProductPublic))
        navigationStack.pop()
        
    }
    
    func loadImageProduct() {
      
        
        switch selectedColorProduct {
            
        case 0 :
            imageProduct = shoppingDetail.image00
            selectProduct00 = true
            selectProduct01 = false
            selectProduct02 = false
            
            shadowSelectProduct00 = true
            shadowSelectProduct01 = false
            shadowSelectProduct02 = false
            
        case 1 :
            imageProduct = shoppingDetail.image01
            selectProduct00 = false
            selectProduct01 = true
            selectProduct02 = false
            
            shadowSelectProduct00 = false
            shadowSelectProduct01 = true
            shadowSelectProduct02 = false
            
        case 2 :
            imageProduct = shoppingDetail.image02
            selectProduct00 = false
            selectProduct01 = false
            selectProduct02 = true
            
            shadowSelectProduct00 = false
            shadowSelectProduct01 = false
            shadowSelectProduct02 = true
            
        default:
            imageProduct = shoppingDetail.image00
            selectProduct00 = true
            selectProduct01 = false
            selectProduct02 = false
            
            shadowSelectProduct00 = true
            shadowSelectProduct01 = false
            shadowSelectProduct02 = false
            
        }
    }
    
    func sleectColoe() {
        
        self.red = Float(shoppingDetail.selectColorProduct.colorProduct00.red)!
        self.green = Float(shoppingDetail.selectColorProduct.colorProduct00.green)!
        self.blue = Float(shoppingDetail.selectColorProduct.colorProduct00.blue)!
    }
}
