import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(WebState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(title: Text(state.articleDetail.title)),
    body: Stack(
      children: [
        WebView(
          initialUrl: state.articleDetail.url,
          javascriptMode: JavascriptMode.unrestricted,
          onPageStarted: (url) {
            dispatch(WebActionCreator.isLoading(true));
          },
          onPageFinished: (url) {
            dispatch(WebActionCreator.isLoading(false));
          },
        ),
        //加载动画
        Offstage(
          offstage: !state.isLoading,
          child: Container(
            alignment: Alignment.topCenter,
            child: LinearProgressIndicator(),
          ),
        )
      ],
    ),
  );
}
