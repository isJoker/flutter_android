import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WebPage extends Page<WebState, Map<String, dynamic>> {
  WebPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WebState>(
                adapter: null,
                slots: <String, Dependent<WebState>>{
                }),
            middleware: <Middleware<WebState>>[
            ],);

}
