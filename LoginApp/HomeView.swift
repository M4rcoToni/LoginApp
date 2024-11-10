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
    @State var showSignUp = true
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            if showSignUp {
                SignUp(email: $email, password: $password, remenber: $remember, showSignIn: $showSignUp, action: {})
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .trailing)
                        )
                    )
            } else {
                SignIn(email: $email, password: $password, remenber: $remember, showSignUp: $showSignUp, action: {})
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .leading),
                            removal: .move(edge: .leading)
                        )
                    )
            }
        }
    }
}

#Preview {
    HomeView()
}
