import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TileClock extends StatelessWidget {
  const TileClock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          return Center(
            child: Text(
              DateFormat('MM/dd/yyyy hh:mm:ss').format(DateTime.now()),
            ),
          );
        },
      ),
    );
  }
}
