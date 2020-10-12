import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android/project/project_item/state.dart';

enum ProjectItemAction { onProjectItemClick }

class ProjectItemActionCreator {
  static Action onProjectItemClick(ProjectItemState state) {
    return Action(ProjectItemAction.onProjectItemClick, payload: state.itemData);
  }
}
