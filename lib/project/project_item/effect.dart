import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android/common/bean/article_detail_bean.dart';
import 'package:flutter_android/project/bean/project_detail_entity.dart';
import 'action.dart';
import 'state.dart';

Effect<ProjectItemState> buildEffect() {
  return combineEffects(<Object, Effect<ProjectItemState>>{
    ProjectItemAction.onProjectItemClick: _onProjectItemClick,
  });
}

void _onProjectItemClick(Action action, Context<ProjectItemState> ctx) {
  ProjectDetailItemData itemData = action.payload;
  WebPageBean webPageBean = WebPageBean();
  webPageBean.title = itemData.title;
  webPageBean.url = itemData.projectLink;

  Navigator.of(ctx.context).pushNamed("web", arguments: {"params": webPageBean});
}
