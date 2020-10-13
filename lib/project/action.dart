import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android/common/bean/banner_entity.dart';

import 'bean/project_tab_entity.dart';

enum ProjectAction { updateProjectTab,updateBannerData,updateBannerImage }

class ProjectActionCreator {
  static Action onUpdateProjectTab(List<ProjectTabData> data) {
    return Action(ProjectAction.updateProjectTab, payload: data);
  }

  ///获取轮播图图片Url(Ui更新)
  static Action updateBannerData(List<BannerData> bannerData) {
    return Action(ProjectAction.updateBannerData, payload: bannerData);
  }

  ///获取轮播图图片Widget(Ui更新)
  static Action updateBannerImage(List<Widget> bannerImage) {
    return Action(ProjectAction.updateBannerImage, payload: bannerImage);
  }
}
