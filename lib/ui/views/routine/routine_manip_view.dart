import 'package:flutter/material.dart';
import 'package:routine_checker/ui/widgets/frequency_dropdown.dart';
import 'package:routine_checker/utils/text_styles.dart';

/// This View handles Routine Manipulation (Adding / Editing) and provides the
/// interfaces to correspond with the preferred manipulation.


class RoutineManip extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  RoutineManip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      persistentFooterButtons: [
        MaterialButton(
          onPressed: (){},
          color: Colors.green,
          child: const Text("Done", style: TextStyles.routineTextMedium,),
        ),
      ],
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Title"),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Description"),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: TextField(
                maxLines: 10,
                controller: descriptionController,
                decoration: const InputDecoration(
                    border: InputBorder.none
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Frequency"),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const DropDown(),
            )
          ],
        ),
      ),
    );
  }
}
