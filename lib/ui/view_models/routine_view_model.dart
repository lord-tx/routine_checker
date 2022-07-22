import 'package:cron/cron.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:routine_checker/core/enums/frequency_enum.dart';
import 'package:routine_checker/core/services/navigation_service.dart';
import 'package:routine_checker/model/routine_model.dart';
import 'package:routine_checker/providers/routine_provider.dart';

class RoutineViewModel{
  RoutineViewModel({required this.buildContext});

  final BuildContext buildContext;

  void createRoutine(String title, String description, String time){
    RoutineFrequency routineFrequency = Provider.of<RoutineProvider>(buildContext, listen: false).rf;
    Schedule schedule = routineFrequency.getFrequency(int.parse(time));

    Routine tempRoutine = Routine(title: title, description: description, schedule: schedule);
    Provider.of<RoutineProvider>(buildContext, listen: false).addRoutine(tempRoutine);
    popView(buildContext);
  }

  void editRoutine(int id, String title, String description){
    Provider.of<RoutineProvider>(buildContext, listen: false).editRoutine(
      id, title, description
    );
    popView(buildContext);
  }
}