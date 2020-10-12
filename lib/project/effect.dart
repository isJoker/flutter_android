import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android/project/action.dart';
import 'package:flutter_android/project/project_api.dart';
import 'bean/project_tab_entity.dart';
import 'state.dart';

Effect<ProjectState> buildEffect() {
  return combineEffects(
      <Object, Effect<ProjectState>>{Lifecycle.initState: _init});
}

/// 获取项目标题列表数据
void _init(Action action, Context<ProjectState> ctx) async {
  try {
    Response response = await Dio().get(ProjectApi.GET_PROJECT_TAB_INFO);
    ProjectTabEntity entity =
    ProjectTabEntity().fromJson(json.decode(response.toString()));
    ctx.dispatch(ProjectActionCreator.onUpdateProjectTab(entity.data));
  } catch (e) {

  }
}
