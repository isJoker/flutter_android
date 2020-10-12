import 'package:fish_redux/fish_redux.dart';

import 'package:flutter/cupertino.dart' hide Page;
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_android/project/page.dart';
import 'package:flutter_android/web/page.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'home/page.dart';
import 'main/page.dart';

void main() {
  runApp(createApp());
}

Widget createApp() {
  // 注意：fish redux 中的 page 与 flutter 原生的 page命名冲突，
  // 需要在导 cupertino 或 material 包时 hide Page
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      "main": MainPage(),
      "home": HomePage(),
      "project": ProjectPage(),
      "web": WebPage(),
    },
  );

  return MaterialApp(
    title: 'Demo',
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: routes.buildPage("main", null),
    onGenerateRoute: (settings) {
      //     ios页面切换风格
//      return CupertinoPageRoute(builder: (BuildContext context) {
//        uiAdapter(context); //界面适配
//        return routes.buildPage(settings.name, settings.arguments);
//      });

//      Material页面切换风格
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        uiAdapter(context); //界面适配
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}

//界面适配
void uiAdapter(BuildContext context) {
  //填入设计稿中设备的屏幕尺寸
  //默认 width : 1080px , height:1920px , allowFontScaling:false
//    ScreenUtil.init(context);
  //假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
//    ScreenUtil.init(context, width: 750, height: 1334);
  //设置字体大小根据系统的“字体大小”辅助选项来进行缩放,默认为false
//    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
  ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
}
