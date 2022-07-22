import 'package:flutter/material.dart';
import 'package:routine_checker/core/enums/tile_color_enum.dart';
import 'package:routine_checker/core/services/navigation_service.dart';
import 'package:routine_checker/model/routine_model.dart';
import 'package:routine_checker/ui/views/routine/routine_view.dart';
import 'package:routine_checker/utils/text_styles.dart';

class RoutineTile extends StatelessWidget{
  final Routine? routine;
  static const defaultTitle = "Routine Title XX";

  const RoutineTile({Key? key, this.routine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: tileColor(),
        borderRadius: BorderRadius.circular(20)
      ),
      child: ListTile(
        title: routine?.title != null ? Text(routine!.title!, style: TextStyles.routineTextMedium)
            : const Text(defaultTitle, style: TextStyles.routineTextMedium),
        trailing: Container(
          width: 100,
          child: const Text("00:00s", style: TextStyles.routineTextMedium,),
          // TODO: Set Countdown timer
          // CountdownTimer(
          //   endTime: 9000,
          //   onEnd: () {
          //     Provider.of<RoutineProvider>(context, listen: false).markRoutine(routine!);
          //   },
          // ),
        ),
        subtitle: Text(subtitleText(), style: TextStyles.routineTextSmall,),
        onTap: (){
          navigate(context, RoutineView(routine: routine,));
        },
      ),
    );
  }

  // LOGIC: Only return "done" or "missed" if the --done parameter of this
  //        widget is set.
  TileColor checkTileDone(){
    return (routine?.done != null) ?
      routine!.done! ?
        TileColor.done
          :
        TileColor.missed
        :
      TileColor.pending;
  }

  // Return tileColor based on the current state of the tile
  Color tileColor() => checkTileDone().getColor;
  // Return subtitle based on the current state of the tile
  String subtitleText() => checkTileDone().name;
}
