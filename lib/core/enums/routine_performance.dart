import 'package:flutter/foundation.dart';

/// This enum defines the constraints of a value depicting RoutinePerformance
/// Built with forward compatibility for extensibility and weight-based
/// performance values e.g x2 or x3 points
enum RoutinePerformance{
  done,
  missed,
}
extension RoutinePerformanceExtension on RoutinePerformance {
  String get name => describeEnum(this);

  /// This function simply returns the weight value of an RP (Routine Perf)
  int get getPerformance {
    switch (this) {
      case RoutinePerformance.done:
        return 1;
      case RoutinePerformance.missed:
        return 0;
      default:
        return 0;
    }
  }
}