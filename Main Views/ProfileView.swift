//
//  ProfileView.swift
//  Thesis 1ST Prototype
//
//  Created by Josef Teska on 01.01.2022.
//


import SwiftUI




struct ProfileView : View {
    
    
    @State private var speed = 0.0
    @State private var speedGoals = 0.0
    @State private var isEditing = false
    @State var showSheetView = false
    @State private var MyBalance = 0
    @State var totalClicked: Int = 0
    
    
    var body: some View {
        
    NavigationView {
        
        
        ScrollView(.vertical, showsIndicators: false) {
            
            Spacer()
            .padding(.vertical)
               
        //Balance
        VStack(alignment: .leading) {



        HStack {
                Text("Balance")
            .foregroundColor(.white)
            
            
            Button(action: {
                self.showSheetView.toggle()
            }) {
                Text("edit")
                .foregroundColor(.white)

                
            }.sheet(isPresented: $showSheetView) {
                LogInView()
            }
            .padding(.leading)
            
        }

        Spacer()
    
        Text("$\(speed, specifier: "%.0f")")
               
            .bold()
            .font(.system(size: 60))
            .foregroundColor(.white)
        
        Spacer()
    
        HStack{
            
            Text("$\(speed, specifier: "%.0f")")
            Text("/ $2000")}
                .foregroundColor(isEditing ? .white : .white)
           
            Slider(
                value: $speed,
                in: 0...2000,
                onEditingChanged: { editing in
                isEditing = editing } )
            
                    .accentColor(Color.white)

    }
            .frame(width: 330, height: 200)
            .padding(.all)
            .background(Color.orange)
            .cornerRadius(15)
            .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.923), radius: 5, x: 0, y: 10)
            
    
          Text("Goals")
            .foregroundColor(.gray)
            .padding([.top, .leading, .bottom], 20.0)
            .frame(maxWidth: .infinity, alignment: .leading)
        
            
            //Goals Scroll View
        ScrollView(.horizontal, showsIndicators: false) {
                
            HStack {
            VStack(alignment: .leading) {

             Image("bike")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            Spacer()
        
            HStack{
                
                Text("$\(speedGoals, specifier: "%.0f")")
                Text("/ $300")}
                    .foregroundColor(isEditing ? .white : .white)
               
                Slider(
                    value: $speedGoals,
                    in: 0...300,
                    onEditingChanged: { editing in
                    isEditing = editing } )
                
                        .accentColor(Color.white)

        }
            .frame(width: 140, height: 200)
            .padding(.all, 25)
            .background(Color.yellow)
            .cornerRadius(15)
            .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.923), radius: 5, x: 0, y: 10)
            
            VStack(alignment: .leading) {

                Image("console")
                       .resizable()
                       .aspectRatio(contentMode: .fit)

            Spacer()
        
            HStack{
                
                Text("$\(speedGoals, specifier: "%.0f")")
                Text("/ $300")}
                    .foregroundColor(isEditing ? .white : .white)
               
                Slider(
                    value: $speedGoals,
                    in: 0...300,
                    onEditingChanged: { editing in
                    isEditing = editing } )
                
                        .accentColor(Color.white)

        }
            .frame(width: 140, height: 200)
            .padding(.all, 25)
            .background(Color.blue)
            .cornerRadius(15)
            .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.923), radius: 5, x: 0, y: 10)
                
            VStack(alignment: .leading) {

                Image("shoe")
                       .resizable()
                       .aspectRatio(contentMode: .fit)

            Spacer()
        
            HStack{
                
                Text("$\(speedGoals, specifier: "%.0f")")
                Text("/ $300")}
                    .foregroundColor(isEditing ? .white : .white)
               
                Slider(
                    value: $speedGoals,
                    in: 0...300,
                    onEditingChanged: { editing in
                    isEditing = editing } )
                
                        .accentColor(Color.white)

        }
            .frame(width: 140, height: 200)
            .padding(.all, 25)
            .background(Color.red)
            .cornerRadius(15)
            .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.923), radius: 5, x: 0, y: 10)
        
        }
            .padding([.leading, .bottom, .trailing])
        
           
            
           
        }
            
            Text("Tasks")
              .foregroundColor(.gray)
              .padding([.top, .leading, .bottom], 20.0)
              .frame(maxWidth: .infinity, alignment: .leading)
       
            
            //Tasks Scroll View
                        
        ScrollView(.horizontal, showsIndicators: false) {
                    
                HStack {
                VStack(alignment: .leading) {

                 Image("lawn")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                

            }
                .frame(width: 120, height: 160)
                .padding(.all, 25)
                .background(Color.green)
                .cornerRadius(15)
                .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.923), radius: 5, x: 0, y: 10)
                
                    VStack(alignment: .leading) {

                     Image("vacuum")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    

                }
                    .frame(width: 120, height: 160)
                    .padding(.all, 25)
                    .background(Color.purple)
                    .cornerRadius(15)
                    .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.923), radius: 5, x: 0, y: 10)
                    
                    VStack(alignment: .leading) {

                     Image("mop")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    

                }
                    .frame(width: 120, height: 160)
                    .padding(.all, 25)
                    .background(Color.yellow)
                    .cornerRadius(15)
                    .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.923), radius: 5, x: 0, y: 10)
                   
                }
                .padding([.leading, .bottom, .trailing])

            
            
        }
            
            Text("Vaults")
              .foregroundColor(.gray)
              .padding([.top, .leading, .bottom], 20.0)
              .frame(maxWidth: .infinity, alignment: .leading)
       
     
        //Navigation Bar
            }
            .navigationTitle("Profile")
            .toolbar {
                       
                ToolbarItem(placement: .navigationBarTrailing){
                
                     
                   
                        Button(action: {
                            self.showSheetView.toggle()
                        }) {
                            Image(systemName: "person")
                        }.sheet(isPresented: $showSheetView) {
                            LogInView()
                        }
                    }
                }
            
            
        }
    
    .font(Font.custom("Poppins-Medium", size: 18))
        }
        
    }




struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileView()
                .previewDevice("iPhone 13 Pro")
       
        }
    }
}



