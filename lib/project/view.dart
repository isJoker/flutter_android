import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android/common/util/keep_alive_page.dart';
import 'package:flutter_android/common/util/ui_adapter.dart';
import 'package:flutter_android/project/project_detail/page.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'state.dart';

ProjectState _state;

Widget buildView(
    ProjectState state, Dispatch dispatch, ViewService viewService) {
  _state = state;
  if (state.isLoading) {
    return Center(
      child: CircularProgressIndicator(),
    );
  } else {
    return keepAliveWrapper(_tabProjectWidget2(state));
  }
}

///
/// 配合 _projectDetailWidget2
///
Widget _tabProjectWidget2(ProjectState state) {
  return Scaffold(
    body: DefaultTabController(
      length: state.projectList.length,
      initialIndex: 0,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: Text("玩Android"),
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(Icons.dashboard),
                  onPressed: () {},
                ),
                actions: <Widget>[
                  new IconButton(
                    icon: Icon(Icons.open_in_new),
                    onPressed: () {},
                  ),
                ],
                expandedHeight: setWidth(400),
                // 展开不显示阴影，合并后会显示
                forceElevated: innerBoxIsScrolled,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: _swiperView(),
                  collapseMode: CollapseMode.pin,
                ),
                bottom: TabBar(
                  tabs: state.tabList,
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  indicatorWeight: 2.0,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white70,
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: state.projectList.asMap().keys.map((index) {
            return ProjectDetailPage()
                .buildPage({"projectId": state.projectList[index].id});
          }).toList(),
        ),
      ),
    ),
  );
}

/// banner
Widget _swiperView() {
  return Container(
    height: setWidth(400),
    child: _bannerImage(),
  );
}

Widget _bannerImage() {
  return Swiper(
      autoplay: _state.bannerImages.length > 1,
      autoplayDelay: 5000,
      pagination: SwiperPagination(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.only(bottom: setWidth(100), right: setWidth(15)),
          builder: DotSwiperPaginationBuilder(
              size: setWidth(12), activeSize: setWidth(12))),
      itemCount: _state.bannerImages.length,
      itemBuilder: (ctx, index) {
        return _state.bannerImages[index];
      },
      onIndexChanged: (index) {},
      onTap: (index) {});
}

///
/// 配合 _projectDetailWidget
///
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
