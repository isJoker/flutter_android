import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android/home/article_item/component.dart';
import 'package:flutter_android/home/state.dart';

class HomeArticleAdapter extends SourceFlowAdapter<HomeState> {
  static const String articleType = "articleType";

  HomeArticleAdapter()
      : super(pool: <String, Component<Object>>{
          articleType: ArticleItemComponent()
        });
}
