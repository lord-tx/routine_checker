import 'package:cron/cron.dart';
import 'package:flutter/foundation.dart';

/// This enum defines the frequency to which a routine can be set. It extends
/// to support conversion to cron scheduler and from String back to enumeration
/// value.

/// Always remind 5 minutes before time
const reminderTime = 5;
/// Minute Constant
const minuteConstant = 60;
/// Hour Constant
const hourConstant = 24;
/// Day Constant
const dayConstant = 7;
/// Week Constant
/// NOTE: This is not supposed to be a constant
const weekConstant = 4;
/// Month Constant
const monthConstant = 12;

enum RoutineFrequency{
  seconds,
  minutes,
  hours,
  days,
  weeks,
  months,
  years,
}
extension RoutineFrequencyExtension on RoutineFrequency {
  String get name => describeEnum(this);

  /// This function returns the Cron scheduler string correlating the time
  /// expected output.
  Schedule getFrequency(int time) {
    switch (this) {
      case RoutineFrequency.seconds:
        return Schedule(seconds: time);
      case RoutineFrequency.minutes:
        /// Only set reminder for 5 minutes if 
        /// preferred time is above 30 minutes
        if (time >= 30){
          return Schedule(minutes: (time - reminderTime));
        }
        return Schedule(minutes: time);
      case RoutineFrequency.hours:
        return Schedule(minutes: (time * minuteConstant) - reminderTime);
      case RoutineFrequency.days:
        return Schedule(minutes: (time * minuteConstant * hourConstant) - reminderTime);
      case RoutineFrequency.weeks:
        /// No default week - multiply by days
        return Schedule(minutes: 
          (time * minuteConstant * hourConstant * dayConstant) - reminderTime
        );
      case RoutineFrequency.months:
        return Schedule(minutes:
          (time * minuteConstant * hourConstant * dayConstant * weekConstant)
              - reminderTime);
        /// No default year - multiply by months
      case RoutineFrequency.years:
        return Schedule(minutes:
        (time * minuteConstant * hourConstant * dayConstant * weekConstant
            * monthConstant) - reminderTime);
    }
  }

  RoutineFrequency toEnum(String value){
    switch (value){
      case 'seconds':
        return RoutineFrequency.seconds;
      case 'minutes':
        return RoutineFrequency.minutes;
      case 'hours':
        return RoutineFrequency.hours;
      case 'days':
        return RoutineFrequency.days;
      case 'weeks':
        return RoutineFrequency.weeks;
      case 'months':
        return RoutineFrequency.months;
      case 'years':
        return RoutineFrequency.years;
      default:
        return RoutineFrequency.seconds;
    }
  }
}