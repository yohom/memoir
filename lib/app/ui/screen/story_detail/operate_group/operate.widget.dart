import 'package:flutter/material.dart';
import 'package:memoir/framework/res.dart';

///
/// 单个操作
///
class Operate extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  final EdgeInsets margin;

  const Operate({
    Key key,
    @required this.iconData,
    @required this.onTap,
    @required this.margin,
  }) : super(key: key);

  factory Operate.forDesignTime() {
    return Operate(
      iconData: Icons.add,
      onTap: () {},
      margin: EdgeInsets.all(space_normal),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: margin,
        elevation: elevation_normal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(space_normal),
          child: Icon(iconData),
        ),
      ),
    );
  }
}