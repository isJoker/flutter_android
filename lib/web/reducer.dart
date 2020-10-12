import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WebState> buildReducer() {
  return asReducer(
    <Object, Reducer<WebState>>{
      WebAction.isLoading: _onIsLoading,
    },
  );
}

WebState _onIsLoading(WebState state, Action action) {
  WebState newState = state.clone();
  newState.isLoading = action.payload;
  return newState;
}
