//
//  LoginView.swift
//  TechAssist2
//
//  Simple Login View with Auth0
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: AuthenticationViewModel
    @State private var showError = false
    
    var body: some View {
        ZStack {
            AppTheme.backgroundPrimary.ignoresSafeArea()
            
            VStack(spacing: 32) {
                Spacer()
                
                // Logo/App Name
                VStack(spacing: 16) {
                    Image(systemName: "wrench.and.screwdriver.fill")
                        .font(.system(size: 80))
                        .foregroundColor(AppTheme.accentPrimary)
                    
                    Text("TechAssist")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(AppTheme.textPrimary)
                    
                    Text("NMC^2 Technician Dashboard")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(AppTheme.textSecondary)
                }
                
                Spacer()
                
                // Login Button
                Button(action: {
                    viewModel.login()
                }) {
                    HStack {
                        if viewModel.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else {
                            Text("Sign In")
                                .font(.system(size: 18, weight: .semibold))
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(AppTheme.accentPrimary)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
                .disabled(viewModel.isLoading)
                .padding(.horizontal, 40)
                
                // Error Message
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .font(.system(size: 14))
                        .foregroundColor(AppTheme.error)
                        .padding(.horizontal, 40)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: AuthenticationViewModel())
            .preferredColorScheme(.dark)
    }
}

