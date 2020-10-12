import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android/common/bean/article_detail_bean.dart';

class WebState implements Cloneable<WebState> {
  ArticleDetailBean articleDetail;
  bool isLoading;

  @override
  WebState clone() {
    return WebState()
      ..articleDetail = articleDetail
      ..isLoading = isLoading;
  }
}

WebState initState(Map<String, dynamic> args) {
  //获取从列表传过来的值
  ArticleDetailBean articleDetailBean = args["articleDetail"];
  return WebState()
    ..articleDetail = articleDetailBean
    ..isLoading = true;
}
