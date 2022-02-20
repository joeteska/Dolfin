//
//  ProfileCard.swift
//  Thesis 1ST Prototype
//
//  Created by Josef Teska on 07.01.2022.
//

import SwiftUI

struct LogInView : View {

    @State var showSheetView = false
    @State private var email: String = "Email"
    @State private var password: String = "Password"

    var body: some View {


    ZStack {
        
        Color(red: 1.0, green: 0.483, blue: 0.407) .edgesIgnoringSafeArea(.all)
        
        
        
        VStack(alignment: .leading) {

            Spacer()
                .frame(height: 30)

            HStack {
            Text("Log in")
                .bold()
                .font(.system(size: 40))
                .foregroundColor(.black)
                Spacer()
                
                Text("🍇")
                    .bold()
                    .font(.system(size: 40))
                    .foregroundColor(.black)
             
                
              

            
            }
            .padding(.all)
            
            
            Spacer()
                .frame(height: 50)
            
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .padding(.all)
                .frame(height: 50)
                .background(.white)
                .foregroundColor(.gray)

                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1),radius: 5, x: 0, y: 5)

            Spacer()
                .frame(height: 20)

            
            SecureField("Password", text: $password)

                .padding(.all)
                .frame(height: 50)
                .background(.white)
                .foregroundColor(.gray)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1),radius: 5, x: 0, y: 5)
      
            Spacer()
                .frame(height: 30)
          
            
            Group {
              
                
                HStack{
                
                                        
                    
                    
                    Button (action: {
                     print("Continue Button Works")
                 
                     })  {
                 
                     
                         Text("Forgot Password?")
                             .foregroundColor(.gray)
                             .frame(maxWidth: .infinity, alignment: .trailing)
                             .font(.system(size: 15))


                 
                 }
                    
                    
                }
                .padding()
                
                Spacer()
                    .frame(height: 0)
                
                
                
            Button (action: {
                print("Continue Button Works")
                
            }) {
                
                Text("Continue")
                    .frame(width: 330, height: 50)
                    .background(Color(red: 1.0, green: 0.483, blue: 0.407))
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1),radius: 5, x: 0, y: 5)

                
            }
                
                HStack{
                    
                Text("Don't have an accout? ")
                        .foregroundColor(.black)
                
                Button(action: {
                    self.showSheetView.toggle()
                }) { Text("Sign Up")
                    .foregroundColor(Color(red: 104 / 255, green: 111 / 255, blue: 1))
                    .bold()
                }.sheet(isPresented: $showSheetView) {
                    SignUpView()
                }

                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.all)
            
            Spacer()
                .frame(height: 20)
                Button (action: {
                    print("Continue Button Works")
                
                    }) {
                
                    
                            HStack {
                    
                                    Image("google")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                        
                    
                                        Text("Sign in with Google")
                
                    
                
                                }
                        .frame(width: 330, height: 50)
                        .background(.white)
                        .foregroundColor(.gray)
                        .font(.system(size: 20))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1),radius: 5, x: 0, y: 5)
                
                }
            
            
            
                Spacer()
                    .frame(height: 20)
                
                    Button (action: {
                        print("Continue Button Works")
                    
                        }) {
                    
                        
                                HStack {
                        
                                        Image("appleLogo")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                            
                        
                                            Text("Sign in with Apple")
                    
                        
                    
                                    }
                            .frame(width: 330, height: 50)
                            .background(.black)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1),radius: 5, x: 0, y: 5)
                    
                    }
                
                Spacer()
                    .frame(height:20)
                
               
            }
        

        }
      
                .frame(width: 330, height: 600)
                .padding(.all)
                .background(Color.white)
                .cornerRadius(30)
              
              
                
            }
        
    .shadow(color: Color.black.opacity(0.1),radius: 5, x: 0, y: 10)
    .font(Font.custom("Poppins", size: 15))
            
            }
        
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 Pro")
    }
}
