//
//  VaultsView.swift
//  Thesis 1ST Prototype
//
//  Created by Josef Teska on 01.01.2022.
//

import SwiftUI



struct VaultsView : View {
    

            @State var listVaults = [Vault]()
            @State var addVaultName: String = "empty"
            @State var colorSelection: UIColor = UIColor(Color(red: 0.293, green: 0.771, blue: 1.006))
            @State var addVault = false
            @State var addEmoji: String = "✈️"
            @State var myColor = Color(red: 0.293, green: 0.771, blue: 1.006) //tint color
            @State private var vaultBudget: String = "1"
            @State var isEmpty = false

    
           let MyColors = [ Color(red: 0.293, green: 0.771, blue: 1.006),
                            Color(red: 0.997, green: 0.383, blue: 0.405),
                            Color(red: 0.555, green: 0.995, blue: 0.38),
                            Color(red: 0.997, green: 0.592, blue: 0.378),
                            Color(red: 0.546, green: 0.381, blue: 0.995),
                            Color(red: 0.381, green: 0.441, blue: 0.995)]

            
    var body: some View {
       
        

        NavigationView {
            
            VStack {
                
                if (listVaults.isEmpty) {
                    
                    Text("💸")
                        .font(.system(size: 60))
                        .opacity(0.3)
                    Spacer()
                        .frame(height: 10)
                    Text("No Active Vaults")
                        .font(.system(size: 22))
                        .foregroundColor(.gray)
                        .opacity(0.3)
                    Text("Add a Vault by clicking the + button at the top of the screen")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .opacity(0.3)
                        .padding(.vertical, 1.0)
                        .padding(.horizontal, 80)
                    
                    
                }
               
                else{
                    
                    List {
                           
        
                            ForEach(listVaults, id: \.self) { vault in
                           
                            
                            HStack {

                    VStack{
                        Text(vault.name)
                                .foregroundColor(.white)
                                .font(Font.custom("Poppins", size: 20))
                                .frame(maxWidth: .infinity, alignment: .leading)

                                Spacer()
                                .frame(height: 20)
                                
                        HStack{
                                Text("$")
                                .foregroundColor(.white)
                                .font(Font.custom("Poppins", size: 20))
                                Text(vault.budget)
                                .foregroundColor(.white)
                                .font(Font.custom("Poppins", size: 20))
                                    }

                                .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                
                                .padding()
                                
                                Spacer()
                                
                                ZStack{
                                Circle()
                                .foregroundColor(.white)
                                .frame(width: 100, height: 100)
                                .shadow(radius: 2)
                                
                                Text(vault.emoji)
                                    .font(.system(size: 45))


                                    }
                                .padding()

                                
                                
                                }
                                .frame(height: 160)
                                .background(Color(vault.color))
                                .cornerRadius(20)
                                .listRowSeparator(.hidden)
                                .padding(.top)

                           
                            }
                            .onMove { (indexSet, index) in
                                self.listVaults.move(fromOffsets: indexSet, toOffset: index)
                            }
                            .onDelete(perform: self.deleteItem)
                            
                        }
                    .listStyle(PlainListStyle())

                    
                }
          
            }
            
            .navigationBarTitle(Text("Vaults 💸"))
            .navigationBarItems(trailing:
                Button(action: {
                    self.addVault.toggle()
                }, label: {
                    Image(systemName: "plus")
                }))
            .navigationBarItems(trailing: EditButton())
            .accentColor(myColor)

            
            }

        
  
                    .sheet(isPresented: $addVault) {
        
                        ZStack{
                        
                            VStack {
                                
                                Text("Chose an Emoji")
                                .foregroundColor(.gray)
                                TextField("+", text: self.$addEmoji.max(1))
                                .font(.system(size: 70))
                                .multilineTextAlignment(.center)

                        
                                .padding()
                             
                                Text("Vault Name: ")
                                .foregroundColor(.gray)
                                TextField("name", text: self.$addVaultName.max(20))
                                .foregroundColor(Color(colorSelection))
                                .font(.system(size: 30))
                                .frame(width: 300)

                                .multilineTextAlignment(.center)
                                .padding()
                                
                                Text("Vault Budget: ")
                                .foregroundColor(.gray)
                                HStack{
                                
                                Text("$")
                                .font(.system(size: 30))
                                .foregroundColor(Color(colorSelection))

                                TextField("0", text: self.$vaultBudget.max(4))
                                .foregroundColor(Color(colorSelection))
                                .font(.system(size: 30))
                                .keyboardType(.numbersAndPunctuation)

                                .multilineTextAlignment(.center)
                                .padding()
                                }
                        
                                ZStack{
                                    
                                    HStack{
                                        
                                        ForEach(MyColors, id: \.self) { MyColors in
                                            Spacer()
                                            Circle()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(MyColors)
                                            Spacer()
                                        }
                          
                                    }
                                    .frame(width: 300)

                                    
                                    
                                                            
                            Picker(selection: self.$colorSelection, label: Text("Select a Color")) {
                                Text("").tag(UIColor(Color(red: 0.293, green: 0.771, blue: 1.006)))
                                Text("").tag(UIColor(Color(red: 0.997, green: 0.383, blue: 0.405)))
                                Text("").tag(UIColor(Color(red: 0.555, green: 0.995, blue: 0.38)))
                                Text("").tag(UIColor(Color(red: 0.997, green: 0.592, blue: 0.378)))
                                Text("").tag(UIColor(Color(red: 0.546, green: 0.381, blue: 0.995)))
                                Text("").tag(UIColor(Color(red: 0.381, green: 0.441, blue: 0.995)))
                                

                            }

                            .frame(width: 300)
                            .opacity(0.02)
                            .pickerStyle(SegmentedPickerStyle())
                                
                           
                                
                                }

                            Spacer()
                            .frame(height: 30)
                            
                            // Button that will submit our data to the list and reset our user selected
                            // variables for when then add another item.
                            Button(action: {
                                self.listVaults.append(Vault(name: self.addVaultName, color: self.colorSelection, emoji: self.addEmoji, budget: self.vaultBudget))

                                // This will close our sheet view when the user click our Add button.
                                self.addVault.toggle()

                                // Reset Values
                                self.addVaultName = "empty"
                                self.colorSelection = UIColor(Color(red: 0.293, green: 0.771, blue: 1.006))
                                self.addEmoji = "✈️"
                                self.vaultBudget = "0"
                            }, label: {
                                Text("Create a Vault")
                                    .fontWeight(.bold)
                                    .padding()
                                    .frame(width: 250, height: 50)
                                    .background(Color(colorSelection))
                                    .cornerRadius(15)
                                    .foregroundColor(.white)
                                    .font(.system(size: 17))
                                
                                
                            })
                            

                            
                        }.padding(100)
                                
                                .frame(width: 350, height: 600)
                                .background(.white)
                                .cornerRadius(15)
                                .shadow(radius: 25)
                            
                        
                            
                        }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color(colorSelection))
                        
                    }
        
                    .font(Font.custom("Poppins", size: 15))

    }
        
    
    private func deleteItem(at indexSet: IndexSet) {
        self.listVaults.remove(atOffsets: indexSet)
    }
    
}
         

struct Vault: Hashable {
    let name: String
    let color: UIColor
    let emoji: String
    let budget: String
}




struct VaultsView_Preview: PreviewProvider {
    static var previews: some View {
        VaultsView()
            .previewDevice("iPhone 13 Pro")
    }
}
