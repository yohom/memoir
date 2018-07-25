import 'package:flutter/material.dart';
import 'package:memoir/app/model/bean/story.dart';
import 'package:memoir/framework/res.dart';
import 'package:memoir/framework/ui.dart';

///
/// 历史Story对应的Card
///
class HistoryStoryCard extends StatelessWidget {
  final Story story;
  final double elevation;

  HistoryStoryCard({
    Key key,
    @required this.story,
    @required this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pinkAccent,
      elevation: elevation,
      margin: EdgeInsets.only(bottom: space_huge, right: space_normal),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          SizedBox.expand(child: ImageWidget(imageUrl: story.storyImage)),
          Stack(
            children: <Widget>[
              Positioned(
                left: 24.0,
                top: 48.0,
                child: _StoryDate(storyDate: story.formatStoryDate),
              ),
              Positioned(
                right: 24.0,
                top: 48.0,
                child: _Favorite(),
              ),
              Positioned(
                left: 24.0,
                bottom: 24.0,
                child: _StoryTitle(title: story.title),
              ),
              Positioned(
                right: 24.0,
                bottom: 24.0,
                child: _Mood(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

///
/// story日期
///
class _StoryDate extends StatelessWidget {
  const _StoryDate({
    Key key,
    @required this.storyDate,
  }) : super(key: key);

  final List<String> storyDate;

  @override
  Widget build(BuildContext context) {
    final dayTheme = Theme
        .of(context)
        .textTheme
        .headline
        .copyWith(color: Colors.white, fontWeight: FontWeight.bold);

    final monthTheme =
        Theme.of(context).textTheme.subhead.copyWith(color: Colors.white);

    final yearTheme =
        Theme.of(context).textTheme.caption.copyWith(color: Colors.white);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(storyDate[0], style: dayTheme),
        SPACE_NORMAL,
        Text(storyDate[1], style: monthTheme),
        Text(storyDate[2], style: yearTheme),
      ],
    );
  }
}

///
/// 是否favorite
///
class _Favorite extends StatelessWidget {
  const _Favorite({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite_border, color: Colors.white),
      onPressed: () {},
    );
  }
}

///
/// story标题
///
class _StoryTitle extends StatelessWidget {
  const _StoryTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white),
    );
  }
}

///
/// 心情
///
class _Mood extends StatelessWidget {
  const _Mood({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('d');
  }
}