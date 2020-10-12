import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android/common/util/ui_adapter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ArticleItemState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: _itemWidget(state, dispatch),
  );
}

Widget _itemWidget(ArticleItemState state, Dispatch dispatch) {
  return Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(setWidth(20))),
    margin: EdgeInsets.all(5),
    child: InkWell(
      borderRadius: BorderRadius.circular(setWidth(20)),
      child: _itemContentWidget(state, dispatch),
      onTap: () => dispatch(ArticleItemActionCreator.openArticleContent(state)),
    ),
  );
}

Widget _itemContentWidget(ArticleItemState state, Dispatch dispatch) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(
            left: setWidth(25), right: setWidth(25), top: setWidth(20)),
        child: Stack(
          children: <Widget>[
            Container(
              child: Text(
                  '作者: ${state.itemData.shareUser == "" ? "未知" : state.itemData.shareUser}'),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('时间: '),
                  Text(state.itemData.niceShareDate),
                ],
              ),
            )
          ],
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(
            left: setWidth(25), right: setWidth(25), top: setWidth(20)),
        child:
            Text(state.itemData.title, style: TextStyle(fontSize: setSp(32))),
      ),
      Container(
        margin: EdgeInsets.only(
            left: setWidth(25), top: setWidth(20), bottom: setWidth(20)),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '分类: ${state.itemData.superChapterName} / ${state.itemData.chapterName}',
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: setWidth(20)),
              child: InkWell(
                child: Icon(
                  state.itemData.collect
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: state.itemData.collect ? Colors.red : null,
                ),
                onTap: () {
                  dispatch(ArticleItemActionCreator.collectArticle(state));
                },
              ),
            )
          ],
        ),
      ),
    ],
  );
}
