import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android/common/bean/article_detail_bean.dart';
import 'package:flutter_android/home/api.dart';
import 'package:flutter_android/common/bean/banner_entity.dart';
import 'package:flutter_android/common/util/callback.dart';
import 'action.dart';
import 'article_item/state.dart';
import 'bean/home_article_entity.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init,
    HomeAction.loadMoreArticle: _loadMoreArticleData,
    HomeAction.loadArticle: _getArticleData,
    HomeAction.openBannerContent: _openBannerContent,
  });
}

void _init(Action action, Context<HomeState> ctx) {
  _getBannerData(action, ctx);
  _getArticleData(action, ctx);
}

void _getBannerData(Action action, Context<HomeState> ctx) async {
  println("请求banner数据");
  try {
    Response response = await Dio().get(HomeApi.GET_BANNER_URL);
    BannerEntity bannerEntity =
        BannerEntity().fromJson(json.decode(response.toString()));
    ctx.state.banners = bannerEntity.data;
    ctx.state.bannerImages = _getImageList(ctx);

    ctx.dispatch(HomeActionCreator.updateBannerData(ctx.state.banners));
    ctx.dispatch(HomeActionCreator.updateBannerImage(ctx.state.bannerImages));
  } catch (e) {
    println("获取首页banner数据失败: " + e.toString());
  }
}

List<Widget> _getImageList(Context<HomeState> ctx) {
  List<Widget> images = List();
  for (int i = 0; i < ctx.state.banners.length; i++) {
    images.add(Image.network(ctx.state.banners[i].imagePath, fit: BoxFit.fill));
  }
  return images;
}

void _getArticleData(Action action, Context<HomeState> ctx) async {
  println("请求首页文章列表数据");
  LoadMoreCallback callback = action.payload;
  ctx.state.pageNo = 0;
  try {
    List<ArticleItemState> tempList = await getArticle(ctx);
    ctx.state.articleList = tempList;
    ctx.dispatch(HomeActionCreator.updateArticleItem(ctx.state.articleList));
    if(callback != null){
      callback.call(true, false);
    }
  } catch (e) {
    if(callback != null){
      callback.call(false, false);
    }
    println("获取首页文章列表数据失败: " + e.toString());
  }
}

void _loadMoreArticleData(Action action, Context<HomeState> ctx) async {
  println("请求首页文章列表更多数据");
  LoadMoreCallback callback = action.payload;
  ctx.state.pageNo += 1;
  try {
    List<ArticleItemState> tempList = await getArticle(ctx);
    ctx.state.articleList.addAll(tempList);
    ctx.dispatch(HomeActionCreator.updateArticleItem(ctx.state.articleList));
    if(callback != null){
      callback.call(true, tempList.length == 0);
    }
  } catch (e) {
    ctx.state.pageNo -= 1;
    if(callback != null){
      callback.call(false, false);
    }
    println("获取首页文章列表更多数据失败: " + e.toString());
  }
}

Future<List<ArticleItemState>> getArticle(Context<HomeState> ctx) async {
  Response response = await Dio()
      .get(HomeApi.GET_HOME_ARTICLE + "${ctx.state.pageNo}/json");
  HomeArticleEntity articleEntity =
      HomeArticleEntity().fromJson(json.decode(response.toString()));
  List<HomeArticleData> articleItems = articleEntity.data.datas;
  List<ArticleItemState> tempList = List.generate(articleItems.length, (index) {
    return ArticleItemState(itemData: articleItems[index]);
  });
  return tempList;
}

void _openBannerContent(Action action, Context<HomeState> ctx) {
  int index = action.payload;
  WebPageBean articleDetailBean = WebPageBean();
  articleDetailBean.title = ctx.state.banners[index].title;
  articleDetailBean.url = ctx.state.banners[index].url;
  Navigator.of(ctx.context).pushNamed("web", arguments: {"params": articleDetailBean});
}
