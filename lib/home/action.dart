import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android/common/util/callback.dart';

import 'article_item/state.dart';
import '../common/bean/banner_entity.dart';

enum HomeAction {
  updateBannerData,
  updateBannerImage,
  updateBannerIndex,
  updateArticleItem,
  loadArticle,
  loadMoreArticle,
  openBannerContent
}

class HomeActionCreator {
  
  ///加载文章
  static Action loadArticle(LoadMoreCallback callback) {
    return Action(HomeAction.loadArticle, payload: callback);
  }

  ///加载更多文章
  static Action loadMoreArticle(LoadMoreCallback callback) {
    return Action(HomeAction.loadMoreArticle, payload: callback);
  }

  ///打开banner
  static Action openBannerContent(int index) {
    return Action(HomeAction.openBannerContent, payload: index);
  }

  ///获取轮播图图片Url(Ui更新)
  static Action updateBannerData(List<BannerData> bannerData) {
    return Action(HomeAction.updateBannerData, payload: bannerData);
  }

  ///获取轮播图图片Widget(Ui更新)
  static Action updateBannerImage(List<Widget> bannerImage) {
    return Action(HomeAction.updateBannerImage, payload: bannerImage);
  }

  ///获取轮播数据当前被选下标(Ui更新)
  static Action updateBannerIndex(int bannerIndex) {
    return Action(HomeAction.updateBannerIndex, payload: bannerIndex);
  }

  ///更新文章(Ui更新)
  static Action updateArticleItem(List<ArticleItemState> itemList) {
    return Action(HomeAction.updateArticleItem, payload: itemList);
  }
}
