import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sensor_provider.dart';
import '../widgets/sensor_card.dart';
import '../widgets/alert_banner.dart';
import '../widgets/sensor_graph.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Dashboard'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer<SensorProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (provider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(provider.error ?? 'Unknown error'),
                ],
              ),
            );
          }

          final sensorData = provider.sensorData;
          if (sensorData == null) {
            return const Center(
              child: Text('No data available'),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                // Alert Banner
                if (provider.getAlertMessage().isNotEmpty)
                  AlertBanner(message: provider.getAlertMessage()),

                // Sensor Cards Grid
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      SensorCard(
                        label: 'SpO2',
                        value: sensorData.spO2.toStringAsFixed(1),
                        unit: '%',
                        icon: Icons.favorite,
                        isWarning: provider.isSpO2Low(),
                        normalRange: '94-100',
                      ),
                      SensorCard(
                        label: 'Heart Rate',
                        value: sensorData.heartRate.toString(),
                        unit: 'BPM',
                        icon: Icons.favorite_border,
                        isWarning: provider.isHeartRateAbnormal(),
                        normalRange: '60-100',
                      ),
                      SensorCard(
                        label: 'Temperature',
                        value: sensorData.temperature.toStringAsFixed(1),
                        unit: '°C',
                        icon: Icons.thermostat,
                        isWarning: provider.isTemperatureHigh(),
                        normalRange: '36.5-37.5',
                      ),
                      SensorCard(
                        label: 'Humidity',
                        value: sensorData.humidity.toStringAsFixed(1),
                        unit: '%',
                        icon: Icons.water_drop,
                        isWarning: false,
                        normalRange: '40-60',
                      ),
                      SensorCard(
                        label: 'Air Quality',
                        value: sensorData.aqi.toString(),
                        unit: 'AQI',
                        icon: Icons.air,
                        isWarning: provider.isAQIHigh(),
                        normalRange: '0-50',
                      ),
                      SensorCard(
                        label: 'Gas Level',
                        value: sensorData.gasLevel.toStringAsFixed(2),
                        unit: 'PPM',
                        icon: Icons.cloud,
                        isWarning: false,
                        normalRange: '< 100',
                      ),
                    ],
                  ),
                ),

                // ECG Value
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SensorCard(
                    label: 'ECG Value',
                    value: sensorData.ecgValue.toStringAsFixed(2),
                    unit: 'mV',
                    icon: Icons.show_chart,
                    isWarning: false,
                    normalRange: '0.5-2.0',
                  ),
                ),

                const SizedBox(height: 24),

                // Graph Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'SpO2 Trend',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SensorGraph(data: provider.historicalData),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}