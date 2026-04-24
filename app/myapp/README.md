# Asthma Risk Personal Monitor (Flutter)

Realtime IoT dashboard app for asthma-risk monitoring using Firebase Realtime Database.

## Features
- Realtime sensor feed from Firebase RTDB (`/patients/user1`)
- Dashboard cards for:
  - SpO2
  - Heart Rate
  - Temperature
  - Humidity
  - AQI
  - Gas Level
  - ECG
- Risk alert banner (SpO2, heart rate, temperature, AQI)
- SpO2 trend graph (`fl_chart`)
- Login UI + responsive Material 3 dashboard

## Project Structure
- `lib/main.dart` - app bootstrap + Firebase init error handling
- `lib/provider/sensor_provider.dart` - realtime listener + alert logic
- `lib/model/sensor_data.dart` - model mapping
- `lib/screens/` - login + dashboard screens
- `lib/widgets/` - reusable cards, alert banner, trend chart

## Firebase Setup (already wired)
`lib/firebase_options.dart` contains the provided Firebase values:
- project: `asthma-risk-personal-mon-38533`
- database: `asthma-risk-personal-mon-38533-default-rtdb.asia-southeast1.firebasedatabase.app`

## Demo Data Seeding (for interview demo)
Use files in repo root:
- `firebase/demo-patient-user1.json`
- `firebase/database.rules.json` (temporary open rules for demo only)

### In Firebase Console
1. Open **Realtime Database**.
2. Import `firebase/demo-patient-user1.json` (or manually create `/patients/user1`).
3. For quick demo, paste rules from `firebase/database.rules.json`.

Expected node:
```json
{
  "patients": {
    "user1": {
      "spO2": 97.2,
      "heartRate": 82,
      "temperature": 36.8,
      "humidity": 51.4,
      "aqi": 43,
      "gasLevel": 78.6,
      "ecgValue": 1.12,
      "timestamp": "2026-04-24T10:30:00.000Z"
    }
  }
}
```

## Run
```bash
flutter pub get
flutter run -d chrome
```

> Recommended for quickest validation: **Chrome/Web**.

## Notes for Windows Desktop
If Windows build fails with linker errors (`LNK2019 __std_find_trivial_*`), that is a local MSVC toolchain mismatch, not app logic.

## Production Security Note
Do **not** keep open DB rules in production.
Use `firebase/database.rules.production.template.json` as a secure baseline.
