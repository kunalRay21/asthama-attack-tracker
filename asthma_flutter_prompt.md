# Asthma Risk Personal Monitor System - Flutter App Prompt

## 📱 Project Overview
Create a complete Flutter mobile application for an IoT-based **Asthma Risk Personal Monitor System**.  
The app should display real-time health and environmental data using Firebase.

---

## 🔥 Requirements

### 1. Firebase Integration
- Connect the app with **Firebase Realtime Database**
- Fetch real-time sensor data
- Example database path:
  ```
  /patients/user1/
  ```

---

### 2. Sensor Data to Display
- SpO2 (%)
- Heart Rate (BPM)
- Temperature (°C)
- Humidity (%)
- Air Quality Index (AQI)
- Gas Level (PPM)
- ECG Value

---

### 3. UI Design
- Modern and clean UI (similar to CREX style)
- Dashboard screen with cards for each sensor
- Graphs for real-time data visualization
- Color indicators:
  - 🟢 Green → Safe
  - 🔴 Red → Risk
- Fully responsive layout

---

### 4. Core Features
- Real-time updates using `StreamBuilder`
- Alert system:
  - Example: SpO2 < 94% → show warning
- Optional push notifications
- Loading indicators while fetching data

---

### 5. Code Requirements
- Well-structured and clean code
- Use `StatefulWidget`
- Separate reusable widgets
- Proper comments for understanding

---

### 6. Extra Features (Optional but Recommended)
- Smooth animations (scale / fade)
- Simple login screen
- Graphs using chart libraries
- State management using:
  - Provider / Riverpod

---

## ⚙️ Expected Output
- Complete working Flutter code
- `main.dart` + required widgets
- Firebase setup instructions
- Error-free and runnable project

---

## 🎯 Goal
Build a real-time asthma monitoring dashboard that helps in early detection of risk and provides a smooth, modern user experience.
