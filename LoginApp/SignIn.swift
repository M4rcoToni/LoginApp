//
//  SignIn.swift
//  LoginApp
//
//  Created by marco on 9/11/24.
//

import SwiftUI

struct SignIn: View {
    @FocusState var isActive
    @Binding var email: String
    @Binding var password: String
    @Binding var remenber: Bool
    @Binding var showSignUp: Bool
    @State var showForgotView = false
    
    var action: () -> Void
    var body: some View {
        VStack(spacing: 45){
            TopView(title: "Welcome back", details: "Please sign up in to your account:")
            InfoTF(title: "Email", text: $email)
            
            VStack{
                PasswordTF(title: "Password", text: $password)
            }
        }.padding()
    }
}

#Preview {
    HomeView()
}


struct TopView: View {
    var title: String
    var details: String
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(title).font(.title.bold())
            Text(details).foregroundStyle(.secondary)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
}

struct InfoTF: View {
    var title:  String
    @Binding var text: String
    @FocusState var isActive
    
    var body: some View {
        ZStack(alignment: .leading){
            TextField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 55).focused($isActive)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
            Text(title)
                .padding(.leading)
                .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                .foregroundStyle(isActive ? .white : .secondary)
                .animation(.spring, value: isActive)
                .onTapGesture {
                    isActive = true
                }
        }
    }
}


