import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../models/track_point.dart';
import '../services/activity_service.dart';
import '../services/gps_service.dart';
import '../services/map_service.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final ActivityService activity = ActivityService();
  StreamSubscription<Position>? sub;

  LatLng? currentLatLng;
  String? tilePath;

  @override
  void initState() {
    super.initState();
    loadTiles();
    startTracking();
  }

  Future<void> loadTiles() async {
    tilePath = await MapService.getTilePath();
    setState(() {});
  }

  Future<void> startTracking() async {
    final ok = await GpsService.requestPermission();
    if (!ok) return;

    sub = GpsService.getPositionStream().listen((pos) {
      final point = TrackPoint(
        latitude: pos.latitude,
        longitude: pos.longitude,
        altitude: pos.altitude,
        timestamp: DateTime.now(),
        speed: pos.speed,
      );

      setState(() {
        activity.addPoint(point);
        currentLatLng = LatLng(pos.latitude, pos.longitude);
      });
    });
  }

  @override
  void dispose() {
    sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentLatLng == null || tilePath == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Tracking')),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: currentLatLng!,
                initialZoom: 17,
                keepAlive: true,
              ),
              children: [
                TileLayer(
                  tileProvider: FileTileProvider(),
                  urlTemplate: '$tilePath/{z}/{x}/{y}.png',
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: activity.points
                          .map((p) => LatLng(p.latitude, p.longitude))
                          .toList(),
                      strokeWidth: 4,
                      color: Colors.orange,
                    ),
                  ],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: currentLatLng!,
                      width: 40,
                      height: 40,
                      child: const Icon(
                        Icons.directions_run,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Distance: ${(activity.totalDistance / 1000).toStringAsFixed(2)} km',
                  ),
                  Text(
                    'Avg Speed: ${(activity.averageSpeed * 3.6).toStringAsFixed(1)} km/h',
                  ),
                  Text(
                    'Max Speed: ${(activity.maxSpeed * 3.6).toStringAsFixed(1)} km/h',
                  ),
                  Text(
                    'Time: ${activity.totalTime.toString().split('.').first}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
