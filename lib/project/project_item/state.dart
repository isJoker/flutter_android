import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android/project/bean/project_detail_entity.dart';

class ProjectItemState implements Cloneable<ProjectItemState> {

  ProjectDetailItemData itemData;


  ProjectItemState({this.itemData});

  @override
  ProjectItemState clone() {
    return ProjectItemState()
    ..itemData = itemData;
  }
}

ProjectItemState initState(Map<String, dynamic> args) {
  return ProjectItemState();
}
