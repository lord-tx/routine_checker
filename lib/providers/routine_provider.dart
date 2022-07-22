import 'package:cron/cron.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:routine_checker/core/enums/frequency_enum.dart';
import 'package:routine_checker/core/enums/routine_performance.dart';
import 'package:routine_checker/core/services/notification_service.dart';
import 'package:routine_checker/model/routine_model.dart';

/// This class would house all Routine Objects to be manipulated by the UI

class RoutineProvider extends ChangeNotifier{
  Routine? selectedRoutine;
  /// Keep an indexed list of Routines
  List<Routine> routines = [];
  /// Map routines to cronJobs
  Map<Routine, Cron> cronRoutineMap = {};
  /// Store Routine Object Parameter for creating Routine Object
  RoutineFrequency rf = RoutineFrequency.seconds; // DEFAULT

  void selectRoutine(Routine routine) => selectedRoutine = routine;

  /// Function to Sort the routines according to cronJob
  List<Routine> sortRoutines(){
    List<Routine> tempList = [];
    // TODO: Thursday
    return tempList;
  }

  /// Creates a new Routine with Schedule and Cron
  void addRoutine(Routine routine) async {
    routines.add(routine);
    Cron cronJob = Cron();
    cronRoutineMap[routine] = cronJob;
    // Create a work manager or cron to manage the routine.

    /// Notification Time is 5 minutes before Set time

    cronRoutineMap[routine]?.schedule(routine.schedule!, () async => {
      await _showNotification(routine),
      if (routine.done != null){
        if (!routine.done!)
          routine.activate = true
      },
      if (kDebugMode) {
        print("Notification")
      }
    });

    notifyListeners();
  }

  /// Edits existing routine with information
  void editRoutine(int id, String title, String description) async {
    Routine? routine = getRoutine(id);
    routine?.title = title;
    routine?.description = description;
  }

  /// Function to mark a particular routine as done i.e.
  void markRoutine(Routine routine, {bool missed = false}){
    int index = routines.indexOf(routine);
    if (missed == false){
      routines[index].addRoutinePerformance(RoutinePerformance.done);
      routines[index].markDone();
      addRoutine(routines[index]);
    } else {
      routines[index].addRoutinePerformance(RoutinePerformance.missed);
    }

  }

  void missRoutine(Routine routine){

  }

  /// This function removes a routine and closes its corresponding cronJob
  void deleteRoutine(Routine routine) async {
    routines.remove(routine);
    cronRoutineMap[routine]?.close();
  }

  /// This function uses the Flutter Local Notification Plugin to show
  /// notifications of routines.
  Future<void> _showNotification(Routine routine) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, routine.title, routine.description, platformChannelSpecifics,
        payload: routine.id.toString());
  }

  /// Return null to indicate possible prior deletion of routine
  Routine? getRoutine(int id){
    for (Routine routine in routines){
      if (routine.id == id){
        return routine;
      }
    }
    return null;
  }
}