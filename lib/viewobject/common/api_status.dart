import 'package:dni_ecommerce_v2/viewobject/common/app_object.dart';

class ApiStatus extends AppObject<ApiStatus> {
  ApiStatus({
    this.status,
    this.message,
  });

  String? status;
  String? message;

  @override
  String getPrimaryKey() {
    return status ?? '';
  }

  @override
  List<ApiStatus> fromMapList(List<dynamic> dynamicDataList) {
    final List<ApiStatus> subCategoryList = <ApiStatus>[];

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
  ApiStatus fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return ApiStatus(
        status: dynamicData['status'],
        message: dynamicData['message'],
      );
    } else {
      return ApiStatus();
    }
  }

  @override
  Map<String, dynamic> toMap(ApiStatus object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (object != null) {
      
      data['status'] = object.status;
      data['message'] = object.message;

      return data;
    } else {
      return data;
    }
  }

  @override
  List<Map<String, dynamic>> toMapList(List<ApiStatus> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (ApiStatus data in objectList) {
        if (data != null) {
          mapList.add(toMap(data));
        }
      }
    }
    return mapList;
  }
}
