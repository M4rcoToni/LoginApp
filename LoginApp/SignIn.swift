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
            Spacer()
            TopView(title: "Welcome back", details: "Please sign up in to your account:")
            InfoTF(title: "Email", text: $email)
            
            VStack(spacing: 24){
                PasswordTF(title: "Password", text: $password)
                HStack {
                    Toggle(isOn: $remenber, label: {
                        /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/
                    })
                    .toggleStyle(RememberStyle())
                    Spacer()
                    Button(action: {
                        showForgotView.toggle()
                    }, label: {
                        Text("Forgot password")
                    })
                    .tint(.primary)
                }
            }
            
            SignButton(title: "Sign In", action: {})
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
                    showSignUp.toggle()
                }
            } label: {
                Text("Don't have an account? ***Sign up***")
            }
            .tint(.primary)
        }
        .padding()
        .sheet(isPresented: $showForgotView, content: {
            ForgotView()
                .presentationDetents([.fraction(0.4)])
                .presentationCornerRadius(32)
        })
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
                .foregroundStyle(isActive ? .input : .secondary)
                .animation(.spring, value: isActive)
                .onTapGesture {
                    isActive = true
                }
        }
    }
}


struct RememberStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button{
            configuration.isOn.toggle()
        } label: {
            HStack{
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .contentTransition(.symbolEffect)
                Text("Remember")
            }
        }
        .tint(.primary)
    }
}

struct SignButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: {action()}, label: {
            Text(title)
                .foregroundStyle(.siginText).font(.title2.bold())
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.primary, in: .rect(cornerRadius: 16))
        })
        .tint(.primary)
    }
}

struct OrView: View {
    var title: String
    var body: some View {
        HStack{
            Rectangle()
                .frame(height: 1.5)
                .foregroundStyle(.gray.opacity(0.3))
            
            Text(title)
                
            Rectangle()
                .frame(height: 1.5)
                .foregroundStyle(.gray.opacity(0.3))
        }
    }
}


struct SignAccount: View {
    var image: ImageResource
    var height: CGFloat
    var width: CGFloat
    var action: () -> Void
    var body: some View {
        Button(action: {}, label: {
            Image(image)
                .renderingMode(.template)
                .resizable().scaledToFit()
                .frame(width: width, height: height)
                .overlay{
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 1.5)
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.gray.opacity(0.3))
                }
        })
        .tint(.primary)
    }
}
