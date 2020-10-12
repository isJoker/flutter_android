import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android/common/bean/article_detail_bean.dart';
import 'package:flutter_android/home/bean/home_article_entity.dart';
import 'action.dart';
import 'state.dart';

Effect<ArticleItemState> buildEffect() {
  return combineEffects(<Object, Effect<ArticleItemState>>{
    ArticleItemAction.openArticleContent: _onOpenArticleContent,
    ArticleItemAction.collectArticle: _onCollectArticle,
  });
}

void _onOpenArticleContent(Action action, Context<ArticleItemState> ctx) {

  HomeArticleData homeArticleData = action.payload;
  ArticleDetailBean articleDetailBean = ArticleDetailBean();
  articleDetailBean.url = homeArticleData.link;
  articleDetailBean.title = homeArticleData.title;

  Navigator.of(ctx.context).pushNamed("web",arguments: {"articleDetail": articleDetailBean});
}

void _onCollectArticle(Action action, Context<ArticleItemState> ctx) {
  // todo 调用api收藏文章
  ctx.dispatch(ArticleItemActionCreator.updateArticleCollect(ctx.state));
}
