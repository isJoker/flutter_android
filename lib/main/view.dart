import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android/main/action.dart';

import 'state.dart';

MainState _mainState;
Dispatch _dispatch;

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  _mainState = state;
  _dispatch = dispatch;
  return _buildBottomNavigationBar();
}

Widget _buildBottomNavigationBar() {
  var _pageController = PageController();

  return Scaffold(
    appBar: AppBar(
      title: Text("玩Android"),
      elevation: 0,
    ),
    drawer: _buildDrawer(),
    body: PageView.builder(
      itemBuilder: (context, index) => _mainState.tabPage[index],
      itemCount: _mainState.tabPage.length,
      //禁止页面左右滑动切换
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (index) {
        _dispatch(MainActionCreator.onSelectTab(index));
      },
    ),
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("主页")),
        BottomNavigationBarItem(icon: Icon(Icons.toys), title: Text("项目")),
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("主页")),
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("主页")),
      ],
      currentIndex: _mainState.selectedIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black45,
      onTap: (index){
        _dispatch(MainActionCreator.onSelectTab(index));
        _pageController.jumpToPage(index);
      },
    ),
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
