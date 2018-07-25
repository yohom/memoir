import 'package:memoir/app/model/bean/story.dart';
import 'package:memoir/framework/utils.dart';

class Biz {
  static void checkAddStory(Story story) {
    if (isEmpty(story.title)) {
      throw '标题不能为空';
    } else if (isEmpty(story.storyDate)) {
      throw '时间不能为空';
    } else if (isEmpty(story.hero)) {
      throw '任务不能为空';
    } else if (isEmpty(story.storyContent)) {
      throw '事件不能为空';
    }
  }
}
