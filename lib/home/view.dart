import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android/home/action.dart';
import 'package:flutter_android/common/util/keep_alive_page.dart';
import 'package:flutter_android/common/util/ui_adapter.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'state.dart';

HomeState _homeState;
Dispatch _dispatch;
ViewService _viewService;

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  _homeState = state;
  _dispatch = dispatch;
  _viewService = viewService;
  state.pageNo = 0;
  ScreenUtil.init(viewService.context, width: 750, height: 1334);

  return keepAliveWrapper(_homeWidget2());
}

Widget _homeWidget() {
  return EasyRefresh(
    controller: _homeState.controller,
    header: MaterialHeader(),
    footer: MaterialFooter(),
    child: ListView(
      children: [
        _swiperView(),
        _articleWidget(),
      ],
    ),
    enableControlFinishLoad: true,
    enableControlFinishRefresh: true,
    onRefresh: () async {
      _dispatch(HomeActionCreator.loadArticle((loadSuccess, noMore) {
        _homeState.controller.resetLoadState();
        _homeState.controller.finishRefresh(success: loadSuccess, noMore: noMore);
      }));
    },
    onLoad: () async {
      _dispatch(HomeActionCreator.loadMoreArticle((loadSuccess, noMore) {
        _homeState.controller.finishLoad(success: loadSuccess, noMore: noMore);
      }));
    },
  );
}

/// 更加灵活
Widget _homeWidget2() {
  return Scaffold(
    appBar: AppBar(
      title: Text("玩Android"),
      elevation: 0,
    ),
    drawer: _buildDrawer(),
    body: EasyRefresh.builder(
      controller: _homeState.controller,
      header: TaurusHeader(
          backgroundColor: Colors.green
      ),
      footer: MaterialFooter(),
      enableControlFinishLoad: true,
      enableControlFinishRefresh: true,
      builder: (context, physics, header, footer) {
        return CustomScrollView(
          physics: physics,
          slivers: <Widget>[
            header,
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: setWidth(400),
                  child: Stack(
                    children: [
                      _bannerImage(),
                      _bannerText(),
                    ],
                  ),
                ),
              ]),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  _viewService.buildAdapter().itemBuilder,
                  childCount: _viewService.buildAdapter().itemCount),
            ),
            footer,
          ],
        );
      },
      onRefresh: () async {
        _dispatch(HomeActionCreator.loadArticle((loadSuccess, noMore) {
          _homeState.controller.resetLoadState();
          _homeState.controller.finishRefresh(success:loadSuccess,noMore:noMore);
        }));
      },
      onLoad: () async {
        _dispatch(HomeActionCreator.loadMoreArticle((loadSuccess, noMore) {
          _homeState.controller.finishLoad(success:loadSuccess,noMore:noMore);
        }));
      },
    ),
  );
}

/// 文章列表
Widget _articleWidget() {
  return MediaQuery.removePadding(
    removeTop: true,
    context: _viewService.context,
    child: ListView.builder(
      itemCount: _viewService.buildAdapter().itemCount,
      itemBuilder: _viewService.buildAdapter().itemBuilder,
      shrinkWrap: true, //为true可以解决子控件必须设置高度的问题
      physics: NeverScrollableScrollPhysics(), // 禁止滑动
    ),
  );
}

/// banner
Widget _swiperView() {
  return Container(
    height: setWidth(400),
    child: Stack(
      children: [
        _bannerImage(),
        _bannerText(),
      ],
    ),
  );
}

Widget _bannerText() {
  return Offstage(
      // 没有banners则隐藏
      offstage: _homeState.banners.length == 0,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: setWidth(80),
          width: double.infinity,
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.black.withAlpha(100),
              Colors.black.withAlpha(100),
            ],
          )),
          child: Center(
            child: Text(
                _homeState.banners.length == 0
                    ? ""
                    : _homeState.banners[_homeState.bannerIndex].title,
                style: TextStyle(color: Colors.white, fontSize: setSp(22))),
          ),
        ),
      ));
}

Widget _bannerImage() {
  return Swiper(
    autoplay: _homeState.bannerImages.length > 1,
    autoplayDelay: 5000,
    pagination: SwiperPagination(
        alignment: Alignment.bottomRight,
        margin: EdgeInsets.only(bottom: setWidth(100), right: setWidth(15)),
        builder: DotSwiperPaginationBuilder(
            size: setWidth(12), activeSize: setWidth(12))),
    itemCount: _homeState.bannerImages.length,
    itemBuilder: (ctx, index) {
      return _homeState.bannerImages[index];
    },
    onIndexChanged: (index) =>
        _dispatch(HomeActionCreator.updateBannerIndex(index)),
    onTap: (index) {
      _dispatch(HomeActionCreator.openBannerContent(index));
    },
  );
}

Widget _buildDrawer() {
  return Drawer(
    child: Column(
      children: [
        Container(
          child: Image.asset("images/flutter.png"),
        ),
        Expanded(
          child: ListView(
            children: _buildDrawerItems(),
          ),
        ),
      ],
    ),
  );
}

List<Widget> _buildDrawerItems() {
  List<Widget> list = List();
  var listTitle = ["我的收藏", "设置", "关于", "反馈"];
  var listIcon = [
    Icon(Icons.favorite),
    Icon(Icons.settings),
    Icon(Icons.code),
    Icon(Icons.announcement)
  ];
  for (var i = 0; i < listTitle.length; i++) {
    list.add(InkWell(
      child: ListTile(
        leading: listIcon[i],
        title: Text(listTitle[i]),
      ),
      onTap: () {

      },
    ));
  }
  return list;
}
