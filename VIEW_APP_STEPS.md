# Step-by-Step Guide: Viewing the Work Order Dashboard App

Follow these steps to see the app running on your Mac.

## Prerequisites
- Mac with macOS installed
- Xcode installed (download from Mac App Store if needed - it's free)
- Internet connection to clone the repository

---

## Step 1: Clone the Repository

1. **Open Terminal** on your Mac (Press `Cmd + Space`, type "Terminal", press Enter)

2. **Navigate to where you want the project** (optional):
   ```bash
   cd ~/Desktop
   ```
   (This puts it on your Desktop - you can use any folder)

3. **Clone the repository**:
   ```bash
   git clone https://github.com/anirvinKotaru/TechAssist.git
   ```

4. **Enter the project folder**:
   ```bash
   cd TechAssist
   ```

5. **Verify files are there**:
   ```bash
   ls
   ```
   You should see folders: `Models`, `Theme`, `Views` and files like `WorkOrderDashboardApp.swift`

---

## Step 2: Create Xcode Project

1. **Open Xcode** (Press `Cmd + Space`, type "Xcode", press Enter)

2. **Create a new project**:
   - Click **"Create a new Xcode project"** (or File → New → Project)
   - Select **"iOS"** tab at the top
   - Choose **"App"** template
   - Click **"Next"**

3. **Configure the project**:
   - **Product Name**: `WorkOrderDashboard`
   - **Team**: Select your Apple ID (or "None" if you don't have one)
   - **Organization Identifier**: `com.nmc2` (or anything like `com.yourname`)
   - **Interface**: Select **"SwiftUI"** ⚠️ (IMPORTANT!)
   - **Language**: Select **"Swift"**
   - **Storage**: "None" is fine
   - Click **"Next"**

4. **Choose save location**:
   - Navigate to your Desktop (or anywhere you want)
   - **IMPORTANT**: Create a NEW folder called `WorkOrderDashboard` or `WorkOrderApp`
   - Click **"Create"**

---

## Step 3: Add Files to Xcode Project

1. **Delete the default file**:
   - In Xcode's left sidebar (Project Navigator), find `ContentView.swift`
   - Right-click it → **"Delete"** → Choose **"Move to Trash"**

2. **Create folder groups**:
   - Right-click on the project name (blue icon at top of sidebar)
   - Select **"New Group"** → Name it `Models`
   - Repeat to create groups: `Theme` and `Views`

3. **Add files from the cloned repository**:
   
   **Option A: Drag and Drop (Easiest)**
   - Open Finder and navigate to the `TechAssist` folder you cloned
   - Drag these files into Xcode:
     - `WorkOrderDashboardApp.swift` → Drag to the root level (same level as the blue project icon)
     - `Models/WorkOrder.swift` → Drag into the `Models` group
     - `Theme/AppTheme.swift` → Drag into the `Theme` group
     - All files from `Views/` folder → Drag into the `Views` group
   
   **Option B: Add Files Menu**
   - Right-click on the project name → **"Add Files to [Project Name]"**
   - Navigate to the `TechAssist` folder
   - Select the files/folders
   - Make sure **"Copy items if needed"** is UNCHECKED (since files are already there)
   - Make sure your target is checked
   - Click **"Add"**

4. **Verify files are added**:
   - Check the left sidebar - you should see:
     - `WorkOrderDashboardApp.swift` (at root)
     - `Models` folder with `WorkOrder.swift`
     - `Theme` folder with `AppTheme.swift`
     - `Views` folder with all the view files

---

## Step 4: Build and Run the App

1. **Select a simulator**:
   - At the top of Xcode, next to the Play button, click the device selector
   - Choose **"iPhone 15 Pro"** or **"iPhone 14 Pro"** (any recent iPhone works)

2. **Build the project**:
   - Press **`Cmd + B`** (or Product → Build)
   - Wait for it to compile (should take 10-30 seconds)
   - If you see errors, see Troubleshooting below

3. **Run the app**:
   - Press **`Cmd + R`** (or click the Play ▶️ button)
   - The iOS Simulator will open automatically
   - The app will launch and you'll see the dashboard!

---

## Step 5: Explore the App

Once the app is running, you can:

1. **Dashboard Tab** (Home):
   - See welcome message and metrics
   - View weekly work order graph
   - See assigned work orders

2. **Work Orders Tab**:
   - Browse work orders by date
   - Filter by priority
   - Tap on work orders to see details

3. **Priority Tab**:
   - View priority queue
   - See ranked work orders
   - Check high/medium/low priority lists

4. **Profile Tab**:
   - View technician profile

5. **Tap on any work order** to see the detail view with timer

---

## Troubleshooting

### Error: "Cannot find 'AppTheme' in scope"
- Make sure `AppTheme.swift` is in the `Theme` group
- Make sure the file is added to your target (check Target Membership in File Inspector)

### Error: "Cannot find 'WorkOrder' in scope"
- Make sure `WorkOrder.swift` is in the `Models` group
- Check Target Membership

### Error: "No such module 'SwiftUI'"
- Make sure you selected **SwiftUI** when creating the project
- Check iOS Deployment Target is 15.0 or higher

### Build fails with multiple errors
- Make sure you deleted the default `ContentView.swift`
- Make sure `WorkOrderDashboardApp.swift` has `@main` attribute
- Try: Product → Clean Build Folder (Shift + Cmd + K), then build again

### Simulator doesn't open
- Go to Xcode → Settings → Platforms
- Download iOS Simulator if needed
- Or try: Xcode → Open Developer Tool → Simulator

### Files show red in Xcode
- The files might not be in the right location
- Delete them from Xcode (Remove Reference only)
- Re-add them using the drag-and-drop method

---

## Quick Reference Commands

```bash
# Clone repository
git clone https://github.com/anirvinKotaru/TechAssist.git
cd TechAssist

# View files
ls -la
```

**In Xcode:**
- Build: `Cmd + B`
- Run: `Cmd + R`
- Stop: `Cmd + .`
- Clean: `Shift + Cmd + K`

---

## Need Help?

If you get stuck:
1. Check that all files are in the correct groups
2. Make sure the project uses SwiftUI (not UIKit)
3. Verify iOS Deployment Target is 15.0+
4. Try cleaning the build folder and rebuilding

The app should run smoothly once all files are properly added to the Xcode project!

