import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routine_checker/core/services/navigation_service.dart';
import 'package:routine_checker/model/routine_model.dart';
import 'package:routine_checker/providers/routine_provider.dart';
import 'package:routine_checker/ui/views/routine/routine_manip_view.dart';
import 'package:routine_checker/utils/text_styles.dart';

class RoutineView extends StatelessWidget {
  final Routine? routine;
  const RoutineView({Key? key, this.routine}) : super(key: key);

  /// Simple Navigation Function for OptionMenu
  void handleClick(int item, context) {
    switch (item) {
      case 0:
        navigate(context, RoutineManip(edit: true, routine: routine,));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        MaterialButton(
          onPressed: (){
            /// Mark Current Routine as Done
            Provider.of<RoutineProvider>(context, listen: false).markRoutine(routine!);
          },
          color: Colors.green,
          child: const Text("Done", style: TextStyles.routineTextMedium,),
        ),
      ],
      appBar: AppBar(
        title: Text(routine?.title ?? "Routine Title: "),
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) => handleClick(item, context),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(value: 0, child: Text('Edit Routine')),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Text(
              "Routine Description: \n\n${routine?.description ??
                  "This is an example routine for navigation purposes, If the"
                      "proper routine is selected and navigated to this page"
                      "should not appear"
                }",
              style: TextStyles.routineTextMedium,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Text(
              "Routine Performance: ${routine?.rpValue().toString() ?? "70%"}",
              style: TextStyles.routineTextMedium,
            ),
          ),
        ],
      ),
    );
  }
}
