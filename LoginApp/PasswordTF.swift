//
//  PasswordTF.swift
//  LoginApp
//
//  Created by marco on 9/11/24.
//

import SwiftUI

struct PasswordTF: View {
    var title:  String
    @Binding var text: String
    @FocusState var isActive
    @State var showPassword = false
    var body: some View {
        ZStack(alignment: .leading){
            SecureField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55).focused($isActive)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
                .opacity(showPassword ? 0 : 1)
            
            TextField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 55).focused($isActive)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
                .opacity(showPassword ? 1 : 0)
            
            Text(title)
                .padding(.leading)
                .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                .foregroundStyle(isActive ? .white : .secondary)
                .animation(.spring, value: isActive)
                .onTapGesture {
                    isActive = true
                }
        }
        .overlay(alignment: .trailing){
            Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                .padding(16)
                .contentShape(Rectangle())
                .foregroundStyle(showPassword ? .primary : .secondary)
                .onTapGesture {
                    showPassword.toggle()
                }
                .animation(.linear, value: showPassword)
        }
    }
}

#Preview {
    HomeView()
}
