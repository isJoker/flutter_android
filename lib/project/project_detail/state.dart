import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android/project/project_detail/adapter.dart';
import 'package:flutter_android/project/project_item/state.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class ProjectDetailState extends MutableSource
    implements Cloneable<ProjectDetailState> {
  int projectId;
  bool isLoading = true;
  List<ProjectItemState> items;
  int pageNo;

  // 刷新、加载控制器
  EasyRefreshController controller;

  @override
  ProjectDetailState clone() {
    return ProjectDetailState()
      ..projectId = projectId
      ..isLoading = isLoading
      ..pageNo = pageNo
      ..controller = controller;
  }

  @override
  Object getItemData(int index) {
    return items[index];
  }

  @override
  String getItemType(int index) {
    return ProjectAdapter.projectType;
  }

  @override
  int get itemCount => items == null ? 0 : items.length;

  @override
  void setItemData(int index, Object data) {
    items[index] = data;
  }
}

ProjectDetailState initState(Map<String, dynamic> args) {
  return ProjectDetailState()
    ..projectId = args['projectId']
    ..pageNo = 0
    ..controller = EasyRefreshController();
}
