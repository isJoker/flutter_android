import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android/common/bean/banner_entity.dart';
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
  await _getTabData(ctx);
  await _getBannerData(ctx);
}

Future _getBannerData(Context<ProjectState> ctx) async {
  println("请求banner数据");
  try {
    Response response = await Dio().get(ProjectApi.GET_BANNER_URL);
    BannerEntity bannerEntity =
    BannerEntity().fromJson(json.decode(response.toString()));
    ctx.state.banners = bannerEntity.data;
    ctx.state.bannerImages = _getImageList(ctx);

    ctx.dispatch(ProjectActionCreator.updateBannerData(ctx.state.banners));
    ctx.dispatch(ProjectActionCreator.updateBannerImage(ctx.state.bannerImages));
  } catch (e) {
    println("获取首页banner数据失败: " + e.toString());
  }
}

List<Widget> _getImageList(Context<ProjectState> ctx) {
  List<Widget> images = List();
  for (int i = 0; i < ctx.state.banners.length; i++) {
    images.add(Image.network(ctx.state.banners[i].imagePath, fit: BoxFit.fill));
  }
  return images;
}

Future _getTabData(Context<ProjectState> ctx) async {
  try {
    Response response = await Dio().get(ProjectApi.GET_PROJECT_TAB_INFO);
    ProjectTabEntity entity =
    ProjectTabEntity().fromJson(json.decode(response.toString()));
    ctx.dispatch(ProjectActionCreator.onUpdateProjectTab(entity.data));
  } catch (e) {
  
  }
}
