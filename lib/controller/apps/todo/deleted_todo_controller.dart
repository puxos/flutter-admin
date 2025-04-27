import 'package:get/get.dart';
import '../../../views/apps/todo/todo_cache.dart';

class DeletedTodoController extends GetxController {
  void onPermanentDelete(id) {
    TodoCache.deleteTodo.remove(id);
    update();
  }

  void removeData() {}
}
