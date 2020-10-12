import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ProjectItemComponent extends Component<ProjectItemState> {
  ProjectItemComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ProjectItemState>(
                adapter: null,
                slots: <String, Dependent<ProjectItemState>>{
                }),);

}
