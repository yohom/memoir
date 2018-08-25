import 'package:flutter/material.dart';
import 'package:memoir/app/res/drawable.dart';

///
/// 心情
///
class Mood extends StatelessWidget {
  final double size;

  const Mood({
    Key key,
    this.size = 96.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      RIcons.happy,
      color: Colors.white.withOpacity(0.5),
      size: size,
    );
  }
}
