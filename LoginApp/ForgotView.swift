//
//  ForgotView.swift
//  LoginApp
//
//  Created by marco on 10/11/24.
//

import SwiftUI

struct ForgotView: View {
    @State var email = ""
    var body: some View {
        VStack (spacing: 16){
            VStack{
                Text("Forgot your password?")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                Text("Enter your email address and we will sahre a link to create a new password")
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            .multilineTextAlignment(.center)
            TextField("Email", text: $email)
                .padding(.leading)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 55)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
            SignButton(title: "Send", action: {})
            Spacer()
        }
        .padding()
        .padding(.top)
    }
        
}

#Preview {
    ForgotView()
}
