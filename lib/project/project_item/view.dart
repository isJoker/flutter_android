import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android/common/util/ui_adapter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ProjectItemState state, Dispatch dispatch, ViewService viewService) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(setWidth(20))),
    child: InkWell(
      borderRadius: BorderRadius.circular(setWidth(20)),
      child: Row(
        children: [
          Expanded(
              child: Container(
            margin: EdgeInsets.all(setWidth(20)),
            height: setWidth(350),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // 标题
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.itemData.title,
                      style:
                          TextStyle(fontSize: setSp(34), color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                // 描述
                Expanded(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.only(top: setWidth(20)),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        state.itemData.desc,
                        style: TextStyle(
                            fontSize: setSp(28), color: Colors.black87),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //作者
                      Container(
                        child: Text("作者：${state.itemData.author}",
                            style: TextStyle(color: Colors.black54)),
                        alignment: Alignment.centerLeft,
                      ),
                      //时间
                      Container(
                        child: Text("时间：${state.itemData.niceDate}",
                            style: TextStyle(color: Colors.black45)),
                        alignment: Alignment.centerLeft,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
          Container(
            margin: EdgeInsets.all(setWidth(20)),
            width: setWidth(180),
            height: setWidth(350),
            child: Image.network(
              state.itemData.envelopePic,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      onTap: () {
        dispatch(ProjectItemActionCreator.onProjectItemClick(state));
      },
    ),
  );
}
