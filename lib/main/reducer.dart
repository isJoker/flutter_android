import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MainState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainState>>{
      MainAction.selectTab: _onSelectTab,
    },
  );
}

MainState _onSelectTab(MainState state, Action action) {
  final MainState newState = state.clone();
  Map<String, dynamic> tab = action.payload;
  newState.selectedIndex = tab['tabIndex'];
  return newState;
}
