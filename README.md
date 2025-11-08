# Work Order Dashboard for NMC^2 Technicians

A modern iOS app built with SwiftUI for managing work orders with a priority system, designed for NMC^2 technicians.

## Features

- **Dashboard View**: Overview of work order metrics, weekly statistics, and assigned work orders
- **Work Order Detail View**: Active work order tracking with timer and detailed information
- **Work Order List View**: Browse and filter work orders by date and priority
- **Priority Queue View**: Visual priority system showing high, medium, and low priority work orders
- **Dark Theme**: Professional dark UI with NMC^2 brand colors

## Design Inspiration

The UI is inspired by modern fitness tracking apps with:
- Dark background theme (#1C1C1E equivalent)
- Clean card-based layouts
- Prominent metrics display
- Intuitive navigation patterns
- Professional color scheme

## Project Structure

```
WorkOrderDashboard/
├── WorkOrderDashboardApp.swift    # Main app entry point
├── Models/
│   └── WorkOrder.swift            # Work order data model
├── Theme/
│   └── AppTheme.swift             # Color theme and styling
└── Views/
    ├── ContentView.swift          # Main tab navigation
    ├── DashboardView.swift        # Home dashboard
    ├── WorkOrderDetailView.swift  # Active work order view
    ├── WorkOrderListView.swift    # Work order list/browse
    ├── PriorityView.swift         # Priority queue/leaderboard
    └── ProfileView.swift          # User profile
```

## Customization

### Brand Colors

To update the app with NMC^2's actual brand colors, edit `Theme/AppTheme.swift`:

```swift
// Replace these with NMC^2's actual brand colors
static let accentPrimary = Color(red: 0.0, green: 0.6, blue: 0.8) // Your brand color
static let accentSecondary = Color(red: 0.0, green: 0.7, blue: 0.9)
static let accentTertiary = Color(red: 0.2, green: 0.8, blue: 1.0)
```

## Requirements

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## Setup

1. Open the project in Xcode
2. Update the bundle identifier and signing settings
3. Customize colors in `AppTheme.swift` with NMC^2 brand colors
4. Build and run on simulator or device

## Views

### Dashboard
- Welcome header with technician name
- Key metrics: Open Orders, High Priority, Completed Today
- Weekly work order graph
- Featured assigned work orders

### Work Order Detail
- Large timer display for active work
- Equipment information
- Priority and status indicators
- Location and description details
- Play/pause timer controls

### Work Order List
- Date selector with day picker
- Work orders grouped by priority
- Quick add functionality
- Navigation to detail views

### Priority Queue
- Top priority work orders display
- Ranked lists by priority level
- Visual priority indicators
- Quick assignment interface

## Notes

- Sample data is included for demonstration
- Timer functionality is implemented in the detail view
- All views use the dark theme with customizable accent colors
- Navigation follows iOS Human Interface Guidelines

