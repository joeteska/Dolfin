//
//  SignUp.swift
//  Thesis 1ST Prototype
//
//  Created by Josef Teska on 27.01.2022.
//

import SwiftUI

struct SignUpView : View {

    @State var showSheetView = false
    @State private var UserName: String = "Name"
    @State private var email: String = "Email"
    @State private var password: String = "Password"


    var body: some View {

    ZStack {
        
        Color(red: 104 / 255, green: 111 / 255, blue: 1).edgesIgnoringSafeArea(.all)
        
        
        
        VStack(alignment: .leading) {
            

            Spacer()
                .frame(height: 30)
            
         

            HStack {
            Text("Sign Up")
                .bold()
                .font(.system(size: 40))
                .foregroundColor(.black)
                Spacer()
                
            Text("📝")
                    .font(.system(size: 60))

            
            }
            .padding(.all)
            
            
            Spacer()
                .frame(height: 50)
            
            TextField("Name", text: $UserName)
                .padding(.all)
                .frame(height: 50)
                .background(.white)
                .foregroundColor(.gray)

                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1),radius: 5, x: 0, y: 10)

            Spacer()
                .frame(height: 20)
            
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .padding(.all)
                .frame(height: 50)
                .background(.white)
                .foregroundColor(.gray)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1),radius: 5, x: 0, y: 10)

            Spacer()
                .frame(height: 20)

      
                
            
                
            SecureField("Password", text: $password)
                .padding(.all)
                .frame(height: 50)
                .background(.white)
                .foregroundColor(.gray)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1),radius: 5, x: 0, y: 10)
            
            
            
            
      
            Spacer()
                .frame(height: 30)
          
            
            Group {
              
                
                HStack {
                    
                    
                    Text("By clicking Continue, you agree to our [Terms & Conditions](https://www.example.com/TOS.html) and [Privacy Policy](https://www.example.com/TOS.html)")
                        .padding(.leading)

                    
        
                }
                .font(.system(size: 15))


                Spacer()
                    .frame(height: 30)
                
                
        HStack {
            
            Spacer()
            Button (action: {
                print("Continue Button Works")
                
            }) {
                
                Text("Sign Up")
                    .frame(width: 280, height: 50, alignment: .center)
                    .background(Color(red: 104 / 255, green: 111 / 255, blue: 1))
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .cornerRadius(13)
                    .shadow(color: Color.black.opacity(0.1),radius: 5, x: 0, y: 10)

                
            }
            Spacer()
                }
                
            }
        

        }

                .frame(width: 330, height: 500)
                .padding(.all)
                .background(Color.white)
                .cornerRadius(30)
            
              
              
       
                
            }
        
        
        
        
    .shadow(color: Color.black.opacity(0.1),radius: 5, x: 0, y: 10)
    .font(Font.custom("Poppins", size: 15))
            
        
        
        
            }
        
}

struct ProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .previewDevice("iPhone 13 Pro")
    }
}
