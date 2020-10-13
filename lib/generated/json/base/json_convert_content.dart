// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_android/home/bean/home_article_entity.dart';
import 'package:flutter_android/generated/json/home_article_entity_helper.dart';
import 'package:flutter_android/common/bean/banner_entity.dart';
import 'package:flutter_android/generated/json/banner_entity_helper.dart';
import 'package:flutter_android/project/bean/project_tab_entity.dart';
import 'package:flutter_android/generated/json/project_tab_entity_helper.dart';
import 'package:flutter_android/project/bean/project_detail_entity.dart';
import 'package:flutter_android/generated/json/project_detail_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case HomeArticleEntity:
			return homeArticleEntityFromJson(data as HomeArticleEntity, json) as T;			case HomeArticleDataList:
			return homeArticleDataListFromJson(data as HomeArticleDataList, json) as T;			case HomeArticleData:
			return homeArticleDataFromJson(data as HomeArticleData, json) as T;			case BannerEntity:
			return bannerEntityFromJson(data as BannerEntity, json) as T;			case BannerData:
			return bannerDataFromJson(data as BannerData, json) as T;			case ProjectTabEntity:
			return projectTabEntityFromJson(data as ProjectTabEntity, json) as T;			case ProjectTabData:
			return projectTabDataFromJson(data as ProjectTabData, json) as T;			case ProjectDetailEntity:
			return projectDetailEntityFromJson(data as ProjectDetailEntity, json) as T;			case ProjectDetailData:
			return projectDetailDataFromJson(data as ProjectDetailData, json) as T;			case ProjectDetailItemData:
			return projectDetailDataDataFromJson(data as ProjectDetailItemData, json) as T;			case ProjectDetailTag:
			return projectDetailDataDatasTagFromJson(data as ProjectDetailTag, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case HomeArticleEntity:
			return homeArticleEntityToJson(data as HomeArticleEntity);			case HomeArticleDataList:
			return homeArticleDataListToJson(data as HomeArticleDataList);			case HomeArticleData:
			return homeArticleDataToJson(data as HomeArticleData);			case BannerEntity:
			return bannerEntityToJson(data as BannerEntity);			case BannerData:
			return bannerDataToJson(data as BannerData);			case ProjectTabEntity:
			return projectTabEntityToJson(data as ProjectTabEntity);			case ProjectTabData:
			return projectTabDataToJson(data as ProjectTabData);			case ProjectDetailEntity:
			return projectDetailEntityToJson(data as ProjectDetailEntity);			case ProjectDetailData:
			return projectDetailDataToJson(data as ProjectDetailData);			case ProjectDetailItemData:
			return projectDetailDataDataToJson(data as ProjectDetailItemData);			case ProjectDetailTag:
			return projectDetailDataDatasTagToJson(data as ProjectDetailTag);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'HomeArticleEntity':
			return HomeArticleEntity().fromJson(json);			case 'HomeArticleDataList':
			return HomeArticleDataList().fromJson(json);			case 'HomeArticleData':
			return HomeArticleData().fromJson(json);			case 'BannerEntity':
			return BannerEntity().fromJson(json);			case 'BannerData':
			return BannerData().fromJson(json);			case 'ProjectTabEntity':
			return ProjectTabEntity().fromJson(json);			case 'ProjectTabData':
			return ProjectTabData().fromJson(json);			case 'ProjectDetailEntity':
			return ProjectDetailEntity().fromJson(json);			case 'ProjectDetailData':
			return ProjectDetailData().fromJson(json);			case 'ProjectDetailDataData':
			return ProjectDetailItemData().fromJson(json);			case 'ProjectDetailDataDatasTag':
			return ProjectDetailTag().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'HomeArticleEntity':
			return List<HomeArticleEntity>();			case 'HomeArticleDataList':
			return List<HomeArticleDataList>();			case 'HomeArticleData':
			return List<HomeArticleData>();			case 'BannerEntity':
			return List<BannerEntity>();			case 'BannerData':
			return List<BannerData>();			case 'ProjectTabEntity':
			return List<ProjectTabEntity>();			case 'ProjectTabData':
			return List<ProjectTabData>();			case 'ProjectDetailEntity':
			return List<ProjectDetailEntity>();			case 'ProjectDetailData':
			return List<ProjectDetailData>();			case 'ProjectDetailDataData':
			return List<ProjectDetailItemData>();			case 'ProjectDetailDataDatasTag':
			return List<ProjectDetailTag>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}