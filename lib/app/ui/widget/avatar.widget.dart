import 'package:flutter/material.dart';
import 'package:memoir/app/ui/animation/show_up.transition.dart';
import 'package:memoir/framework/res.dart';

class Avatar extends StatelessWidget {
  final double width;
  final double height;

  const Avatar({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowUpTransition(
      child: SizedBox(
        width: width,
        height: height,
        child: Material(
          elevation: kElevationBig,
          borderRadius: BorderRadius.circular(90.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/reflectly-face.gif'),
          ),
        ),
      ),
    );
  }
}
