//
//  OrderView.swift
//  ShoppingCosmetic
//
//  Created by Habib Akbari on 1/19/21.
//

import SwiftUI
import NavigationStack

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    @State private var showingAlert = false
    var category = ""
    
    var body: some View {

        NavigationStackView(transitionType: .default,easing: .easeOut(duration: 0.30)) {
       
           ZStack {
               
               BackgroundColorGradientView()
               
               ScrollView(.vertical,showsIndicators: false) {
                   
                   VStack {
                       
                       HStack {
                           
                           VStack(alignment: .leading, spacing: 0) {
                               
                               Text("My")
                                   .font(.system(size: 20, weight: .medium, design: .default))
                                   .foregroundColor(Color("colorTabBar"))
                               Text("Order")
                                   .font(.system(size: 30, weight: .bold, design: .default))
                                .foregroundColor(.black)
                               
                           }
                           .padding(25)
                           
                           
                           Spacer()
                           
                           
                        VStack(alignment: .trailing) {
                            
                            Text("\(order.selectedProductsItems.count)")
                                .font(.system(size: 20, weight: .medium, design: .default))
                                .foregroundColor(Color("colorTabBar"))
                            
                            
                            Text("$ \(order.total)")
                                .font(.system(size: 30, weight: .bold, design: .default))
                                .foregroundColor(.black)
                            
                        }
                           .padding(25)
                           
                           
                           HStack{
                               
                               Button(action: {

                                   self.showingAlert = true
                                
                               }) {
                                
                                   Image(systemName: "trash")
                                       .resizable()
                                       .frame(width: 27, height: 32, alignment: .trailing)
                                    .foregroundColor(Color("colorTabBar"))

                                   
                                   
                               } .alert(isPresented: $showingAlert) {
                                   Alert(title: Text("Are you sure you want to dalete this?"), message: Text("There is no undo"), primaryButton: .destructive(Text("Delete")){
                                       self.order.removeAll()
                                       }, secondaryButton: .cancel())
                               }
                               
                           }.padding(.trailing, 20)
                       }
                       
                       
                   }
                   
                   

                   ZStack {
                       
                    myRectangle(heightRectangle: 470)

                       
                       VStack{
                           
                           if self.order.selectedProductsItems.count > 0 {
                               
                               List {
                                   
                                   ForEach(self.order.selectedProductsItems.indices, id: \.self) { index in
                                       
                                       HStack {
                                           
                                           if  self.order.selectedProductsItems[index].category == "LIPSTICK" {
                                               
                                               VStack{

                                               if self.order.selectedProductsItems[index].selctedImagesProductNumber == 0 {
                                                   
                                                   self.order.selectedProductsItems[index].items[0].image00
                                                  .resizable()
                                                   
                                               } else if self.order.selectedProductsItems[index].selctedImagesProductNumber == 1 {
                                                   
                                                   self.order.selectedProductsItems[index].items[0].image01
                                                   .resizable()

                                                   
                                               } else {
                                                   
                                                   self.order.selectedProductsItems[index].items[0].image02
                                                   .resizable()

                                               }
                                               }
                                                    
                                               .aspectRatio(contentMode: .fill)
                                           .frame(width: 80, height: 140)
                                               .shadow(color: Color.black.opacity(0.3), radius: 13, x: 18, y: 3)
                                               
                                               
                                           } else {
                                               
                                               self.order.selectedProductsItems[index].items[0].image00
                                                   .resizable()
                                                   .frame(width: 80, height: 140)
                                                   .shadow(color: Color.black.opacity(0.3),
                                                           radius: 13,
                                                           x: 18,
                                                           y: 3)
                                           }

                                           
                                           VStack(alignment: .leading) {
                                               
                                               HStack {
                                                   VStack(alignment: .leading) {
                                                       
                                                       
                                                       Text("\(self.order.selectedProductsItems[index].items[0].name)")
                                                           .lineLimit(2)
                                                           .font(.system(size: 20, weight: .bold))
                                                           .foregroundColor(Color(red: 57/256, green: 54/256, blue: 65/256))
                                                           .padding(EdgeInsets(top:0, leading: 5, bottom: 0, trailing: 0))
                                                       
                                                       Text("$ \(self.order.selectedProductsItems[index].items[0].price)")
                                                           .font(.system(size: 15, weight: .bold))
                                                           .foregroundColor(Color(red: 147/256, green: 143/256, blue: 144/256))
                                                           .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 0))
                                                       
                                                       
                                                       Text("$ \(self.order.selectedProductsItems[index].items[0].price * self.order.selectedProductsItems[index].countItem)")
                                                           .font(.system(size: 25, weight: .bold))
                                                           .foregroundColor(Color(red: 224/256, green: 145/256, blue: 127/256))
                                                           .padding(EdgeInsets(top: 5, leading: 5, bottom: 2, trailing: 0))
                                                   }
                                                   
                                                   
                                                   Spacer()
                                                   
                                                   
                                                   VStack {
                                                       
                                                       Button(action: {
                                                           
                                                           if self.order.selectedProductsItems[index].countItem >= 1 {
                                                               self.order.selectedProductsItems[index].countItem += 1
                                                           }
                                                           
                                                       }){
                                                           Text("+")
                                                               .foregroundColor(Color(red: 115/256, green: 112/256, blue: 119/256))
                                                               .font(.system(size: 30))
                                                               .frame(width: 80, height: 70, alignment: .center)
                                                               .background(Color(red: 241/256, green: 237/256, blue: 234/256))
                                                               .padding(-8)
                                                       }
                                                       
                                                       
                                                       Text("\(self.order.selectedProductsItems[index].countItem)")
                                                           .font(.system(size: 30))
                                                           .foregroundColor(.black)
                                                           .frame(width: 80, height: 50, alignment: .top)
                                                           .background(Color(red: 241/256, green: 237/256, blue: 234/256))
                                                           .accessibility(sortPriority: 2)
                                                       
                                                       
                                                       Button(action: {
                                                           
                                                           if self.order.selectedProductsItems[index].countItem > 1 {
                                                               self.order.selectedProductsItems[index].countItem -= 1
                                                           }
                                                           
                                                       }) {
                                                        
                                                           Text("-")
                                                               .foregroundColor(Color(red: 115/256, green: 112/256, blue: 119/256))
                                                               .font(.system(size: 30))
                                                               .frame(width: 80, height: 60, alignment: .top)
                                                               .background(Color(red: 241/256, green: 237/256, blue: 234/256))
                                                               .padding(-8)
                                                        
                                                       }
                                                   }
                                                       
                                                   .clipShape(RoundedRectangle(cornerRadius: 18.0))
                                               }
                                               .cornerRadius(15)
                                               
                                           }
                                               
                                           .frame( height: 145, alignment: .leading)
                                           .background(Color(red: 247/256, green: 246/256, blue: 244/256))
                                           .cornerRadius(15)
                                           
                                           
                                       }
                                       .cornerRadius(18)
                                       .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                                       .listRowBackground(LinearGradient(gradient: Gradient(colors: [ Color(red: 250/256, green: 108/256, blue: 92/256),Color(red: 250/256, green: 87/256, blue: 115/256)]), startPoint: .topTrailing, endPoint: .bottomLeading))
                                       
                                   }
                                   .onDelete(perform: self.order.remove)
                                   .buttonStyle(BorderlessButtonStyle())
                                   
                               }
                                   
                                   
                                   .cornerRadius(40)
                                   .padding(10)
                                   .onAppear{
                                       UITableView.appearance().separatorStyle = .none
                                       UITableView.appearance().backgroundColor = UIColor.clear
                               }
                               
                               
                           } else {
                               Text("Not Item Selected")
                           }
                           
                           
                       }
                   
                       
                   }
                   
                   Spacer()

                   
               }


              
           }
           
       }
       
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
