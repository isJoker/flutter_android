import 'package:fish_redux/fish_redux.dart';

enum WebAction { isLoading }

class WebActionCreator {

  static Action isLoading(bool isLoading) {
    return Action(WebAction.isLoading, payload: isLoading);
  }
}
