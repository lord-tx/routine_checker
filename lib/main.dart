import 'package:flutter/material.dart';
import 'package:routine_checker/ui/views/base_view.dart';


void main() {
  runApp(const RoutineChecker());
}

class RoutineChecker extends StatelessWidget {
  const RoutineChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routine Checker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BaseView()
    );
  }
}