import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android/common/util/keep_alive_page.dart';
import 'package:flutter_android/common/util/ui_adapter.dart';
import 'package:flutter_android/project/project_detail/page.dart';

import 'state.dart';

Widget buildView(
    ProjectState state, Dispatch dispatch, ViewService viewService) {
  if (state.isLoading) {
    return Center(
      child: CircularProgressIndicator(),
    );
  } else {
    return keepAliveWrapper(_tabProjectWidget(state));
  }
}

Widget _tabProjectWidget(ProjectState state) {
  return DefaultTabController(
    length: state.projectList.length,
    initialIndex: 0,
    child: Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.green,
            child: TabBar(
              tabs: state.tabList,
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 2.0,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: state.projectList.asMap().keys.map((index) {
                return ProjectDetailPage()
                    .buildPage({"projectId": state.projectList[index].id});
              }).toList(),
            ),
          ),
        ],
      ),
    ),
  );
}
