import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'bean/project_tab_entity.dart';


class ProjectState implements Cloneable<ProjectState> {

  bool isLoading = true;
  List<ProjectTabData> projectList;
  List<Tab> tabList;

  @override
  ProjectState clone() {
    return ProjectState()
    ..tabList = tabList
    ..projectList = projectList
    ..isLoading = isLoading;
  }
}

ProjectState initState(Map<String, dynamic> args) {
  return ProjectState();
}
