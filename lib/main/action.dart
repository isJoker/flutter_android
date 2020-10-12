import 'package:fish_redux/fish_redux.dart';

enum MainAction { selectTab, initData }

class MainActionCreator {
  static Action onSelectTab(int index) {
    return Action(MainAction.selectTab,
        payload: <String, dynamic>{"tabIndex": index});
  }

  static Action initData(int index) {
    return const Action(MainAction.initData);
  }
}
