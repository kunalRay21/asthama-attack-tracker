# Interview Handoff — Asthma Risk Personal Monitor

## What is completed
- Firebase RTDB integrated in Flutter app.
- Realtime dashboard implemented with Provider listener at:
  - `patients/user1`
- All required sensors displayed:
  - SpO2, heartRate, temperature, humidity, AQI, gasLevel, ecgValue
- Alert system implemented:
  - SpO2 < 94
  - HR outside 60-100
  - Temp > 38
  - AQI > 150
- SpO2 trend chart implemented (`fl_chart`).
- Login screen + dashboard flow complete.
- Error handling for Firebase init and data shape issues added.
- Widget smoke test added and passing.
- Web build successful.

## Proof checks already executed
- `dart analyze lib test` ✅ no issues
- `flutter test` ✅ pass
- `flutter build web` ✅ success

## Why Windows run failed
- Local machine linker/toolchain mismatch (`LNK2019 __std_find_trivial_*`) from MSVC setup.
- This is environment-specific, not app logic.
- Web build succeeds and is the recommended demo target.

## Exact files for demo setup
- `firebase/demo-patient-user1.json` → import into Realtime Database
- `firebase/database.rules.json` → temporary open rules for interview demo
- `firebase/database.rules.production.template.json` → secure template for real deployment

## Run commands (recommended)
```bash
cd app/myapp
flutter pub get
flutter run -d chrome
```

## Firebase path expected by app
```text
/patients/user1
```

## Example realtime payload
```json
{
  "spO2": 97.2,
  "heartRate": 82,
  "temperature": 36.8,
  "humidity": 51.4,
  "aqi": 43,
  "gasLevel": 78.6,
  "ecgValue": 1.12,
  "timestamp": "2026-04-24T10:30:00.000Z"
}
```
