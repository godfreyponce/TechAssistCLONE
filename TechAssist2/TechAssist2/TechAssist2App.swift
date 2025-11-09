//
//  TechAssist2App.swift
//  TechAssist2
//
//  Created by Leo Santos on 11/8/25.
//

import SwiftUI
import FirebaseCore
import Auth0

@main
struct TechAssist2App: App {
    @StateObject private var authViewModel = AuthenticationViewModel()
    
    init() {
        FirebaseApp.configure()
        FirebaseService.shared.initialize()
    }
    
    var body: some Scene {
        WindowGroup {
            Group {
                if authViewModel.isAuthenticated {
                    ContentView()
                        .environmentObject(authViewModel)
                } else {
                    LoginView(viewModel: authViewModel)
                }
            }
        }
    }
}
