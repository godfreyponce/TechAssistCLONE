//
//  DashboardView.swift
//  WorkOrderDashboard
//
//  Main Dashboard - Adapted from Fitness App Home Screen
//

import SwiftUI

struct DashboardView: View {
    @State private var workOrders = WorkOrder.sampleData
    let technicianName = "MICHAEL BERNANDO"
    
    var openWorkOrders: Int {
        workOrders.filter { $0.status != .completed }.count
    }
    
    var highPriorityCount: Int {
        workOrders.filter { $0.priority == .high && $0.status != .completed }.count
    }
    
    var completedToday: Int {
        let today = Calendar.current.startOfDay(for: Date())
        return workOrders.filter { workOrder in
            workOrder.status == .completed &&
            Calendar.current.startOfDay(for: workOrder.createdAt) == today
        }.count
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.backgroundPrimary.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Header Section
                        headerSection
                        
                        // Key Metrics Section
                        keyMetricsSection
                        
                        // Work Orders Graph Section
                        workOrdersGraphSection
                        
                        // Assigned Work Orders Section
                        assignedWorkOrdersSection
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 100)
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("WELCOME BACK,")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(AppTheme.textSecondary)
                    
                    Text(technicianName)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(AppTheme.textPrimary)
                }
                
                Spacer()
                
                // Profile Picture Placeholder
                Circle()
                    .fill(AppTheme.accentPrimary)
                    .frame(width: 50, height: 50)
                    .overlay(
                        Text("MB")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                    )
            }
        }
        .padding(.top, 60)
    }
    
    private var keyMetricsSection: some View {
        HStack(spacing: 16) {
            MetricCard(
                icon: "doc.text.fill",
                value: "\(openWorkOrders)",
                label: "Open Orders"
            )
            
            MetricCard(
                icon: "exclamationmark.triangle.fill",
                value: "\(highPriorityCount)",
                label: "High Priority"
            )
            
            MetricCard(
                icon: "checkmark.circle.fill",
                value: "\(completedToday)",
                label: "Completed"
            )
        }
    }
    
    private var workOrdersGraphSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("WORK ORDERS")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(AppTheme.textPrimary)
                
                Spacer()
                
                Text("WEEKLY TOTAL \(workOrders.count)")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(AppTheme.textSecondary)
            }
            
            // Weekly Bar Chart
            HStack(alignment: .bottom, spacing: 8) {
                ForEach(["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"], id: \.self) { day in
                    VStack(spacing: 8) {
                        let height = day == "TUE" ? CGFloat(80) : CGFloat(40 + Int.random(in: 20...60))
                        
                        RoundedRectangle(cornerRadius: 4)
                            .fill(day == "TUE" ? AppTheme.accentPrimary : AppTheme.backgroundTertiary)
                            .frame(width: 30, height: height)
                        
                        Text(day)
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(AppTheme.textSecondary)
                    }
                }
            }
            .frame(height: 120)
        }
        .padding(AppTheme.cardPadding)
        .background(AppTheme.backgroundSecondary)
        .cornerRadius(AppTheme.cardCornerRadius)
    }
    
    private var assignedWorkOrdersSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("ASSIGNED WORK ORDERS")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(AppTheme.textPrimary)
                
                Spacer()
                
                Button(action: {}) {
                    Text("VIEW ALL")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(AppTheme.accentPrimary)
                }
            }
            
            // Featured Work Order Card
            if let featuredOrder = workOrders.first(where: { $0.status == .inProgress || $0.priority == .high }) {
                NavigationLink(destination: WorkOrderDetailView(workOrder: featuredOrder)) {
                    ZStack {
                        // Background gradient
                        LinearGradient(
                            colors: [AppTheme.accentPrimary.opacity(0.8), AppTheme.accentSecondary.opacity(0.6)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(featuredOrder.title.uppercased())
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(.white)
                                
                                if let dueDate = featuredOrder.dueDate {
                                    Text("Due: \(dueDate, style: .relative)")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(.white.opacity(0.9))
                                }
                                
                                HStack {
                                    Circle()
                                        .fill(featuredOrder.priority.color)
                                        .frame(width: 8, height: 8)
                                    
                                    Text(featuredOrder.priority.rawValue.uppercased())
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundColor(.white)
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(AppTheme.cardPadding)
                    }
                    .frame(height: 150)
                    .cornerRadius(AppTheme.cardCornerRadius)
                }
            }
        }
    }
}

struct MetricCard: View {
    let icon: String
    let value: String
    let label: String
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(AppTheme.accentPrimary)
            
            Text(value)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(AppTheme.textPrimary)
            
            Text(label)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(AppTheme.textSecondary)
        }
        .frame(maxWidth: .infinity)
        .padding(AppTheme.cardPadding)
        .background(AppTheme.backgroundSecondary)
        .cornerRadius(AppTheme.cardCornerRadius)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .preferredColorScheme(.dark)
    }
}

