//
//  ItemsView.swift
//  Sharkee
//
//  Created by Josef Teska on 01.02.2022.
//

import SwiftUI




struct ItemsView: View {
    
    @State var listItems: [Item] = []
    @State var addItemName: String = ""
    @State var colorSelection: UIColor = UIColor.systemRed
    @State var addItem = false
    @State var addEmoji: String = "💻"
    @State var addBalance = 0
    @State var selection: String = "swatch_shipcove"
    @State var isEmpty = true


    @State var colorDesign = [
    
        Color(red: 254 / 255, green: 244 / 255, blue: 97 / 255),
        Color(red: 1.0, green: 0.483, blue: 0.407),
        Color(red: 254 / 255, green: 151 / 255, blue: 97 / 255),
        Color(red: 104 / 255, green: 111 / 255, blue: 1),
        Color(red: 0.546, green: 0.381, blue: 0.999),
        Color(red: 0.555, green: 0.995, blue: 0.38)
                        
    ]



    var body: some View {
        
        
                 

            NavigationView {
                                
                ScrollView{
                    
                    Spacer()
                        .frame(height:60)
                    
                    
                    VStack {
                        
                    
                        ForEach(listItems, id: \.self) { item in
                                    
                            HStack{
                                        
                                VStack(alignment: .leading, spacing: 15){
                                    Text(item.name)
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)                  .font(Font.custom("Poppins-SemiBold", size: 25))

                                HStack{
                                        
                                    Text("$")
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                                    .font(Font.custom("Poppins-SemiBold", size: 25))

                                    Text("\(item.balance)")
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                                    .font(Font.custom("Poppins-SemiBold", size: 25))

                                        
                                    }
                                    
                                    
                                }

                                
                                .padding(.all, 20)
                                    Spacer()
                                    
                                    ZStack{
                                        
                                    Circle()
                                    .foregroundColor(.white)
                                    .frame(width: 90, height: 90)

                                    Text(item.emoji)
                                    .multilineTextAlignment(.trailing)
                                    .frame(width: 100, height: 100)
                                    .font(.system(size: 40))

                                        }
                                    .padding(.all)
                                        
                                    }
                                    .frame(height: 150)
                                    .background(Color(item.color))
                                    .cornerRadius(20)
                                    .padding([.leading, .bottom, .trailing])
                            
                                   
                        }
                        
                       
                        
                        
                        .font(Font.custom("Poppins-SemiBold", size: 25))
                    
                        
                    }
                    
                    

                    .font(Font.custom("Poppins-SemiBold", size: 25))

                                .navigationBarTitle(Text("List Items"))
                                // Adds the plus button to our navbar
                                .navigationBarItems(trailing:
                                    Button(action: {
                                        // toggles the value of our bool from false to true,
                                        // which will present our sheet.
                                        self.addItem.toggle()
                                    }, label: {
                                        Image(systemName: "plus")
                                    })
                                                    
                                                        

                            )
                    

                        // This is our secondary view that'll take in our user's input.
                        // Is presented when addItem is set to true.
                }
                            
                        }.sheet(isPresented: $addItem) {
                           
                            ZStack {
                                Color(red: 1.0, green: 0.483, blue: 0.407) .edgesIgnoringSafeArea(.all)

                            VStack {
                                Spacer()
                                    .frame(height: 30)

                                
                                
                                VStack(alignment: .leading){
                                
                                Text("Add your goal ")
                                        .font(.system(size: 30))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 1.0, green: 0.483, blue: 0.407))
                                    
                                Spacer()
                                        .frame(height:30)

                                Text("Choose your Emoji: ")
                                        .font(.system(size: 17))
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                    
                                
                                Picker("Emoji", selection: self.$addEmoji) {
                         
                                    Text("💻").tag("💻")
                                    Text("🗑").tag("🗑")
                                    Text("📰").tag("📰")
                                  
                                  
                                   
      
                                }
                                .pickerStyle(SegmentedPickerStyle())
                                .frame(width: 300)
                                .padding(.top)
                                
                                }
                                
                                Spacer()
                                    .frame(height: 40)
      
                                VStack(alignment: .leading) {
                                    Text("Define your goal: ")
                                        .font(.system(size: 17))
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                    TextField("add here", text: self.$addItemName)
                                        .padding(.all)
                                        .frame(width: 290, height: 50)
                                        .background(.white)
                                        .foregroundColor(.gray)
                                        .cornerRadius(10)
                                        .shadow(color: Color.black.opacity(0.03),radius: 3, x: 0, y: 3)
                                }
                                
                                Spacer()
                                    .frame(height: 40)
                                
                                
                                VStack(alignment: .leading, spacing: 15) {
                                    Text("Add your goal: ")
                                        .font(.system(size: 17))
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
             

                                        TextField("Goal", value: self.$addBalance, format: .number)
                                        .padding(.all)
                                        .font(.system(size: 30))
                                        .frame(width: 290, height: 50)
                                        .background(.white)
                                        .foregroundColor(.gray)
                                        .cornerRadius(10)
                                        .keyboardType(.numberPad)
                     
                                }

                                // A simple picker that gives our user some different selections of color.
                                Picker(selection: self.$colorSelection, label: Text("Select a Color")) {
                                    Text("🔴").tag(UIColor.systemRed)
                                    Text("🔵").tag(UIColor.systemBlue)
                                    Text("🟢").tag(UIColor.systemGreen)
                                    Text("🟣").tag(UIColor.systemPurple)

                                }

                                .pickerStyle(SegmentedPickerStyle())
                                .frame(width: 290)
                                .background(.white)
                                // Button that will submit our data to the list and reset our user selected
                                // variables for when then add another item.
                            Spacer()
                                .frame(height: 30)
                                
                                                                    
                                

                                Button(action: {
                                    self.listItems.append(Item(name: self.addItemName, color: self.colorSelection, emoji: self.addEmoji, balance: self.addBalance))

                                    // This will close our sheet view when the user click our Add button.
                                    self.addItem.toggle()

                                    // Reset Values
                                    self.addItemName = ""
                                    self.colorSelection = UIColor.systemRed
                                    self.addEmoji = "💻"
                                    self.addBalance = 0
                                }, label: {
                                    Text("create goal")
                                        .frame(width: 290, height: 45, alignment: .center)
                                        .background(Color(red: 1.0, green: 0.483, blue: 0.407))
                                        .foregroundColor(.white)
                                        .font(.headline)
                                        .cornerRadius(15)
                                        .padding(.bottom, 30)
                                })
                                
                                HStack{
                                
                                ForEach(self.colorDesign, id: \.self) { colorDesign in
                                    
                                    Circle()
                                        .foregroundColor(colorDesign)
                                        .frame(width: 42, height: 35)
                            }
                                    
                        }
                                .padding(.bottom)
                                
                                
                                
                            }
                                
                            .padding(.all, 25)
                            .background(.white)
                            .cornerRadius(20)
                            .frame(height:290)
                            .shadow(radius: 20)

   
                    
                    }

                    }
                        .font(Font.custom("Poppins", size: 15))


        }


    }


struct Item: Hashable {
    let name: String
    let color: UIColor
    let emoji: String
    let balance: Int

}


struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()

    }
}
