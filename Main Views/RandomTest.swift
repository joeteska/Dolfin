//
//  RandomTest.swift
//  Dolfin
//
//  Created by Josef Teska on 09.02.2022.
//

import SwiftUI

struct RandomTest: View {
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Vault Name: ")
                TextField("Add a Vault", text: self.$addVaultName)
            }
            // A simple picker that gives our user some different selections of color.
            Picker(selection: self.$colorSelection, label: Text("Select a Color")) {
                Text("Red").tag(UIColor.systemRed)
                Text("Blue").tag(UIColor.systemBlue)
                Text("Green").tag(UIColor.systemGreen)
                Text("Yellow").tag(UIColor.systemYellow)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            // Button that will submit our data to the list and reset our user selected
            // variables for when then add another item.
            Button(action: {
                self.listVaults.append(Vault(name: self.addVaultName, color: self.colorSelection))

                // This will close our sheet view when the user click our Add button.
                self.addVault.toggle()

                // Reset Values
                self.addVaultName = ""
                self.colorSelection = UIColor.systemRed
            }, label: {
                Text("Add")
            })
        }.padding(100)
    }
    }


struct RandomTest_Previews: PreviewProvider {
    static var previews: some View {
        RandomTest()
    }
}
