import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum TileColor{
  pending,
  done,
  missed
}
extension TileColorExtension on TileColor {
  String get name => describeEnum(this);
  // TODO: Abstract Color Definition from Primary View to Utility
  Color get getColor {
    switch (this) {
      case TileColor.pending:
        return Colors.grey;
      case TileColor.done:
        return Colors.green;
      case TileColor.missed:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}