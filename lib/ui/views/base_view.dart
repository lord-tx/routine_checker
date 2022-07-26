import 'package:flutter/material.dart';
import 'package:routine_checker/core/services/navigation_service.dart';
import 'package:routine_checker/ui/views/home.dart';
import 'package:routine_checker/ui/views/next_up.dart';
import 'package:routine_checker/ui/views/routine/routine_manip_view.dart';

class BaseView extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Routines"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => navigate(context, RoutineManip()),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "Routines"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: "Next Up"
            )
          ],
        ),
        body: PageView(
          children: const [
            Home(),
            NextUp(),
          ],
        )
    );
  }
}
