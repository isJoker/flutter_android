import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ProjectDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<ProjectDetailState>>{
      ProjectDetailAction.updateItems: _onUpdateData,
    },
  );
}

ProjectDetailState _onUpdateData(ProjectDetailState state, Action action) {
  ProjectDetailState newState = state.clone();
  newState.items = action.payload;
  newState.isLoading = false;
  return newState;
}
