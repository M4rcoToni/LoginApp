//
//  HomeView.swift
//  LoginApp
//
//  Created by marco on 9/11/24.
//

import SwiftUI

struct HomeView: View {
    @State var email = ""
    @State var password = ""
    @State var remember = false
    @State var showSignUp = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            if showSignUp {
                
            } else {
                SignIn(email: $email, password: $password, remenber: $remember, showSignUp: $showSignUp, action: {})
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .trailing)
                        )
                    )
            }
        }
    }
}

#Preview {
    HomeView()
}
