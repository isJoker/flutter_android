import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android/common/util/callback.dart';
import 'package:flutter_android/project/project_item/state.dart';

enum ProjectDetailAction { refresh,loadMore,updateItems }

class ProjectDetailActionCreator {
  static Action onUpdateListData(LoadMoreCallback callback) {
    return Action(ProjectDetailAction.refresh,payload: callback);
  }
  static Action onLoadMoreListData(LoadMoreCallback callback) {
    return Action(ProjectDetailAction.loadMore,payload: callback);
  }
  static Action onUpdateItems(List<ProjectItemState> items) {
    return Action(ProjectDetailAction.updateItems,payload: items);
  }
}
