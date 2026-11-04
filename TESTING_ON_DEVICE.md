# 📱 Testing on a Real Physical Android Device

This guide outlines the step-by-step process for running and testing this Flutter **Proof of Concept (POC)** application on a real physical Android smartphone or tablet.

---

## Prerequisites
- An Android physical device (phone or tablet running Android 6.0 or higher).
- A USB data cable compatible with your device and computer.
- Flutter SDK installed and configured on your development machine.

---

## Step 1: Enable Developer Options & USB Debugging
Before your computer can communicate with your phone for app installation and debugging, you must enable Developer Mode:

1. Open **Settings** on your Android device.
2. Scroll down and tap **About phone** (or *About device*).
3. Look for **Software information** (if applicable on your OS version).
4. Find **Build number** and tap it **7 times** consecutively. You will see a toast notification saying: *"You are now a developer!"*
5. Go back to the main **Settings** menu. A new option called **Developer options** will now be visible. Open it.
6. Scroll down and enable **USB debugging**.

---

## Step 2: Connect Your Device via USB
1. Connect your Android device to your computer using the USB cable.
2. On your phone screen, a prompt will appear asking: **"Allow USB debugging?"**
3. Check the box for **"Always allow from this computer"** and tap **Allow** (or *OK*).

---

## Step 3: Verify Device Connection
Open your terminal (or command line) and run the following command to check if Flutter recognizes your physical device:

```bash
flutter devices
```

You should see your physical device listed under the connected devices (e.g., Samsung, Xiaomi, Pixel, etc.).

---

## Step 4: Run the App on Your Device
You can launch the app onto your physical device using either of the following methods:

### Method A: Via Terminal
Run the flutter run command specifying your device (or let Flutter prompt you):
```bash
flutter run
```

### Method B: Via Android Studio
1. Open the project in **Android Studio**.
2. Look at the device dropdown selector in the top toolbar (next to the Run button).
3. Select your **connected physical device**.
4. Click the green **Run** (Play) button.

---

## 🛠️ Troubleshooting
- **Device not recognized?** Ensure your phone's USB connection mode is set to *File Transfer (MTP)* or *PTP*, and try reconnecting the cable or restarting the ADB server (`flutter doctor` or `adb kill-server && adb start-server`).
- **Authorization prompt missing?** Turn USB debugging off and on again in Developer Options, or unplug and replug the USB cable.
