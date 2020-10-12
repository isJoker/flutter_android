import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android/home/article_item/state.dart';

enum ArticleItemAction {
  openArticleContent,
  collectArticle,
  updateArticleCollect
}

class ArticleItemActionCreator {
  //打开文章内容
  static Action openArticleContent(ArticleItemState state) {
    return Action(ArticleItemAction.openArticleContent,
        payload: state.itemData);
  }

  //收藏文章
  static Action collectArticle(ArticleItemState state) {
    return Action(ArticleItemAction.collectArticle, payload: state.itemData);
  }

  //更新文章收藏按钮状态
  static Action updateArticleCollect(ArticleItemState state) {
    return Action(ArticleItemAction.updateArticleCollect, payload: state.itemData.id);
  }
}
