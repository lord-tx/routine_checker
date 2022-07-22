import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:routine_checker/core/services/notification_service.dart';
import 'package:routine_checker/providers/routine_provider.dart';
import 'package:routine_checker/ui/widgets/routine_tile/routine_tile.dart';

/// This class would house al the elements added according to time-added

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RoutineProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.routines.length,
            itemBuilder: (context, index) {
              return Dismissible(
                // Each Dismissible must contain a Key. Keys allow Flutter to
                // uniquely identify widgets.
                  key: Key(provider.routines[index].id.toString()),
                  // Provide a function that tells the app
                  // what to do after an item has been swiped away.
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    // Then show a snackbar.
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                        SnackBar(
                            content: Text(
                                '${provider.routines[index].title} dismissed'))
                    );
                    // Remove the item from the data source.
                    setState(() {
                      provider.deleteRoutine(provider.routines[index]);
                    });
                  },
                  child: RoutineTile(routine: provider.routines[index]));
            },
          );
        }
    );
  }
}
