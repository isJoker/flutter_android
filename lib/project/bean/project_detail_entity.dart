import 'package:flutter_android/generated/json/base/json_convert_content.dart';

class ProjectDetailEntity with JsonConvert<ProjectDetailEntity> {
	ProjectDetailData data;
	int errorCode;
	String errorMsg;
}

class ProjectDetailData with JsonConvert<ProjectDetailData> {
	int curPage;
	List<ProjectDetailItemData> datas;
	int offset;
	bool over;
	int pageCount;
	int size;
	int total;
}

class ProjectDetailItemData with JsonConvert<ProjectDetailItemData> {
	String apkLink;
	int audit;
	String author;
	bool canEdit;
	int chapterId;
	String chapterName;
	bool collect;
	int courseId;
	String desc;
	String descMd;
	String envelopePic;
	bool fresh;
	int id;
	String link;
	String niceDate;
	String niceShareDate;
	String origin;
	String prefix;
	String projectLink;
	int publishTime;
	int realSuperChapterId;
	int selfVisible;
	int shareDate;
	String shareUser;
	int superChapterId;
	String superChapterName;
	List<ProjectDetailTag> tags;
	String title;
	int type;
	int userId;
	int visible;
	int zan;
}

class ProjectDetailTag with JsonConvert<ProjectDetailTag> {
	String name;
	String url;
}
