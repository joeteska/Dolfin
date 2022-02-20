//
//  EachGoalView.swift
//  Thesis 1ST Prototype
//
//  Created by Josef Teska on 12.01.2022.
//

import SwiftUI

struct NewGoalView: View {
    
    @State private var UserName: String = "Name"
    @State private var userBudget: String = "$200"
    @State var showSheetView = false
    @Environment(\.dismiss) var dismiss


    
    var items = [
        
        Color(red: 254 / 255, green: 244 / 255, blue: 97 / 255),
        Color(red: 1.0, green: 0.483, blue: 0.407),
        Color(red: 254 / 255, green: 151 / 255, blue: 97 / 255),
        Color(red: 104 / 255, green: 111 / 255, blue: 1),
        Color(red: 0.546, green: 0.381, blue: 0.999),
        Color(red: 0.555, green: 0.995, blue: 0.38)
                        
    ]

    var body: some View {
        

       
        NavigationView {
        
            
        ZStack {
            
            Color(red: 1.0, green: 0.483, blue: 0.407) .edgesIgnoringSafeArea(.all)
            

               
            
            
            
            VStack(alignment: .leading) {
               
                
                Group {
                    
                
                    
                Text("Choose an emoji")
                Text("🚴")
                    .font(.system(size: 70))
                    .frame(width: 80, height: 80)
                Text("Goal name")
                TextField("Name", text: $UserName)
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                    .background(.white)
                    .foregroundColor(.gray)
                
                Text("Choose a budget")
                TextField("$300", text: $userBudget)
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                    .background(.white)
                    .foregroundColor(.gray)
                        
                Text("Choose a color")
       
                    
                HStack {
                    
                        ForEach(self.items, id: \.self) { item in
                            // 3.
                            Circle()
                            .fill(item)
                            .frame(width: 30, height:
                                40)
                        }
                    }

                
                
                Button (action: {
                    print("Continue Button Works")
                    
                }) {
                    
                    Text("Create Goal")
                        .frame(width: 275, height: 45)
                        .background(Color(red: 1.0, green: 0.483, blue: 0.407))
                        .foregroundColor(.white)
                        .font(Font.custom("Poppins", size: 18))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1),radius: 5, x: 0, y: 10)

                    
                    }
                .padding(.top)
                }
            
            }
            .frame(width: 280, height: 450)
            .padding(.all, 35)
            .background(Color.white)
            .cornerRadius(30)

   
            }
        .shadow(radius: 20)
        .navigationTitle("Add a new goal")
        .font(Font.custom("Poppins", size: 15))
        .foregroundColor(.gray)
        .toolbar {
                   
            ToolbarItem(placement: .navigationBarTrailing){
            
 
                Button(action: {
                    dismiss()
                }) {
                
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                }
                
                .frame(width: 10, height: 10)
                .padding()
                }
            }
        
          

        
              

        }
        
    }
}



struct NewGoalView_Previews: PreviewProvider {
    static var previews: some View {
        NewGoalView()
    }
}
