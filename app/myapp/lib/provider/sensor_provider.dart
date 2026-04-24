import 'package:flutter/foundation.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/sensor_data.dart';

class SensorProvider extends ChangeNotifier {
  SensorData? _sensorData;
  bool _isLoading = true;
  String? _error;
  List<SensorData> _historicalData = [];

  SensorData? get sensorData => _sensorData;
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<SensorData> get historicalData => _historicalData;

  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref('patients/user1');

  SensorProvider() {
    _initializeRealTimeListener();
  }

  void _initializeRealTimeListener() {
    _dbRef.onValue.listen((event) {
      try {
        if (event.snapshot.exists) {
          final data = event.snapshot.value as Map<dynamic, dynamic>;
          _sensorData = SensorData.fromMap(data);
          _historicalData.add(_sensorData!);
          if (_historicalData.length > 100) {
            _historicalData.removeAt(0);
          }
          _error = null;
        }
        _isLoading = false;
        notifyListeners();
      } catch (e) {
        _error = 'Error fetching data: $e';
        _isLoading = false;
        notifyListeners();
      }
    }, onError: (error) {
      _error = 'Firebase Error: $error';
      _isLoading = false;
      notifyListeners();
    });
  }

  // Alert system check
  bool isSpO2Low() => _sensorData != null && _sensorData!.spO2 < 94;
  bool isHeartRateAbnormal() => _sensorData != null && (_sensorData!.heartRate < 60 || _sensorData!.heartRate > 100);
  bool isTemperatureHigh() => _sensorData != null && _sensorData!.temperature > 38;
  bool isAQIHigh() => _sensorData != null && _sensorData!.aqi > 150;

  String getAlertMessage() {
    if (isSpO2Low()) return 'Warning: SpO2 level is low!';
    if (isHeartRateAbnormal()) return 'Warning: Heart rate is abnormal!';
    if (isTemperatureHigh()) return 'Warning: Temperature is high!';
    if (isAQIHigh()) return 'Warning: Air quality is poor!';
    return '';
  }

  @override
  void dispose() {
    super.dispose();
  }
}