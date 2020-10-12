import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android/common/util/callback.dart';
import 'package:flutter_android/project/bean/project_detail_entity.dart';
import 'package:flutter_android/project/project_api.dart';
import 'package:flutter_android/project/project_item/state.dart';
import 'action.dart';
import 'state.dart';

Effect<ProjectDetailState> buildEffect() {
  return combineEffects(<Object, Effect<ProjectDetailState>>{
    Lifecycle.initState: _onRefreshData,
    ProjectDetailAction.refresh: _onRefreshData,
    ProjectDetailAction.loadMore: _onLoadMoreData,
  });
}

void _onRefreshData(Action action, Context<ProjectDetailState> ctx) async {
  LoadMoreCallback callback = action.payload;
  ctx.state.pageNo = 1;
  try {
    debugPrint("开始请求项目列表数据");
    ctx.state.items = await loadProjectData(ctx.state);
    ctx.dispatch(ProjectDetailActionCreator.onUpdateItems(ctx.state.items));
    if (callback != null) {
      callback.call(true, false);
    }
  } catch (e) {
    if (callback != null) {
      callback.call(false, false);
    }
    debugPrint("请求项目列表数据出错");
  }
}

void _onLoadMoreData(Action action, Context<ProjectDetailState> ctx) async {
  LoadMoreCallback callback = action.payload;
  ctx.state.pageNo += 1;
  try {
    debugPrint("开始请求项目列表更多数据");
    List<ProjectItemState> tempItems = await loadProjectData(ctx.state);
    ctx.state.items.addAll(tempItems);
    ctx.dispatch(ProjectDetailActionCreator.onUpdateItems(ctx.state.items));
    if (callback != null) {
      callback.call(true, tempItems.length == 0);
    }
  } catch (e) {
    if (callback != null) {
      callback.call(false, false);
    }
    ctx.state.pageNo -= 1;
    debugPrint("请求项目列表更多数据出错");
  }
}


Future<List<ProjectItemState>> loadProjectData(ProjectDetailState state) async {
  Response response = await Dio().get(
      ProjectApi.GET_PROJECT_DETAIL + "${state.pageNo}/json",
      queryParameters: {"cid": state.projectId});
  ProjectDetailEntity entity =
  ProjectDetailEntity().fromJson(json.decode(response.toString()));
  return List.generate(entity.data.datas.length, (index) {
    return ProjectItemState(itemData: entity.data.datas[index]);
  });
}
