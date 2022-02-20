//
//  SwiftUIView.swift
//  Sharkee
//
//  Created by Josef Teska on 03.02.2022.
//

import SwiftUI

import SwiftUI

struct SwiftUIView: View {

    @Binding var selection: String
    
    var swatches = [
      
      Color(red: 254 / 255, green: 244 / 255, blue: 97 / 255),
      Color(red: 1.0, green: 0.483, blue: 0.407),
      Color(red: 254 / 255, green: 151 / 255, blue: 97 / 255),
      Color(red: 104 / 255, green: 111 / 255, blue: 1),
      Color(red: 0.546, green: 0.381, blue: 0.999),
      Color(red: 0.555, green: 0.995, blue: 0.38)
    ]

      var body: some View {


          let columns = [
              GridItem(.adaptive(minimum: 60))
          ]

          LazyVGrid(columns: columns, spacing: 10) {
              ForEach(swatches, id: \.self){ swatch in
                  ZStack {
                      Circle()
                          .fill(Color(swatch))
                          .frame(width: 50, height: 50)
                          .onTapGesture(perform: {
                              selection = swatch
                          })
                          .padding(10)

                      if selection == swatch {
                          Circle()
                              .stroke(Color(swatch), lineWidth: 5)
                              .frame(width: 60, height: 60)
                      }
                  }
              }
          }
          .padding(10)
      }
  }



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(selection: .constant("swatch_shipcove"))
    }
}
