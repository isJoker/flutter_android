import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android/common/bean/article_detail_bean.dart';

class WebState implements Cloneable<WebState> {
  WebPageBean articleDetail;
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
  WebPageBean articleDetailBean = args["params"];
  return WebState()
    ..articleDetail = articleDetailBean
    ..isLoading = true;
}
