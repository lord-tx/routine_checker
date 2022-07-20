import 'package:flutter/foundation.dart';
import 'package:routine_checker/model/routine_model.dart';

/// This class would house all Routine Objects to be manipulated by the UI

class RoutineProvider extends ChangeNotifier{
  Routine? selectedRoutine;
  List<Routine> routines = [];

  void selectRoutine(Routine routine) => selectedRoutine = routine;

  List<Routine> sortRoutines(){
    List<Routine> tempList = [];
    return tempList;
  }

  void addRoutine(Routine routine){
    routines.add(routine);
    notifyListeners();
  }
}