import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android/collect/page.dart';
import 'package:flutter_android/home/page.dart';

class MainState implements Cloneable<MainState> {
  int selectedIndex = 0; //底部导航栏tab标识
  List<Widget> tabPage; //tab页面

  @override
  MainState clone() {
    return MainState()
      ..selectedIndex = selectedIndex
      ..tabPage = tabPage;
  }
}

MainState initState(Map<String, dynamic> args) {
  MainState mainState = MainState();
  mainState.selectedIndex = 0;
  mainState.tabPage = [
    HomePage().buildPage(null),
    CollectPage().buildPage(null),
    HomePage().buildPage(null),
    HomePage().buildPage(null),
  ];
  return mainState;
}
