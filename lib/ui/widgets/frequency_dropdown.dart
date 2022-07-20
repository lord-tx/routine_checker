import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  final List<String> frequency = [
    "Select Frequency",
    "Hourly",
    "Daily",
    "Weekly",
    "Monthly",
    "Yearly"
  ];

  String selectedValue = "Select Frequency";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: selectedValue,
        dropdownColor: Colors.grey[300],
        items: frequency.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value){
          setState((){
            selectedValue = value!;
          });
        }
    );
  }
}
