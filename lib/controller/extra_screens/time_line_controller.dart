import '../../controller/my_controller.dart';
import '../../models/discover_data.dart';

class TimeLineController extends MyController {
  List<Discover> discover = [];

  @override
  void onInit() {
    super.onInit();
    Discover.dummyList.then((value) {
      discover = value.sublist(0, 10);
      update();
    });
  }
}
