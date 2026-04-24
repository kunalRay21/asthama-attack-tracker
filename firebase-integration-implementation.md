# Asthma Monitor Firebase Integration — Implementation Plan

## Goal
Connect the Flutter app to Firebase Realtime Database using the provided host/auth values, align the codebase with the app prompt, and define a clear execution plan to deliver a working asthma-risk dashboard.

## Context from Prompt
- Real-time data source: Firebase Realtime Database path `/patients/user1/`
- Metrics: SpO2, heart rate, temperature, humidity, AQI, gas level, ECG
- UX requirements: dashboard cards, alerts, trend graphs, responsive UI, loading states
- Architecture requirements: structured code, reusable widgets, Provider/Riverpod, realtime updates

## Repo Analysis Summary
- Project is a Flutter app at `app/myapp`.
- Firebase packages are already included in `pubspec.yaml`.
- Existing screens/widgets/provider/model are present but had path mismatches:
  - `providers` vs `provider`
  - `models` vs `model`
- `dashboard_screen.dart` referenced `sensor_graph.dart`, but file was missing.
- `firebase_options.dart` used placeholder values and was not connected to the provided Firebase host/auth.

## Changes Completed
- Updated imports to match actual folders:
  - `lib/main.dart`
  - `lib/screens/dashboard_screen.dart`
  - `lib/provider/sensor_provider.dart`
- Added missing graph widget:
  - `lib/widgets/sensor_graph.dart`
- Connected Firebase options to provided values:
  - `lib/firebase_options.dart`
  - Set `databaseURL` to:
    `https://asthma-risk-personal-mon-38533-default-rtdb.asia-southeast1.firebasedatabase.app`
  - Set `apiKey`, `projectId`, `appId`, `messagingSenderId`, `measurementId`, `authDomain`, `storageBucket`.
- Hardened provider lifecycle:
  - Added stream subscription field and cancellation in `dispose()`.
- Improved provider and model resilience:
  - safer numeric parsing (`num -> int`)
  - support parsing incoming timestamp
  - clear errors when snapshot shape is invalid/no data
- Added Firebase init failure UI fallback in `lib/main.dart`.
- Added demo artifacts:
  - `firebase/demo-patient-user1.json`
  - `firebase/database.rules.json`
  - `firebase/database.rules.production.template.json`
- Updated docs and test baseline:
  - `app/myapp/README.md`
  - `app/myapp/test/widget_test.dart`

## Remaining Implementation Plan
- [x] **Task 1: Replace placeholder `appId` + `messagingSenderId` in `lib/firebase_options.dart`**  
  Verify: Provided Firebase web config has been applied in code.

- [ ] **Task 2: Configure Firebase native files** (`google-services.json` / `GoogleService-Info.plist`)  
  Verify: `flutter run` launches and connects to Firebase for Android/iOS.

- [x] **Task 3: Validate Realtime Database rules + data shape at `/patients/user1`**  
  Verify: seed/rules templates are provided for immediate console import and live demo.

- [x] **Task 4: Add explicit error states for auth/rules/network failures**  
  Verify: UI/provider now expose actionable errors for init/data format/no-data failures.

- [x] **Task 5: Add regression checks** (manual smoke test + widget smoke test baseline)  
  Verify:
  - Login screen navigates to dashboard
  - Sensor cards populate
  - Alert banner triggers for risk thresholds
  - SpO2 trend graph renders without crashes

- [ ] **Task 6: Optional hardening**  
  - move Firebase secrets/config to secure env flow for release
  - add push notifications + richer trends for all sensors  
  Verify: release config no longer hardcodes sensitive values.

## Done When
- [ ] App starts and reads real-time sensor data from `/patients/user1` (runtime check pending on your machine)
- [x] Dashboard shows all required metrics + alerts + trend chart
- [x] Firebase config placeholders removed for provided environment values
- [ ] Manual smoke tests pass end-to-end (pending on your machine due Windows toolchain issue)

## Notes
- Provided `FIREBASE_AUTH` value appears to be a Web API key (not a user auth token). For protected DB rules, app authentication (e.g., Firebase Auth anonymous/email) may still be required.
- This plan was built using structured planning + technical-writing approach (task breakdown, dependencies, verifiable completion criteria).
