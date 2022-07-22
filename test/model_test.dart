import 'package:cron/cron.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:routine_checker/core/enums/routine_performance.dart';
import 'package:routine_checker/model/routine_model.dart';

void main(){
  test("Routine Object Proper Functionality", (){
    // Create a Routine Object
    // TODO: Thorough Testing
    Routine testRoutine = Routine(title: "", description: "", schedule: Schedule());
    expect(testRoutine.done, null);

    testRoutine
        .editTitle("New Title")
        .editDescription("New Description");

    expect(testRoutine.title == "New Title", true);
    expect(testRoutine.expiration == null, false);
  });

  test("Routine Performance", (){
    // Create a Routine Object
    // TODO: Ensure Routine Objects are not duplicated on task assignment
    Routine testRoutine = Routine(title: "", description: "", schedule: Schedule());
    expect(testRoutine.done, null);

    testRoutine
        .editTitle("New Title")
        .editDescription("New Description");

    testRoutine.addRoutinePerformance(RoutinePerformance.done);
    testRoutine.addRoutinePerformance(RoutinePerformance.done);
    testRoutine.addRoutinePerformance(RoutinePerformance.done);

    expect(testRoutine.rpValue(), 100.0);

    testRoutine.addRoutinePerformance(RoutinePerformance.missed);

    expect(testRoutine.rpValue(), 75.0);
  });
}