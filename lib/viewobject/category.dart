import 'common/app_object.dart';
// import 'default_icon.dart';
// import 'default_photo.dart';

class Category extends AppObject<Category> {
  Category(
      {this.id = '',
      // this.name = '',
      // this.status = '',
      // this.addedDate = '',
      // this.addedUserId = '',
      // this.updatedDate = '',
      // this.updatedUserId = '',
      // this.updatedFlag = '',
      // this.touchCount = '',
      // this.addedDateStr = '',
      // this.defaultPhoto = null,
      // this.defaultIcon = null,
      this.author = '',
      this.downloadUrl = ''});
  late String id;
  // late String name;
  // late String status;
  // late String addedDate;
  // late String addedUserId;
  // late String updatedDate;
  // late String updatedUserId;
  // late String updatedFlag;
  // late String touchCount;
  // late String addedDateStr;
  // DefaultPhoto? defaultPhoto;
  // DefaultIcon? defaultIcon;
  late String author;
  late String downloadUrl;

  @override
  String getPrimaryKey() {
    return id ?? '';
  }

  @override
  Category fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return Category(
          id: dynamicData['id'],
          // name: dynamicData['name'],
          // status: dynamicData['status'],
          // addedDate: dynamicData['added_date'],
          // addedUserId: dynamicData['added_user_id'],
          // updatedDate: dynamicData['updated_date'],
          // updatedUserId: dynamicData['updated_user_id'],
          // updatedFlag: dynamicData['updated_flag'],
          // touchCount: dynamicData['touch_count'],
          // addedDateStr: dynamicData['added_date_str'],
          // defaultPhoto: DefaultPhoto().fromMap(dynamicData['default_photo']),
          // defaultIcon: DefaultIcon().fromMap(dynamicData['default_icon']),
          author: dynamicData['author'],
          downloadUrl: dynamicData['download_url'],);
    } else {
      return Category();
    }
  }

  @override
  Map<String, dynamic> toMap(Category object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (object != null) {
      data['id'] = object.id;
      // data['name'] = object.name;
      // data['status'] = object.status;
      // data['added_date'] = object.addedDate;
      // data['added_user_id'] = object.addedUserId;
      // data['updated_date'] = object.updatedFlag;
      // data['updated_user_id'] = object.updatedUserId;
      // data['updated_flag'] = object.updatedFlag;
      // data['touch_count'] = object.touchCount;
      // data['added_date_str'] = object.addedDateStr;
      // data['default_photo'] = DefaultPhoto().toMap(object.defaultPhoto);
      // data['default_icon'] = DefaultIcon().toMap(object.defaultIcon);
      data['author'] = object.author;
      data['download_url'] = object.downloadUrl;
      return data;
    } else {
      return data;
    }
  }

  @override
  List<Category> fromMapList(List<dynamic> dynamicDataList) {
    final List<Category> subCategoryList = <Category>[];

    if (dynamicDataList != null) {
      for (dynamic dynamicData in dynamicDataList) {
        if (dynamicData != null) {
          subCategoryList.add(fromMap(dynamicData));
        }
      }
    }
    return subCategoryList;
  }

  @override
  List<Map<String, dynamic>> toMapList(List<Category> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (Category data in objectList) {
        if (data != null) {
          mapList.add(toMap(data));
        }
      }
    }

    return mapList;
  }
}
