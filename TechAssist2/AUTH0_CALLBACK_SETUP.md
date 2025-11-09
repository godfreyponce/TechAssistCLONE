# Auth0 Callback URL Setup Guide

## ✅ Info.plist Configuration

The `Info.plist` file has been configured with the URL scheme: `techassist2`

## 🔧 Auth0 Dashboard Configuration Required

You need to configure the callback URLs in your Auth0 Dashboard:

### Step 1: Go to Auth0 Dashboard
1. Navigate to [Auth0 Dashboard](https://manage.auth0.com/)
2. Go to **Applications** → **Applications**
3. Select your TechAssist2 application

### Step 2: Configure Allowed Callback URLs
1. Scroll down to **Allowed Callback URLs**
2. Add the following URL (one per line):
   ```
   techassist2://dev-frosjzi3e85zszxa.us.auth0.com/ios/com.leosantos.TechAssist2/callback
   ```

### Step 3: Configure Allowed Logout URLs
1. Scroll down to **Allowed Logout URLs**
2. Add the following URL (one per line):
   ```
   techassist2://dev-frosjzi3e85zszxa.us.auth0.com/ios/com.leosantos.TechAssist2/callback
   ```

### Step 4: Save Changes
1. Scroll to the bottom of the page
2. Click **Save Changes**

## 📝 Callback URL Format Explanation

The callback URL follows this format:
```
{URL_SCHEME}://{AUTH0_DOMAIN}/ios/{BUNDLE_ID}/callback
```

Where:
- **URL_SCHEME**: `techassist2` (defined in Info.plist)
- **AUTH0_DOMAIN**: `dev-frosjzi3e85zszxa.us.auth0.com` (your Auth0 domain)
- **BUNDLE_ID**: `com.leosantos.TechAssist2` (your app's bundle identifier)

## 🔍 Verification

After configuring:
1. Clean build folder in Xcode (Shift+Cmd+K)
2. Rebuild and run the app
3. Try logging in - the callback URL mismatch error should be resolved

## 🐛 Troubleshooting

If you still get callback URL mismatch errors:

1. **Verify URL Scheme in Xcode**:
   - Target → Info → URL Types
   - Make sure `techassist2` is listed

2. **Verify Bundle ID**:
   - Target → General → Bundle Identifier
   - Should be: `com.leosantos.TechAssist2`

3. **Check Auth0 Dashboard**:
   - Make sure the callback URLs are exactly as shown above
   - No extra spaces or characters
   - URLs are on separate lines if you have multiple

4. **Clean and Rebuild**:
   - Product → Clean Build Folder
   - Delete derived data
   - Rebuild the project

