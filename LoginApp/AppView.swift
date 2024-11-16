//
//  AppView.swift
//  LoginApp
//
//  Created by marco on 16/11/24.
//

import SwiftUI
import Foundation

struct AppView: View {

    @State var isAuthenticated = false
    @State private var showTransition = false


    var body: some View {
      ZStack {
          if(isAuthenticated){
              ContentView()
                  .transition(.move(edge: .trailing))
          }else{
              HomeView()
                  .transition(.move(edge: .leading))
          }
      }
      .animation(.easeInOut(duration: 0.5), value: showTransition)
      .task {
          for await state in await supabase.auth.authStateChanges {
              if [.initialSession, .signedIn, .signedOut].contains(state.event) {
                  withAnimation {
                      isAuthenticated = state.session != nil
                  }
              }
          }
      }
    }
}

