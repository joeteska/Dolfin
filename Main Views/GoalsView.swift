//
//  GoalsView.swift
//  Thesis 1ST Prototype
//
//  Created by Josef Teska on 01.01.2022.
//


import SwiftUI



struct GoalsView : View {
    
    @State private var selectedColorIndex = 0
    @State var showSheetView = false
    @State var listGoals = [Goal]()
    @State var addGoalName: String = "goal name"
    @State var colorSelection: UIColor = UIColor(Color(red: 0.997, green: 0.383, blue: 0.405))
    @State var addGoal = false
    @State var addEmoji: String = "🚀"
    @State var myColor =   Color(red: 0.997, green: 0.383, blue: 0.405) //tint color
    @State private var goalBudget: String = "1"
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
            
            if (listGoals.isEmpty){
                
                Text("🚀")
                    .font(.system(size: 60))
                    .opacity(0.3)
                Spacer()
                    .frame(height: 10)
                Text("No Active Goals")
                    .font(.system(size: 22))
                    .foregroundColor(.gray)
                    .opacity(0.3)
                Text("Create a Goal by clicking the + button at the top of the screen")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .opacity(0.3)
                    .padding(.vertical, 1.0)
                    .padding(.horizontal, 80)
                
            }
            
            else{
            
                List {
    
                        ForEach(listGoals, id: \.self) { goal in
                       
                        
                        HStack {

                VStack{
                    Text(goal.name)
                            .foregroundColor(.white)
                            .font(Font.custom("Poppins", size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)

                            Spacer()
                            .frame(height: 20)
                            
                    HStack{
                            Text("$")
                            .foregroundColor(.white)
                            .font(Font.custom("Poppins", size: 20))
                            Text(goal.budget)
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
                            
                            Text(goal.emoji)
                                .font(.system(size: 45))


                                }
                            .padding()

                            
                            
                            }
                            .frame(height: 160)
                            .background(Color(goal.color))
                            .cornerRadius(20)
                            .listRowSeparator(.hidden)
                            .padding(.top)

                       
                        }
                        .onMove { (indexSet, index) in
                            self.listGoals.move(fromOffsets: indexSet, toOffset: index)
                        }
                        .onDelete(perform: self.deleteItem)
                        
                    }
                .listStyle(PlainListStyle())
            }
        }
        
        .navigationBarTitle(Text("Goals 🚀"))
        .navigationBarItems(trailing:
            Button(action: {
                self.addGoal.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
        .navigationBarItems(trailing: EditButton())
        .accentColor(myColor)

        
        }
    
    
    
                      .sheet(isPresented: $addGoal) {
          
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
                                  TextField("name", text: self.$addGoalName.max(20))
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

                                  TextField("0", text: self.$goalBudget.max(4))
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
                                  self.listGoals.append(Goal(name: self.addGoalName, color: self.colorSelection, emoji: self.addEmoji, budget: self.goalBudget))

                                  // This will close our sheet view when the user click our Add button.
                                  self.addGoal.toggle()

                                  // Reset Values
                                  self.addGoalName = "empty"
                                  self.colorSelection = UIColor(Color(red: 0.997, green: 0.383, blue: 0.405))
                                  self.addEmoji = "🚀"
                                  self.goalBudget = "0"
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
          self.listGoals.remove(atOffsets: indexSet)
      }
      
  }
           

  struct Goal: Hashable {
      let name: String
      let color: UIColor
      let emoji: String
      let budget: String
  }

      


   

struct GoalsView_Preview: PreviewProvider {
    static var previews: some View {
        GoalsView()
            .previewDevice("iPhone 13 Pro")
    }
}
