//
//  WorkOrder.swift
//  WorkOrderDashboard
//
//  Work Order Data Model
//

import Foundation
import SwiftUI

enum WorkOrderPriority: String, CaseIterable {
    case critical = "CRITICAL"
    case high = "HIGH"
    case medium = "MEDIUM"
    case low = "LOW"
    
    var displayName: String {
        switch self {
        case .critical:
            return "🚨 CRITICAL"
        case .high:
            return "HIGH"
        case .medium:
            return "MEDIUM"
        case .low:
            return "LOW"
        }
    }
    
    var color: Color {
        switch self {
        case .critical:
            return Color(red: 1.0, green: 0.2, blue: 0.2) // Bright Red
        case .high:
            return Color(red: 1.0, green: 0.5, blue: 0.0) // Orange
        case .medium:
            return Color(red: 1.0, green: 0.84, blue: 0.0) // Yellow/Amber
        case .low:
            return Color(red: 0.2, green: 0.8, blue: 0.4) // Green
        }
    }
    
    var responseTime: String {
        switch self {
        case .critical:
            return "0-15 min"
        case .high:
            return "Under 1 hour"
        case .medium:
            return "2-8 hours"
        case .low:
            return "When available"
        }
    }
    
    var order: Int {
        switch self {
        case .critical: return 0
        case .high: return 1
        case .medium: return 2
        case .low: return 3
        }
    }
}

enum WorkOrderStatus: String, CaseIterable {
    case pending = "Pending"
    case inProgress = "In Progress"
    case completed = "Completed"
    case onHold = "On Hold"
}

struct WorkOrder: Identifiable, Hashable {
    let id: UUID
    var title: String
    var description: String
    var priority: WorkOrderPriority
    var status: WorkOrderStatus
    var assignedTechnician: String
    var createdAt: Date
    var dueDate: Date?
    var timeSpent: TimeInterval // in seconds
    var location: String
    var equipment: String?
    
    init(
        id: UUID = UUID(),
        title: String,
        description: String,
        priority: WorkOrderPriority,
        status: WorkOrderStatus,
        assignedTechnician: String,
        createdAt: Date = Date(),
        dueDate: Date? = nil,
        timeSpent: TimeInterval = 0,
        location: String,
        equipment: String? = nil
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.priority = priority
        self.status = status
        self.assignedTechnician = assignedTechnician
        self.createdAt = createdAt
        self.dueDate = dueDate
        self.timeSpent = timeSpent
        self.location = location
        self.equipment = equipment
    }
}

// Sample data
extension WorkOrder {
    static let sampleData: [WorkOrder] = [
        WorkOrder(
            title: "Power Outage in Rack 12",
            description: "Complete power failure affecting multiple servers. Immediate attention required.",
            priority: .critical,
            status: .inProgress,
            assignedTechnician: "Michael Bernando",
            dueDate: Date(),
            timeSpent: 600,
            location: "Data Center - Rack 12",
            equipment: "PDU Unit #12"
        ),
        WorkOrder(
            title: "Cooling System Failure",
            description: "Temperature spike detected. Risk of hardware damage if not addressed immediately.",
            priority: .critical,
            status: .pending,
            assignedTechnician: "Michael Bernando",
            dueDate: Date(),
            location: "Data Center - Cooling Zone A",
            equipment: "CRAC Unit #5"
        ),
        WorkOrder(
            title: "Network Backbone Failure",
            description: "Core router failure affecting multiple customers. Service degradation reported.",
            priority: .high,
            status: .pending,
            assignedTechnician: "Michael Bernando",
            dueDate: Calendar.current.date(byAdding: .hour, value: 1, to: Date()),
            location: "Network Room - Main",
            equipment: "Core Router #1"
        ),
        WorkOrder(
            title: "Hardware Refresh - Server Rack 8",
            description: "Planned upgrade of servers in rack 8. Schedule during maintenance window.",
            priority: .medium,
            status: .pending,
            assignedTechnician: "Michael Bernando",
            dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date()),
            location: "Data Center - Rack 8",
            equipment: "Server Array #8"
        ),
        WorkOrder(
            title: "Preventive Maintenance - Battery Testing",
            description: "Routine UPS battery testing and replacement if needed.",
            priority: .medium,
            status: .pending,
            assignedTechnician: "Michael Bernando",
            dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date()),
            location: "UPS Room - Main",
            equipment: "UPS System #3"
        ),
        WorkOrder(
            title: "Rack Cleaning and Organization",
            description: "General cleaning and cable management in rack 15.",
            priority: .low,
            status: .pending,
            assignedTechnician: "Michael Bernando",
            location: "Data Center - Rack 15"
        ),
        WorkOrder(
            title: "Documentation Update",
            description: "Update network diagrams and equipment inventory.",
            priority: .low,
            status: .completed,
            assignedTechnician: "Michael Bernando",
            timeSpent: 1800,
            location: "Office - Documentation"
        )
    ]
}

