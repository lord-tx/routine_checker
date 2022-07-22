import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routine_checker/core/enums/frequency_enum.dart';
import 'package:routine_checker/providers/routine_provider.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  // DEFAULTS
  String? selectedValue = 'seconds';
  RoutineFrequency routineFrequency = RoutineFrequency.seconds;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: const Text("Select Frequency"),
      value: selectedValue,
      dropdownColor: Colors.grey[300],
      items: RoutineFrequency.values.map((val) {
        return DropdownMenuItem(
          value: val.name,
          child: Text(val.name),
        );
      }).toList(),
      onChanged: (value){
        setState((){
          selectedValue = value!;
          /// Pass the converted value of the enum back to the proper enum
          Provider.of<RoutineProvider>(
              context, listen: false).rf = routineFrequency.toEnum(value);
        });
      }
    );
  }
}
