import 'package:flutter/material.dart';
import 'package:routine_checker/ui/widgets/routine_tile/routine_tile.dart';

/// This class would house al the elements added according to time-added

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        RoutineTile(done: true,),
        RoutineTile(),
        RoutineTile(done: false),
        RoutineTile(),
        RoutineTile(),
        RoutineTile(),
        RoutineTile(),
        RoutineTile(done: true,),
        RoutineTile(),
        RoutineTile(),
        RoutineTile(done: true,),
        RoutineTile(),
        RoutineTile(),
      ],
    );
  }
}
