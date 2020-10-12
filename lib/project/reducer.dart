import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'bean/project_tab_entity.dart';
import 'state.dart';

Reducer<ProjectState> buildReducer() {
  return asReducer(
    <Object, Reducer<ProjectState>>{
      ProjectAction.updateProjectTab: _onUpdateProjectList,
    },
  );
}

ProjectState _onUpdateProjectList(ProjectState state, Action action) {
  final ProjectState newState = state.clone();
  newState.isLoading = false;
  newState.projectList = action.payload;
  List<Tab> tabs = List();
  for(var i=0; i<newState.projectList.length; i++){
    tabs.add(Tab(text: newState.projectList[i].name));
  }
  newState.tabList = tabs;
  return newState;
}
