//
//  ContentView.swift
//  LoginApp
//
//  Created by marco on 7/11/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var user = ""
    @FocusState private var emailInput: Bool
    var body: some View {
        ZStack {
            Color.black
                
            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .foregroundStyle(
                    .linearGradient(
                        colors: [.white,.gray], 
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 1000, height: 120)
                .rotationEffect(.degrees(135))
                .blur(radius: 180)
          
            VStack() {
                VStack(alignment: .leading) {
                    Text("Welcome back")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .bold, design: .serif))
                    
                    Text("Sign in to your account")
                        .foregroundColor(.white)
                        .opacity(0.7)
                        .font(.system(size: 16, weight: .medium, design: .serif))
                }
                .padding(.bottom, 32.0)
            
                
                VStack(alignment: .leading) {
                    Text("Email")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium, design: .serif))
                    
                    TextField("Email", text: $email)
                        .focused($emailInput)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 8,style: .continuous)
                                .foregroundColor(.gray)
                                .border(Color.white, width: emailInput ? 1 : 0)
                        )
                        .font(.system(size: 16, weight: .medium, design: .serif))
                        
                }
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium, design: .serif))
                    
                    SecureField("Password", text: $password)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 8,style: .continuous)
                                .foregroundColor(.gray)
                        )
                        .font(.system(size: 16, weight: .medium, design: .serif))
                    
                        
                }.padding(.top, 4)
                
                Button {
                    login()
                } label: {
                    Text("SignUp")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium, design: .serif))
                    
                }
                .frame(width: 200,height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 12,style: .continuous)
                        .fill(.linearGradient(colors: [.gray,.white], startPoint: .topLeading, endPoint: .trailing))
                )
                .padding(.top, 32)
                
                

                
            }
            .frame(width: 390)
    
            
        
        }
        .ignoresSafeArea()
    }
    func login (){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if error != nil{
                print(error!.self)
            }
            user = result?.user.email ?? ""
        }
    }
    
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil{
                print(error!.self)
            }
        }
    }
}

#Preview {
    ContentView()
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
