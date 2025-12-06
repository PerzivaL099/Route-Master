// lib/models/run.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class Run {
  final String id;
  final String userId;
  final DateTime startTime;
  final int durationSeconds;
  final double distanceKm;
  final double averagePaceMinPerKm;
  final String notes;
  final String? imageUrl;
  final List<GeoPoint> routeCoordinates;

  Run({
    required this.id,
    required this.userId,
    required this.startTime,
    required this.durationSeconds,
    required this.distanceKm,
    required this.averagePaceMinPerKm,
    this.notes = '',
    this.imageUrl,
    required this.routeCoordinates,
  });

  factory Run.fromFirestore(Map<String, dynamic> data, String documentId) {
    final Timestamp timestamp = data['startTime'] as Timestamp;
    
    return Run(
      id: documentId,
      userId: data['userId'] ?? '',
      startTime: timestamp.toDate(),
      durationSeconds: data['durationSeconds'] ?? 0,
      distanceKm: data['distanceKm'] ?? 0.0,
      averagePaceMinPerKm: data['averagePaceMinPerKm'] ?? 0.0,
      notes: data['notes'] ?? '',
      imageUrl: data['imageUrl'] as String?,
      routeCoordinates: (data['routeCoordinates'] as List? ?? [])
          .map((geo) => geo as GeoPoint)
          .toList(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'startTime': Timestamp.fromDate(startTime),
      'durationSeconds': durationSeconds,
      'distanceKm': distanceKm,
      'averagePaceMinPerKm': averagePaceMinPerKm,
      'notes': notes,
      'imageUrl': imageUrl,
      'routeCoordinates': routeCoordinates,
    };
  }
}