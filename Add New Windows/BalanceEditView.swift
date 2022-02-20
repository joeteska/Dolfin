//
//  BalanceEdit.swift
//  Thesis 1ST Prototype
//
//  Created by Josef Teska on 29.01.2022.
//

import SwiftUI
import UIKit

struct BalanceEditView: View {
    
    @State private var speed = 0.0
    @State private var speedGoals = 0.0
    @State private var isEditing = false
    @State var showSheetView = false
    @State private var MyBalance = 0
    @State var totalClicked: Int = 0




    var body: some View {
        
        VStack(alignment: .center, spacing: 15)  {
            
            
            HStack{
                

                
            Text("Your Balance")
                .fixedSize(horizontal: false, vertical: true)
                .font(Font.headline.weight(.bold))
                .foregroundColor(.white)
                .padding(.horizontal)

   
            }
            .frame(width: 308.0)

            
            HStack {
                
                Spacer()
                    .frame(width: 30)
                
                Button(action: {
                    self.totalClicked = self.totalClicked - 1}) {
                    Image(systemName: "minus")
                        .foregroundColor(.white)
                }

                
                
                
                TextField("", value: $totalClicked, format: .number)
                    .foregroundColor(.white)
                    .padding()
                    .keyboardType(.decimalPad)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 60))

                
                Button(action: {
                    self.totalClicked = self.totalClicked + 1}) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        
                }
                Spacer()
                    .frame(width:30)
               
                
            }
            
        }
        .frame(width: 308.0, height: 200)
        .padding([.leading, .trailing])
        .background(Color(red: 254 / 255, green: 151 / 255, blue: 97 / 255))
        .cornerRadius(15)

 
        
    }
}





struct BalanceEditView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceEditView()
    }
}


