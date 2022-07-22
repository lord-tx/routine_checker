import 'package:collection/collection.dart';
import 'package:cron/cron.dart';
import 'package:flutter/foundation.dart';
import 'package:routine_checker/core/enums/routine_performance.dart';

/// The Routine Class houses the variables and functionality of all
/// Routine objects, this class core should only be added to and not
/// removed as some functionality might be in use.

// For the purpose of this test, all routines should expire after 15 minutes
const defaultExpiry = Duration(minutes: 15);

class Routine{
  Routine({
    required this.title,
    required this.description,
    required this.schedule,
    this.frequency,
    this.done,
}){
    id = generateId();
    if (kDebugMode) {
      print(id);
    }
  }

  // Basis Routine Information
  int? id;
  String? title;
  String? description;
  Schedule? schedule;
  String? frequency;
  Duration? expiration = defaultExpiry;
  List<int> routinePerformance = [];
  bool? done;
  bool? activate;

  // Basic Routine Functionality
  // Introduce chaining to reduce initialization complexity
  Routine editTitle(String newTitle){
    title = newTitle;
    return this;
  }

  Routine editDescription(String newDesc){
    description = newDesc;
    return this;
  }


  // Boolean activation omitted from chaining
  void markDone() => done = true;
  void addRoutinePerformance(RoutinePerformance rp){
    routinePerformance.add(rp.getPerformance);
  }

  // This function computes the routine performance value
  double rpValue(){
    try {
      double temp =  routinePerformance.average;
      // Multiply Value by 100 to get percentage
      return temp * 100;
    } catch(e) {
      return 0;
    }
  }

  int generateId(){
    return DateTime.now().millisecondsSinceEpoch.toInt();
  }
}