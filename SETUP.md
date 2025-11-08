# Setup Instructions

## Creating the Xcode Project

1. **Open Xcode** and select "Create a new Xcode project"

2. **Choose a template:**
   - Select "iOS" → "App"
   - Click "Next"

3. **Configure the project:**
   - Product Name: `WorkOrderDashboard`
   - Team: Select your development team
   - Organization Identifier: `com.nmc2` (or your organization)
   - Interface: **SwiftUI**
   - Language: **Swift**
   - Click "Next" and choose a location

4. **Add the source files:**
   - Delete the default `ContentView.swift` that Xcode creates
   - Copy all the files from this project into your Xcode project:
     - `WorkOrderDashboardApp.swift` → Root level
     - `Models/WorkOrder.swift` → Create a "Models" group and add it
     - `Theme/AppTheme.swift` → Create a "Theme" group and add it
     - All files from `Views/` → Create a "Views" group and add them

5. **Update the App file:**
   - Make sure `WorkOrderDashboardApp.swift` is set as the main entry point
   - The `@main` attribute should be on `WorkOrderDashboardApp`

6. **Build and Run:**
   - Select a simulator (iPhone 14 Pro recommended)
   - Press Cmd+R to build and run

## Customizing NMC^2 Brand Colors

1. Open `Theme/AppTheme.swift`
2. Replace the `accentPrimary`, `accentSecondary`, and `accentTertiary` colors with NMC^2's actual brand colors
3. You can use hex colors like this:
   ```swift
   static let accentPrimary = Color(hex: "#YOUR_HEX_CODE")
   ```

   Or RGB values:
   ```swift
   static let accentPrimary = Color(red: 0.0, green: 0.6, blue: 0.8)
   ```

## Testing

The app includes sample work order data. To test:
- Navigate between tabs using the bottom tab bar
- Tap on work orders to see detail views
- Use the timer in the work order detail view
- Filter work orders by date in the list view

## Next Steps

- Connect to your backend API
- Implement authentication
- Add real-time updates
- Customize with NMC^2 branding assets (logos, icons)
- Add push notifications for new work orders

