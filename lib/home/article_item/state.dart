import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android/home/bean/home_article_entity.dart';

class ArticleItemState implements Cloneable<ArticleItemState> {
  HomeArticleData itemData;


  ArticleItemState({this.itemData});

  @override
  ArticleItemState clone() {
    return ArticleItemState()..itemData = itemData;
  }
}

ArticleItemState initState(Map<String, dynamic> args) {
  return ArticleItemState();
}
