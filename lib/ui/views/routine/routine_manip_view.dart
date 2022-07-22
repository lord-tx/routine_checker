import 'package:flutter/material.dart';
import 'package:routine_checker/model/routine_model.dart';
import 'package:routine_checker/ui/view_models/routine_view_model.dart';
import 'package:routine_checker/ui/widgets/frequency_dropdown.dart';
import 'package:routine_checker/utils/text_styles.dart';

/// This View handles Routine Manipulation (Adding / Editing) and provides the
/// interfaces to correspond with the preferred manipulation.


class RoutineManip extends StatefulWidget {
  /// Parameters used in Edit (Manip) mode
  final bool edit;
  final Routine? routine;

  const RoutineManip({Key? key, this.edit = false, this.routine}) : super(key: key);

  @override
  State<RoutineManip> createState() => _RoutineManipState();
}

class _RoutineManipState extends State<RoutineManip> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.routine?.title ?? "";
    descriptionController.text = widget.routine?.description ?? "";
    timeController.text = widget.routine?.frequency ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      persistentFooterButtons: [
        MaterialButton(
          onPressed: (){
            RoutineViewModel viewModel = RoutineViewModel(buildContext: context);
            if (widget.edit){
              viewModel.editRoutine(
                  widget.routine?.id ?? 0,
                  titleController.text,
                  descriptionController.text,
              );
            } else {
              viewModel.createRoutine(
                  titleController.text,
                  descriptionController.text,
                  timeController.text
              );
            }
          },
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
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: TextField(
                    maxLength: 2,
                    controller: timeController,
                    decoration: const InputDecoration(
                      hintText: "0",
                      counterText: "",
                      border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const DropDown(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
