import '../core/utils.dart';
import '../models/track_point.dart';

class ActivityService {
  final List<TrackPoint> _points = [];

  double totalDistance = 0;
  double maxSpeed = 0;

  void addPoint(TrackPoint point) {
    if (_points.isNotEmpty) {
      final prev = _points.last;
      totalDistance += haversineDistance(
        prev.latitude,
        prev.longitude,
        point.latitude,
        point.longitude,
      );
    }

    if (point.speed > maxSpeed) {
      maxSpeed = point.speed;
    }

    _points.add(point);
  }

  double get averageSpeed {
    if (_points.length < 2) return 0;
    final duration = _points.last.timestamp
        .difference(_points.first.timestamp)
        .inSeconds;
    return duration > 0 ? totalDistance / duration : 0;
  }

  Duration get totalTime {
    if (_points.length < 2) return Duration.zero;
    return _points.last.timestamp.difference(_points.first.timestamp);
  }

  List<TrackPoint> get points => _points;
}
