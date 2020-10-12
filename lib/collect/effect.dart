import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CollectState> buildEffect() {
  return combineEffects(<Object, Effect<CollectState>>{
    CollectAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CollectState> ctx) {
}
