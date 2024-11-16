//
//  ContentView.swift
//  LoginApp
//
//  Created by marco on 7/11/24.
//

import SwiftUI
//import Firebase
//import FirebaseAuth

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @FocusState private var emailInput: Bool
    let user = supabase.auth.currentUser

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
                    Text("Welcome back").font(.title.bold()).foregroundColor(.white)
                 
                    Text(user?.email ?? "")
                        .foregroundColor(.white)
                        .opacity(0.7)
                        .font(.title2)
                }
                .padding(.bottom, 32.0)
                
                Button("Sign out", role: .destructive) {
                    Task {
                      try? await supabase.auth.signOut()
                    }
                }
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
