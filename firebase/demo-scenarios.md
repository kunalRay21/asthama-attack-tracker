# Demo Scenarios (Realtime Database payloads)

Path in console: `/patients/user1`

## 1) Normal / Safe
```json
{
  "spO2": 97.8,
  "heartRate": 78,
  "temperature": 36.7,
  "humidity": 49.2,
  "aqi": 35,
  "gasLevel": 66.4,
  "ecgValue": 1.08,
  "timestamp": "2026-04-24T10:40:00.000Z"
}
```

## 2) Low SpO2 Alert
```json
{
  "spO2": 91.6,
  "heartRate": 90,
  "temperature": 37.0,
  "humidity": 53.1,
  "aqi": 47,
  "gasLevel": 75.2,
  "ecgValue": 1.05,
  "timestamp": "2026-04-24T10:41:00.000Z"
}
```

## 3) High Temperature Alert
```json
{
  "spO2": 96.4,
  "heartRate": 96,
  "temperature": 38.7,
  "humidity": 54.9,
  "aqi": 63,
  "gasLevel": 81.7,
  "ecgValue": 1.16,
  "timestamp": "2026-04-24T10:42:00.000Z"
}
```

## 4) Poor Air Quality Alert
```json
{
  "spO2": 95.9,
  "heartRate": 88,
  "temperature": 37.4,
  "humidity": 56.3,
  "aqi": 168,
  "gasLevel": 142.4,
  "ecgValue": 1.13,
  "timestamp": "2026-04-24T10:43:00.000Z"
}
```
