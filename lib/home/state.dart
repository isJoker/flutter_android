import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android/home/adapter.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'article_item/state.dart';
import 'bean/banner_entity.dart';

class HomeState extends MutableSource implements Cloneable<HomeState> {
  // banner 数据
  List<BannerData> banners; //轮播所有数据
  List<Widget> bannerImages; //所有轮播图
  int bannerIndex; //当前展示的轮播图下标

  // 文章列表数据
  List<ArticleItemState> articleList; //item数据源
  int pageNo; 

  // 刷新、加载控制器
  EasyRefreshController controller;

  @override
  HomeState clone() {
    return HomeState()
      ..banners = banners
      ..bannerImages = bannerImages
      ..bannerIndex = bannerIndex
      ..articleList = articleList
      ..controller = controller;
  }

  @override
  Object getItemData(int index) {
    return articleList[index];
  }

  @override
  String getItemType(int index) {
    return HomeArticleAdapter.articleType;
  }

  @override
  int get itemCount => articleList == null ? 0 : articleList.length;

  @override
  void setItemData(int index, Object data) {
    articleList[index] = data;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState()
    ..banners = List()
    ..bannerImages = List()
    ..articleList = List()
    ..pageNo = 0
    ..bannerIndex = 0
    ..controller = EasyRefreshController();
}
