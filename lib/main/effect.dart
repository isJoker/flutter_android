import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<MainState> buildEffect() {
  return combineEffects(<Object, Effect<MainState>>{
    MainAction.initData: _onInitData,
  });
}

void _onInitData(Action action, Context<MainState> ctx) {

}
