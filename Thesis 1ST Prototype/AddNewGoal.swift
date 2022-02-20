//
//  AddNewGoal.swift
//  Thesis 1ST Prototype
//
//  Created by Josef Teska on 12.01.2022.
//

import SwiftUI

struct AddNewGoal: View {
    var body: some View {
        
        NavigationView {
            
            
            ScrollView {
                
                Spacer()

                
                VStack {
                    
                    Text("Playstation 5")
                        .foregroundColor(.gray)
                        .font(.title)
                        .padding([.top, .leading, .bottom], 10.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Text("Cost: ")
                        .foregroundColor(.gray)
                        .font(.title)
                        .padding([.top, .leading, .bottom], 30.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("$300")
                        .foregroundColor(.gray)
                        .font(.title)
                        .padding([.leading, .bottom], 30.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading) {

                     Image("mop")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    

                }
                    
                        

                }
                .padding(.all)

            }
            .navigationTitle("Add a New Goal")

        }
    
    }

}

struct AddNewGoal_Previews: PreviewProvider {
    static var previews: some View {
        AddNewGoal()
    }
}
