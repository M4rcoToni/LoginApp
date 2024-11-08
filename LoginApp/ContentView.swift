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
    var body: some View {
        ZStack {
            Color.black
                
            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.linearGradient(colors: [.white,.gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 120)
                .rotationEffect(.degrees(135))
                .blur(radius: 180)
          
            VStack(spacing:20) {
                Text("Welcome")
                    .foregroundStyle(.white)
                    .font(.system(size: 40, weight: .bold, design: .serif))
                
            
                TextField("Email",text: $email)
                    .foregroundColor(.white)
                    .placeholder(when: email.isEmpty){
                        Text("Email")
                            .foregroundStyle(.white)
                            .font(.system(size: 16, weight: .medium, design: .serif))
                    }
                
                
                Rectangle()
                    .frame(width: 350,height: 1)
                    .foregroundColor(.white)
                
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty){
                        Text("Password")
                            .foregroundStyle(.white)
                            .font(.system(size: 16, weight: .medium, design: .serif))
                    }
                
                Rectangle()
                    .frame(width: 350,height: 1)
                    .foregroundColor(.white)
            
                
                Button {
                    register()
                } label: {
                    Text("SignUp")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 12,style: .continuous)
                                .fill(.linearGradient(colors: [.gray,.white], startPoint: .topLeading, endPoint: .trailing))
                        )
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium, design: .serif))
                    
                }

                
            }
            .frame(width: 350)
            
        
        }
        .ignoresSafeArea()
    }
    func login (){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if error != nil{
                print(error!.self)
            }
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
