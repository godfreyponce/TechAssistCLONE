# TechAssist2 Project Structure

## Directory Organization

```
TechAssist2/
├── TechAssist2/
│   ├── TechAssist2App.swift          # App entry point
│   │
│   ├── Models/                        # Data models
│   │   └── WorkOrder.swift           # Work order data model
│   │
│   ├── Views/                         # SwiftUI views
│   │   ├── ContentView.swift         # Main tab view container
│   │   ├── DashboardView.swift       # Dashboard/home screen
│   │   ├── WorkOrderListView.swift   # Work orders list
│   │   ├── WorkOrderDetailView.swift # Work order detail screen
│   │   ├── PriorityView.swift        # Priority queue view
│   │   ├── ProfileView.swift         # User profile view
│   │   └── LoginView.swift           # Authentication login screen
│   │
│   ├── ViewModels/                    # View models
│   │   └── AuthenticationViewModel.swift  # Auth state management
│   │
│   ├── Services/                      # Business logic services
│   │   ├── AuthService.swift         # Auth0 authentication service
│   │   └── FirebaseService.swift     # Firebase/Firestore service
│   │
│   ├── Utilities/                     # Helper utilities
│   │   └── AppTheme.swift            # App theme and colors
│   │
│   ├── Assets.xcassets/               # App assets (icons, colors)
│   ├── GoogleService-Info.plist      # Firebase configuration
│   └── Info.plist                     # App configuration
│
├── TechAssist2Tests/                  # Unit tests
├── TechAssist2UITests/                # UI tests
└── Documentation/                     # Project documentation
    ├── QUICK_START.md
    └── SETUP_AUTH0_FIREBASE.md
```

## File Organization Principles

1. **Models/**: All data models and structures
2. **Views/**: All SwiftUI views and UI components
3. **ViewModels/**: View models that manage state and business logic
4. **Services/**: Services that handle external integrations (Auth0, Firebase)
5. **Utilities/**: Helper classes, extensions, and utilities (Theme, etc.)
6. **Root**: Only the main app file (`TechAssist2App.swift`)

## Benefits of This Structure

- **Clear Separation**: Each type of file has its own folder
- **Easy Navigation**: Easy to find files by their purpose
- **Scalable**: Easy to add new files as the app grows
- **Maintainable**: Clear organization makes code easier to maintain

