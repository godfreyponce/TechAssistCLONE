//
//  ProfileView.swift
//  WorkOrderDashboard
//
//  Simple Profile View
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.backgroundPrimary.ignoresSafeArea()
                
                VStack(spacing: 24) {
                    // Profile Header
                    VStack(spacing: 16) {
                        Circle()
                            .fill(AppTheme.accentPrimary)
                            .frame(width: 100, height: 100)
                            .overlay(
                                Text("MB")
                                    .font(.system(size: 36, weight: .bold))
                                    .foregroundColor(.white)
                            )
                        
                        Text("MICHAEL BERNANDO")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(AppTheme.textPrimary)
                        
                        Text("NMC^2 Technician")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(AppTheme.textSecondary)
                    }
                    .padding(.top, 60)
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
    }
}

