//
//  WorkOrder.swift
//  WorkOrderDashboard
//
//  Work Order Data Model
//

import Foundation

enum WorkOrderPriority: String, CaseIterable {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
    
    var color: Color {
        switch self {
        case .high:
            return Color(red: 1.0, green: 0.3, blue: 0.3) // Red
        case .medium:
            return Color(red: 1.0, green: 0.84, blue: 0.0) // Yellow/Amber
        case .low:
            return Color(red: 0.2, green: 0.8, blue: 0.4) // Green
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
            title: "HVAC System Repair",
            description: "Replace compressor unit in Building A",
            priority: .high,
            status: .inProgress,
            assignedTechnician: "Michael Bernando",
            dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date()),
            timeSpent: 3600,
            location: "Building A - Floor 3",
            equipment: "HVAC Unit #12"
        ),
        WorkOrder(
            title: "Electrical Panel Inspection",
            description: "Routine safety inspection of main panel",
            priority: .medium,
            status: .pending,
            assignedTechnician: "Michael Bernando",
            dueDate: Calendar.current.date(byAdding: .day, value: 3, to: Date()),
            location: "Building B - Basement",
            equipment: "Main Panel #5"
        ),
        WorkOrder(
            title: "Plumbing Leak Fix",
            description: "Fix leak in restroom on second floor",
            priority: .high,
            status: .pending,
            assignedTechnician: "Michael Bernando",
            dueDate: Calendar.current.date(byAdding: .hour, value: 4, to: Date()),
            location: "Building A - Floor 2",
            equipment: "Sink Unit #8"
        ),
        WorkOrder(
            title: "Light Fixture Replacement",
            description: "Replace LED fixtures in hallway",
            priority: .low,
            status: .completed,
            assignedTechnician: "Michael Bernando",
            timeSpent: 1800,
            location: "Building C - Floor 1",
            equipment: "LED Fixture Set #3"
        )
    ]
}

