import 'dart:async';

import 'package:memoir/app/model/api.dart';
import 'package:memoir/app/model/bean/bean.dart';
import 'package:memoir/app/model/bean/page_change.dart';
import 'package:memoir/app/model/bean/story.dart';
import 'package:memoir/app/utils/biz.dart';
import 'package:memoir/framework/utils.dart';

class StoryBloc {
  ///
  /// story列表
  ///
  final storyList = Event<List<Story>>(isBehavior: true);

  ///
  /// page切换事件
  /// int泛型代表当前是第几页, bool表示是否是按了回到第一页的按钮
  ///
  final pageChange = Event<PageChange>(isBehavior: true);

  ///
  /// 新增story
  ///
  final newStory = Event<Story>(seedValue: Story());

  ///
  /// 获取story列表
  ///
  Future<List<Story>> performFetchStoryList() {
    return Api.fetchStoryList({});
  }

  ///
  /// 新增story
  ///
  Future<Bean> performAddStory() {
    Biz.checkAddStory(newStory.latest);

    return Api.addStory(newStory.latest.toJson());
  }

  void close() {
    storyList.close();
    pageChange.close();
    newStory.close();
  }
}
