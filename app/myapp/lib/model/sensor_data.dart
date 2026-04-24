class SensorData {
  final double spO2;
  final int heartRate;
  final double temperature;
  final double humidity;
  final int aqi;
  final double gasLevel;
  final double ecgValue;
  final DateTime timestamp;

  SensorData({
    required this.spO2,
    required this.heartRate,
    required this.temperature,
    required this.humidity,
    required this.aqi,
    required this.gasLevel,
    required this.ecgValue,
    required this.timestamp,
  });

  // Convert from Firebase snapshot
  factory SensorData.fromMap(Map<dynamic, dynamic> map) {
    return SensorData(
      spO2: (map['spO2'] as num?)?.toDouble() ?? 0.0,
      heartRate: map['heartRate'] as int? ?? 0,
      temperature: (map['temperature'] as num?)?.toDouble() ?? 0.0,
      humidity: (map['humidity'] as num?)?.toDouble() ?? 0.0,
      aqi: map['aqi'] as int? ?? 0,
      gasLevel: (map['gasLevel'] as num?)?.toDouble() ?? 0.0,
      ecgValue: (map['ecgValue'] as num?)?.toDouble() ?? 0.0,
      timestamp: DateTime.now(),
    );
  }

  // Convert to Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'spO2': spO2,
      'heartRate': heartRate,
      'temperature': temperature,
      'humidity': humidity,
      'aqi': aqi,
      'gasLevel': gasLevel,
      'ecgValue': ecgValue,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}