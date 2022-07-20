import 'package:flutter/material.dart';
import 'package:routine_checker/core/enums/tile_color_enum.dart';
import 'package:routine_checker/ui/widgets/tile_clock.dart';
import 'package:routine_checker/utils/text_styles.dart';

class RoutineTile extends StatelessWidget{
  final String? title;
  final DateTime? time;
  final bool? done;

  static const defaultTitle = "Routine Title XX";

  const RoutineTile({Key? key, this.title, this.time, this.done}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: tileColor(),
        borderRadius: BorderRadius.circular(20)
      ),
      child: ListTile(
        title: title != null ? Text(title!, style: TextStyles.routineTextMedium)
            : const Text(defaultTitle, style: TextStyles.routineTextMedium),
        trailing: const TileClock(),
        subtitle: Text(subtitleText(), style: TextStyles.routineTextSmall,),
      ),
    );
  }

  // LOGIC: Only return "done" or "missed" if the --done parameter of this
  //        widget is set.
  TileColor checkTileDone(){
    return (done != null) ?
      done! ?
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
