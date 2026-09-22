import 'app_object.dart';

abstract class AppMapObject<T> extends AppObject<T> {
   int sorting = 0;

  List<String> getIdList(List<T> mapList);
}
