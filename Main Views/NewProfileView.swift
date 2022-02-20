//
//  NewProfileView.swift
//  Thesis 1ST Prototype
//
//  Created by Josef Teska on 26.01.2022.
//

import SwiftUI
import Combine


struct NewProfileView: View {
    
    @State private var speed = 0.0
    @State private var speedGoals = 0.0
    @State private var isEditing = false
    @State var showSheetView = false
    @State private var MyBalance = 0
    @AppStorage("totalClicked") private var totalClicked = 0
    @State private var myColor = Color(red: 0.997, green: 0.383, blue: 0.405)
    @State var userProgress: CGFloat = 1589
    @State var userGoal: CGFloat = 2283
    @State var userTaskCompleted: CGFloat = 3
    @State var userTaskToComplete: CGFloat = 10
    @State var userTaskMoney: CGFloat = 400



var body: some View {
    

    
NavigationView {
    ScrollView(showsIndicators: false) {
        
        
        Spacer()
            .frame(height: 60)
        
        HStack {
            
            VStack{
            
            HStack {
        
                VStack(alignment: .center){
                
                Text("Your Progress")
                Text("$\(userProgress, specifier: "%.0f")")           .font(.custom("Poppins-SemiBold", size: 30, relativeTo: .body))
                    
                }
                
                .foregroundColor(.white)
                .padding([ .leading, .trailing])
                
            Capsule()
                .frame(width: 7, height: 60)
                .foregroundColor(.white)
                

                VStack(alignment: .center){
                
                Text("Your Goal")
                Text("$\(userGoal, specifier: "%.0f")")
                .font(.custom("Poppins-SemiBold", size: 30, relativeTo: .body))

                }
                .foregroundColor(.white)
                .padding([ .leading, .trailing])
                
                }
                Spacer()
                    .frame(height: 15)
                ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                .frame(width: 270, height: 20)
                .foregroundColor(Color(hue: 0.001, saturation: 0.596, brightness: 0.82))
                
                    
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 270*(userProgress/userGoal), height: 20)
                    .foregroundColor(.white)

                    
                }
            }
            
           
        }
        .frame(width: 310.0, height: 170)
        .padding([.leading, .trailing])
        .background(myColor)
        .cornerRadius(15)
        
        Spacer()
            .frame(height: 30)
        
        HStack {
            
            VStack{
                            
            HStack {
        
                VStack(alignment: .center){
                
                Text("Completed")
                Text("\(userTaskCompleted, specifier: "%.0f")/\(userTaskToComplete, specifier: "%.0f")")           .font(.custom("Poppins-SemiBold", size: 35, relativeTo: .body))
                    
                }
                
                .foregroundColor(.white)
                .padding([ .leading, .trailing])
                
            Capsule()
                .frame(width: 7, height: 60)
                .foregroundColor(.white)
                

                VStack(alignment: .center){
                
                Text("Collected")
                Text("$\(userTaskMoney, specifier: "%.0f")")
                .font(.custom("Poppins-SemiBold", size: 35, relativeTo: .body))

                }
                .foregroundColor(.white)
                .padding([ .leading, .trailing])
                
                }
                Spacer()
                    .frame(height: 30)
            HStack{
                ZStack(alignment: .center) {
                Circle()
                    .stroke(Color(hue: 0.073, saturation: 0.703, brightness: 0.799), lineWidth: 15)
                    .frame(width: 80, height: 80)
              
                
                Circle()
                    .trim(from: 0.0, to: userTaskCompleted/userTaskToComplete)
                    .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.white)

                    .frame(width: 80, height: 80)
                    .rotationEffect(Angle(degrees: -90))
                    
               
                    
                }
                    
                Spacer()
                        .frame(width: 65)
                    
                ZStack(alignment: .center) {
                    Circle()
                        .stroke(Color(hue: 0.073, saturation: 0.703, brightness: 0.799), lineWidth: 15)
                        .frame(width: 80, height: 80)
                  
                    
                    Circle()
                        .trim(from: 0.0, to: 0.7)
                        .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                        .foregroundColor(Color.white)

                        .frame(width: 80, height: 80)
                        .rotationEffect(Angle(degrees: -90))
                        
                   
                        
                    }

                    
                }
                
            }
            
           
        }
        .frame(width: 310.0, height: 250)
        .padding([.leading, .trailing])
        .background(Color(red: 0.997, green: 0.592, blue: 0.378))
        .cornerRadius(15)
        
        Spacer()
            .frame(height: 30)
        
        
        HStack {
            
            
            HStack{
               
              
                    
                ZStack(alignment: .center) {
                    Circle()
                        .stroke(Color(hue: 0.569, saturation: 0.649, brightness: 0.854), lineWidth: 15)
                        .frame(width: 150, height: 150)
                  
                    
                    Circle()
                        .trim(from: 0.0, to: 0.7)
                        .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                        .foregroundColor(Color.white)

                        .frame(width: 150, height: 150)
                        .rotationEffect(Angle(degrees: -90))
                    
                    VStack(alignment: .center){
                    
                    Text("Collected")
                    Text("$\(userGoal, specifier: "%.0f")")
                    .font(.custom("Poppins-SemiBold", size: 35, relativeTo: .body))

                    }
                    .foregroundColor(.white)
                    .padding([ .leading, .trailing])
                        
                   
                        
                    }

                    
                
                
            }
            
           
        }
        .frame(width: 310.0, height: 250)
        .padding([.leading, .trailing])
        .background(Color(red: 0.383, green: 0.746, blue: 0.995))
        .cornerRadius(15)
    
        
    }
    .navigationTitle("Profile 👻")
    .font(Font.custom("Poppins", size: 15))
    .toolbar {
               
        ToolbarItem(placement: .navigationBarTrailing){
        
             
           
                Button(action: {
                    self.showSheetView.toggle()
                }) {
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(.gray)
                }.sheet(isPresented: $showSheetView) {
                        LogInView()
                }
            }
        }
            }
 
        }
    
}





struct NewProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NewProfileView()
            .preferredColorScheme(.light)
            .previewDevice("iPhone 13 Pro")
    }
}


/* Group {
 
 //Goals
 Group {
 HStack {
 
     Text("Goals")
   .foregroundColor(.gray)
   .fontWeight(.bold)
   .frame(maxWidth: .infinity, alignment: .leading)
   .padding(.all)

     
     Button (action: {
      print("Continue Button Works")
  
      })  {
  
      
          Text("New")
              .fontWeight(.bold)
              .foregroundColor(Color(red: 254 / 255, green: 151 / 255, blue: 97 / 255))
              .frame(maxWidth: .infinity, alignment: .trailing)
              .padding(.all)
          

  
  }

     
     
}
 .padding([.leading, .trailing], 10.0)
 .padding(.bottom, -25.0)
 .padding(.top)

     
 ScrollView(.horizontal, showsIndicators: false) {
     
     HStack {
     
     VStack{
         
         ZStack {
             
             Circle()
                 .frame(width: 70, height: 70)
                 .foregroundColor(.white)
                 .shadow(radius: 5)
                 .padding(.all, 10)
             Text("🚴")
                 .font(.system(size: 40))

         }
         .padding(.all)
         
         Text("$200/$300")
             .bold()
             .font(.system(size: 12))
             .padding(.top,-20)
             .foregroundColor(Color(red: 54 / 255, green: 94 / 255, blue: 125 / 255))
         
         ZStack{
             RoundedRectangle(cornerRadius: 25, style: .continuous)
                 .fill(Color(red: 0.774, green: 0.744, blue: -0.001))
                 .frame(width: 90, height: 15)

             RoundedRectangle(cornerRadius: 25, style: .continuous)
                 .foregroundColor(Color(red: 54 / 255, green: 94 / 255, blue: 125 / 255))
                 .frame(width: 60, height: 15)
                 .padding(.leading, -30)
         
         
         }
         .padding(.bottom, 20)
         
         
         
         
     }
     .background(Color(red: 254 / 255, green: 244 / 255, blue: 97 / 255))
     .cornerRadius(10)
     .padding(.leading, 10)
     
     VStack{
         
         ZStack {
             
             Circle()
                 .frame(width: 70, height: 70)
                 .foregroundColor(.white)
                 .shadow(radius: 5)
                 .padding(.all, 10)
             Text("🎮")
                 .font(.system(size: 40))

         }
         .padding(.all)
         
         Text("$200/$300")
             .bold()
             .font(.system(size: 12))
             .padding(.top,-20)
             .foregroundColor(.white)
        
         ZStack{
         RoundedRectangle(cornerRadius: 25, style: .continuous)
                 .fill(Color(red: 0.264, green: 0.319, blue: 0.768))
             .frame(width: 90, height: 15)

             RoundedRectangle(cornerRadius: 25, style: .continuous)
                 .fill(Color.white)
                 .frame(width: 60, height: 15)
                 .padding(.leading, -30)
         
         
         }
         .padding(.bottom, 20)
         
         
         
         
     }
     .background(Color(red: 96 / 255, green: 112 / 255, blue: 252 / 255))
     .cornerRadius(10)
     .padding(.leading, 10)
         
     VStack{
         
         ZStack {
             
             Circle()
                 .frame(width: 70, height: 70)
                 .foregroundColor(.white)
                 .shadow(radius: 5)
                 .padding(.all, 10)
             Text("👟")
                 .font(.system(size: 40))

         }
         .padding(.all)
         
         Text("$200/$300")
             .bold()
             .font(.system(size: 12))
             .padding(.top,-20)
             .foregroundColor(.white)
        
         ZStack{
         RoundedRectangle(cornerRadius: 25, style: .continuous)
                 .fill(Color(red: 0.698, green: 0.324, blue: 0.34))
             .frame(width: 90, height: 15)

             RoundedRectangle(cornerRadius: 25, style: .continuous)
                 .fill(Color.white)
                 .frame(width: 60, height: 15)
                 .padding(.leading, -30)
         
         
         }
         .padding(.bottom, 20)
         
         
         
         
     }
     .background(Color(red: 254 / 255, green: 97 / 255, blue: 103 / 255))
     .cornerRadius(10)
     .padding(.leading, 10)

     }
     .padding()
     
 }
     

 }


 //Tasks
 Group {
 
 HStack {

 Text("Tasks")
 .foregroundColor(.gray)
 .fontWeight(.bold)
 .frame(maxWidth: .infinity, alignment: .leading)
 .padding(.all)

 
 Button (action: {
     print("Continue Button Works")
 
     })  {
 
     
         Text("New")
             .fontWeight(.bold)
             .foregroundColor(Color(red: 254 / 255, green: 151 / 255, blue: 97 / 255))
             .frame(maxWidth: .infinity, alignment: .trailing)
             .padding(.all)
         

 
 }

 
 
}
 .padding([.leading, .trailing], 10.0)
 .padding(.bottom, -25.0)
 .padding(.top, -15)

     
 ScrollView(.horizontal, showsIndicators: false) {
     
     HStack {
         
         
     
     VStack{
         
         ZStack {
             
             Circle()
                 .frame(width: 70, height: 70)
                 .foregroundColor(.white)
                 .shadow(radius: 5)
                 .padding(.all, 10)
             Text("🧼")
                 .font(.system(size: 40))

         }
         .padding(.all)

     }
     .background(Color(red: 0.383, green: 0.746, blue: 0.995))
     .cornerRadius(10)
     .padding(.leading, 10)
         
         VStack{
             
             ZStack {
                 
                 Circle()
                     .frame(width: 70, height: 70)
                     .foregroundColor(.white)
                     .shadow(radius: 5)
                     .padding(.all, 10)
                 Text("🦮")
                     .font(.system(size: 40))

             }
             .padding(.all)
    
         }
         .background(Color(red: 0.997, green: 0.592, blue: 0.378))
         .cornerRadius(10)
         .padding(.leading, 10)
         
         VStack{
             
             ZStack {
                 
                 Circle()
                     .frame(width: 70, height: 70)
                     .foregroundColor(.white)
                     .shadow(radius: 5)
                     .padding(.all, 10)
                 Text("🔧")
                     .font(.system(size: 40))

             }
             .padding(.all)
    
         }
         .background(Color(red: 0.555, green: 0.995, blue: 0.38))

         .cornerRadius(10)
         .padding(.leading, 10)

     }
     .padding()
     
     
     
 }
     

 }
 
 //Vaults
 Group {
 
     HStack {
 
     Text("Vaults")
   .foregroundColor(.gray)
   .fontWeight(.bold)
   .frame(maxWidth: .infinity, alignment: .leading)
   .padding(.all)

     
     Button (action: {
      print("Continue Button Works")
  
      })  {
  
      
          Text("New")
              .fontWeight(.bold)
              .foregroundColor(Color(red: 254 / 255, green: 151 / 255, blue: 97 / 255))
              .frame(maxWidth: .infinity, alignment: .trailing)
              .padding(.all)
          

  
  }

     
     
}
 .padding([.leading, .trailing], 10.0)
 .padding(.bottom, -25.0)
 .padding(.top, -15)

     
 ScrollView(.horizontal, showsIndicators: false) {
     
     HStack {
     
     VStack{
         
         ZStack {
             
             Circle()
                 .frame(width: 70, height: 70)
                 .foregroundColor(.white)
                 .shadow(radius: 5)
                 .padding(.all, 10)
             Text("🎄")
                 .font(.system(size: 40))

         }
         .padding(.all)
         
         Text("Christmas")
             .fontWeight(.bold)
             .foregroundColor(.white)
             .padding(.bottom, 20)
             .padding(.top, -10)
     }
     .background(Color(red: 0.546, green: 0.381, blue: 0.999))
     .cornerRadius(10)
     .padding(.leading, 10)
         
     VStack{
         
         ZStack {
             
             Circle()
                 .frame(width: 70, height: 70)
                 .foregroundColor(.white)
                 .shadow(radius: 5)
                 .padding(.all, 10)
             Text("✈️")
                 .font(.system(size: 40))

         }
         .padding(.all)
         
         Text("Trip to NYC")
             .fontWeight(.bold)
             .foregroundColor(.white)
             .padding(.bottom, 20)
             .padding(.top, -10)
     }
     .background(Color(red: 0.997, green: 0.383, blue: 0.547))
     .cornerRadius(10)
     .padding(.leading, 10)
         
     VStack{
         
         ZStack {
             
             Circle()
                 .frame(width: 70, height: 70)
                 .foregroundColor(.white)
                 .shadow(radius: 5)
                 .padding(.all, 10)
             Text("🎮")
                 .font(.system(size: 40))

         }
         .padding(.all)
         
         Text("Minecraft Server")
             .fontWeight(.bold)
             .font(.system(size: 15))
             .multilineTextAlignment(.center)
             .frame(width: 80, height: 50)
             .foregroundColor(.white)
             .padding(.bottom, 20)
             .padding(.top, -40)
     }
     .background(Color(red: 0.384, green: 0.706, blue: 0.997))
     .cornerRadius(10)
     .padding(.leading, 10)
        
     }
     .padding()
     
     
     
 }
     

 }
 
 //Vaults
 Group {
 
     

     
 ScrollView(.horizontal, showsIndicators: false) {
     
     HStack {
     
     VStack{
         
         ZStack {
             
             Circle()
                 .frame(width: 70, height: 70)
                 .foregroundColor(.white)
                 .shadow(radius: 5)
                 .padding(.all, 10)
             Text("🎄")
                 .font(.system(size: 40))

         }
         .padding(.all)
         
         Text("Christmas")
             .fontWeight(.bold)
             .foregroundColor(.white)
             .padding(.bottom, 20)
             .padding(.top, -10)
     }
     .background(Color(red: 0.546, green: 0.381, blue: 0.999))
     .cornerRadius(10)
     .padding(.leading, 10)
                         
        
                         
     }
     .background(.orange)
     .padding()
     
     
     
 }
     

 }
 
 
 }
*/
