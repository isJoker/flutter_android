import 'package:fish_redux/fish_redux.dart';

import 'bean/project_tab_entity.dart';

enum ProjectAction { updateProjectTab }

class ProjectActionCreator {
  static Action onUpdateProjectTab(List<ProjectTabData> data) {
    return Action(ProjectAction.updateProjectTab, payload: data);
  }
}
