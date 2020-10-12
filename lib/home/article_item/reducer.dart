import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ArticleItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<ArticleItemState>>{
      ArticleItemAction.updateArticleCollect: _onUpdateArticleCollect
    },
  );
}

ArticleItemState _onUpdateArticleCollect(
    ArticleItemState state, Action action) {

  if (state.itemData.id == action.payload) {
    ArticleItemState newState = state.clone();
    newState.itemData.collect = !newState.itemData.collect;
    return newState;
  } else {
    return state;
  }
}
