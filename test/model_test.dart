import 'package:flutter_test/flutter_test.dart';
import 'package:routine_checker/model/routine_model.dart';

void main(){
  test("Routine Object Proper Functionality", (){
    // Create a Routine Object
    Routine testRoutine = Routine(id: 1, title: "", description: "");
    expect(testRoutine.done, false);

    testRoutine
        .editTitle("New Title")
        .editDescription("New Description")
        .setExpiration();

    expect(testRoutine.title == "New Title", true);
    expect(testRoutine.expiration == null, true);
  });
}