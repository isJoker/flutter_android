import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android/common/bean/banner_entity.dart';

import 'bean/project_tab_entity.dart';

class ProjectState implements Cloneable<ProjectState> {
  bool isLoading = true;
  List<ProjectTabData> projectList;
  List<Tab> tabList;

  // banner 数据
  List<BannerData> banners; //轮播所有数据
  List<Widget> bannerImages; //所有轮播图

  @override
  ProjectState clone() {
    return ProjectState()
      ..banners = banners
      ..bannerImages = bannerImages
      ..tabList = tabList
      ..projectList = projectList
      ..isLoading = isLoading;
  }
}

ProjectState initState(Map<String, dynamic> args) {
  return ProjectState()
    ..banners = List()
    ..bannerImages = List();
}
