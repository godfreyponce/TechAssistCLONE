//
//  WorkOrderDetailView.swift
//  WorkOrderDashboard
//
//  Work Order Detail/Active View - Adapted from Workout in Progress Screen
//

import SwiftUI

struct WorkOrderDetailView: View {
    let workOrder: WorkOrder
    @State private var timerActive = true
    @State private var elapsedTime: TimeInterval = 0
    @State private var timer: Timer?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            AppTheme.backgroundPrimary.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(AppTheme.textPrimary)
                    }
                    
                    Spacer()
                    
                    Text(workOrder.title.uppercased())
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(AppTheme.textPrimary)
                    
                    Spacer()
                    
                    // Balance the header
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.clear)
                }
                .padding(.horizontal, 20)
                .padding(.top, 60)
                .padding(.bottom, 20)
                
                // Main Content
                ScrollView {
                    VStack(spacing: 24) {
                        // Equipment Image Placeholder
                        ZStack {
                            RoundedRectangle(cornerRadius: AppTheme.cardCornerRadius)
                                .fill(
                                    LinearGradient(
                                        colors: [AppTheme.accentPrimary.opacity(0.3), AppTheme.accentSecondary.opacity(0.2)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(height: 300)
                            
                            VStack(spacing: 16) {
                                Image(systemName: "wrench.and.screwdriver.fill")
                                    .font(.system(size: 60))
                                    .foregroundColor(AppTheme.accentPrimary)
                                
                                Text(workOrder.equipment ?? "Equipment")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(AppTheme.textPrimary)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        // Timer Display
                        Text(timeString(from: elapsedTime + workOrder.timeSpent))
                            .font(.system(size: 64, weight: .bold, design: .rounded))
                            .foregroundColor(AppTheme.textPrimary)
                            .monospacedDigit()
                        
                        // Controls Section
                        HStack(spacing: 40) {
                            VStack(spacing: 8) {
                                Text("EST. TIME")
                                    .font(.system(size: 10, weight: .medium))
                                    .foregroundColor(AppTheme.textSecondary)
                                
                                if let dueDate = workOrder.dueDate {
                                    Text("\(Int(dueDate.timeIntervalSinceNow / 3600)) HRS")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(AppTheme.textPrimary)
                                } else {
                                    Text("N/A")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(AppTheme.textSecondary)
                                }
                            }
                            
                            Button(action: {
                                timerActive.toggle()
                                if timerActive {
                                    startTimer()
                                } else {
                                    stopTimer()
                                }
                            }) {
                                Circle()
                                    .fill(AppTheme.accentPrimary)
                                    .frame(width: 70, height: 70)
                                    .overlay(
                                        Image(systemName: timerActive ? "pause.fill" : "play.fill")
                                            .font(.system(size: 28, weight: .bold))
                                            .foregroundColor(.white)
                                    )
                            }
                            
                            VStack(spacing: 8) {
                                Text("LOCATION")
                                    .font(.system(size: 10, weight: .medium))
                                    .foregroundColor(AppTheme.textSecondary)
                                
                                Text(workOrder.location)
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(AppTheme.textPrimary)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        // Work Order Details Card
                        VStack(alignment: .leading, spacing: 16) {
                            Text("DETAILS")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(AppTheme.textPrimary)
                            
                            DetailRow(label: "Priority", value: workOrder.priority.displayName, color: workOrder.priority.color)
                            DetailRow(label: "Status", value: workOrder.status.rawValue, color: AppTheme.accentPrimary)
                            DetailRow(label: "Equipment", value: workOrder.equipment ?? "N/A", color: AppTheme.textSecondary)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Description")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(AppTheme.textSecondary)
                                
                                Text(workOrder.description)
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(AppTheme.textPrimary)
                            }
                        }
                        .padding(AppTheme.cardPadding)
                        .background(AppTheme.backgroundSecondary)
                        .cornerRadius(AppTheme.cardCornerRadius)
                        .padding(.horizontal, 20)
                        
                        // Instructions
                        HStack {
                            Image(systemName: "arrow.up")
                                .font(.system(size: 12))
                                .foregroundColor(AppTheme.textSecondary)
                            
                            Text("SWIPE UP FOR INSTRUCTIONS")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(AppTheme.textSecondary)
                        }
                        .padding(.bottom, 40)
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            elapsedTime += 1
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func timeString(from timeInterval: TimeInterval) -> String {
        let hours = Int(timeInterval) / 3600
        let minutes = Int(timeInterval) / 60 % 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

struct DetailRow: View {
    let label: String
    let value: String
    let color: Color
    
    var body: some View {
        HStack {
            Text(label)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(AppTheme.textSecondary)
            
            Spacer()
            
            Text(value)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(color)
        }
    }
}

struct WorkOrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkOrderDetailView(workOrder: WorkOrder.sampleData[0])
            .preferredColorScheme(.dark)
    }
}

