import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android/common/util/ui_adapter.dart';
import 'package:flutter_android/project/action.dart';
import 'package:flutter_android/project/project_detail/action.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'state.dart';

Widget buildView(
    ProjectDetailState state, Dispatch dispatch, ViewService viewService) {
  if (state.isLoading) {
    return Center(
      child: CircularProgressIndicator(),
    );
  } else {
    return _projectDetailWidget2(state, dispatch, viewService);
  }
}

Widget _projectDetailWidget(
    ProjectDetailState state, Dispatch dispatch, ViewService viewService) {
  return EasyRefresh(
    controller: state.controller,
    header: MaterialHeader(),
    footer: MaterialFooter(),
    child: ListView.builder(
      itemBuilder: viewService.buildAdapter().itemBuilder,
      itemCount: viewService.buildAdapter().itemCount,
    ),
    enableControlFinishLoad: true,
    enableControlFinishRefresh: true,
    onRefresh: () async {
      dispatch(
          ProjectDetailActionCreator.onUpdateListData((loadSuccess, noMore) {
        state.controller.resetLoadState();
        state.controller.finishRefresh(success: loadSuccess, noMore: noMore);
      }));
    },
    onLoad: () async {
      dispatch(
          ProjectDetailActionCreator.onLoadMoreListData((loadSuccess, noMore) {
        state.controller.finishLoad(success: loadSuccess, noMore: noMore);
      }));
    },
  );
}

Widget _projectDetailWidget2(
    ProjectDetailState state, Dispatch dispatch, ViewService viewService) {
  return Builder(
    builder: (context){
      return CustomScrollView(
        slivers: <Widget>[
          SliverOverlapInjector(
            handle:
            NestedScrollView.sliverOverlapAbsorberHandleFor(
                context),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(viewService.buildAdapter().itemBuilder,
                childCount: viewService.buildAdapter().itemCount),
          ),
        ],
      );
    },
  );
}
