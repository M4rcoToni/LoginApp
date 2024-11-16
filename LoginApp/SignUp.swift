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
    @State var isLoading = false
    @State var result: Result<Void, Error>?
    
    var action: () -> Void
    var body: some View {
        VStack(spacing: 45){
            Spacer()
            TopView(title: "Welcome back", details: "Please sign up in to your account:")
            InfoTF(title: "Email", text: $email)
            

            PasswordCheckField(text: $password)
            SignButton(title: "Sign Up", action: signUp, isLoading: false)
            OrView(title: "Or")
            
            HStack(spacing: 65){
                SignAccount(image: .apple, height: 32, width: 32, action: {})
                SignAccount(image: .facebook, height: 32, width: 32, action: {})
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
    
    func signUp() {
        print(email)
        Task {
          isLoading = true
          defer { isLoading = false }

          do {
            try await supabase.auth.signUp(
              email: email,
              password: password
            )
            result = .success(())
          } catch {
            result = .failure(error)
          }
        }
    }
}

#Preview {
    HomeView()
}
