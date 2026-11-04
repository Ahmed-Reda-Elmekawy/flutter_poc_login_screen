# 🚀 Flutter Proof of Concept (POC): Enterprise Accounting & Ledger App

<p align="center">
  <b>A comprehensive first-time Flutter development experience demonstrating a modern enterprise-grade Accounting & Financial Management application with rich UI/UX, responsive design, and Arabic (RTL) support.</b>
</p>

---

## 💡 About This POC (Proof of Concept)
This project represents my **first hands-on experience building a cross-platform mobile & web application using Flutter**. Designed as a production-ready **Proof of Concept (POC)** for an enterprise accounting platform (inspired by Zoho Books and QuickBooks), it explores core Flutter concepts, reactive state management, form validation, adaptive layouts, and smooth navigation.

---

## ✨ Key Features Implemented

### 1. 🔐 Smart Enterprise Login
- **Validation & Security:** Email & password validation with custom error handling.
- **Quick Demo Fill:** One-tap demo credential population (`quickDemoFill`) for instant evaluation.
- **Biometric Authentication:** Simulated fingerprint / Face ID quick login option.
- **Single Sign-On (SSO):** Google and Microsoft login buttons with feedback flows.
- **Password Recovery:** Interactive bottom sheet for secure password reset requests.

### 2. 📊 Financial Dashboard (`DashboardScreen`)
- **KPI Summary Cards:** Total Revenue, Total Expenses, Net Profit, and Pending Invoices with growth indicators.
- **Quick Actions Grid:** Instant access to Add Invoice, Financial Reports, Clients List, and System Settings.
- **Recent Transactions Ledger:** Detailed list of recent financial inflows and outflows with status icons.
- **Secure Logout:** Confirmation dialog returning safely to the authentication flow.

### 3. 📝 Company Onboarding & Sign-Up (`SignupScreen`)
- Comprehensive enterprise registration form (Company Name, Business Email, Phone Number, Password Confirmation).
- Terms and conditions agreement checkbox.
- Seamless navigation flow directly into the financial dashboard upon successful registration.

### 4. 📐 Responsive & Adaptive UI
- Fluid layout adaptation across mobile phones, tablets, and desktop viewports (`MediaQuery` breakpoints).
- Full **Right-to-Left (RTL)** localization support tailored for Arabic-speaking accountants and businesses.

---

## 🛠️ Tech Stack & Architecture
- **Framework:** Flutter (^3.13.7) / Dart
- **Design System:** Material 3 with custom Financial Color Palette (`AppColors`, `AppTheme`)
- **Architecture:** Clean component-based UI structure with modular screens (`login`, `dashboard`, `signup`) and core utilities (`validators`).

---

## 📂 Project Structure

```text
lib/
├── core/
│   ├── constants/
│   │   ├── app_colors.dart      # Corporate sapphire & financial emerald palette
│   │   └── app_strings.dart     # Localized Arabic text constants
│   ├── theme/
│   │   └── app_theme.dart       # Material 3 light theme configuration
│   └── utils/
│       └── validators.dart      # Form validation logic (email, password)
├── screens/
│   ├── dashboard/
│   │   └── dashboard_screen.dart # Financial metrics, KPIs & recent transactions
│   ├── login/
│   │   ├── login_screen.dart     # Authentication flow & SSO buttons
│   │   └── widgets/
│   │       └── forgot_password_sheet.dart # Password recovery sheet
│   └── signup/
│       └── signup_screen.dart    # Enterprise registration flow
├── widgets/
│   ├── app_logo.dart            # Brand logo and badge widget
│   ├── custom_button.dart       # Reusable button with loading state
│   ├── custom_text_field.dart   # Styled text input fields
│   └── social_login_button.dart # SSO provider button
└── main.dart                    # App entry point, RTL directionality & system UI
```

---

## 🚀 Getting Started

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/Ahmed-Reda-Elmekawy/flutter_poc_login_screen.git
   cd login_screen
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run Unit & Widget Tests:**
   ```bash
   flutter test
   ```

4. **Launch the App:**
   ```bash
   flutter run
   ```

---

## 📦 Building APK
To build a debug or release Android APK:
```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release
```

---

## 👨‍💻 Author
Developed by **Ahmed Reda Elmekawy** as a foundational exploration and Proof of Concept for Flutter mobile and web development.
