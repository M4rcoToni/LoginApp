//
//  SignUp.swift
//  LoginApp
//
//  Created by marco on 9/11/24.
//

import SwiftUI

struct SignUp: View {
    @FocusState var isActive
    @Binding var email: String
    @Binding var password: String
    @Binding var remenber: Bool
    @Binding var showSignIn: Bool
    @State var showForgotView = false
    
    var action: () -> Void
    var body: some View {
        VStack(spacing: 45){
            Spacer()
            TopView(title: "Welcome back", details: "Please sign up in to your account:")
            InfoTF(title: "Email", text: $email)
            

            PasswordCheckField()
            SignButton(title: "Sign Up", action: {})
            OrView(title: "Or")
            
            HStack(spacing: 65){
                SignAccount(image: .apple, height: 32, width: 32, action: {})
                SignAccount(image: .mail, height: 32, width: 32, action: {})
                SignAccount(image: .google, height: 32, width: 32, action: {})
            }
            Spacer()
            Button{
                email = ""
                password = ""
                withAnimation {
                    showSignIn.toggle()
                }
            } label: {
                Text("Already have an account? ***Sign in***")
            }
            .tint(.primary)
        }.padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
