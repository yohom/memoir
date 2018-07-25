import 'package:flutter/material.dart';
import 'package:memoir/app/ui/animation/transition.dart';
import 'package:memoir/app/ui/screen/edit_story/lets_do_it.widget.dart';
import 'package:memoir/app/ui/screen/edit_story/select_date.widget.dart';
import 'package:memoir/app/ui/widget/avatar.widget.dart';

///
/// 内容
///
class Content extends StatelessWidget {
  const Content({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Avatar(),
        FadeInSlideUpTransition(
          delay: 300,
          child: Text(
            'Hello Hello Hello Hello Hello',
            style: Theme
                .of(context)
                .textTheme
                .headline
                .copyWith(color: Colors.white70),
          ),
        ),
        SelectDate(),
        LetsDoIt(),
      ],
    );
  }
}