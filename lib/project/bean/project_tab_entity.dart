import 'package:flutter_android/generated/json/base/json_convert_content.dart';

class ProjectTabEntity with JsonConvert<ProjectTabEntity> {
	List<ProjectTabData> data;
	int errorCode;
	String errorMsg;
}

class ProjectTabData with JsonConvert<ProjectTabData> {
	List<dynamic> children;
	int courseId;
	int id;
	String name;
	int order;
	int parentChapterId;
	bool userControlSetTop;
	int visible;
}
