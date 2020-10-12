import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android/project/project_detail/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ProjectDetailPage extends Page<ProjectDetailState, Map<String, dynamic>> {
  ProjectDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ProjectDetailState>(
                adapter: NoneConn<ProjectDetailState>() + ProjectAdapter(),
                slots: <String, Dependent<ProjectDetailState>>{
                }),
            middleware: <Middleware<ProjectDetailState>>[
            ],);

}
