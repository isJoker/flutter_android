import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android/project/project_detail/state.dart';
import 'package:flutter_android/project/project_item/component.dart';

class ProjectAdapter extends SourceFlowAdapter<ProjectDetailState> {
  static const String projectType = "articleType";

  ProjectAdapter()
      : super(pool: <String, Component<Object>>{
          projectType: ProjectItemComponent()
        });
}
