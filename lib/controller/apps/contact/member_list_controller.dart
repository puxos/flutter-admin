import '../../../controller/my_controller.dart';
import '../../../helper/widgets/my_form_validator.dart';
import '../../../models/discover2_data.dart';
import '../../../models/opportunities_data.dart';

class MemberListController extends MyController {
  List<Discover2> discover = [];
  List<Opportunities> opportunities = [];

  MyFormValidator basicValidator = MyFormValidator();
  bool loading = false;

  @override
  void onInit() {
    super.onInit();

    Discover2.dummyList.then((value) {
      discover = value.sublist(0, 7);
      update();
    });
    Opportunities.dummyList.then((value) {
      opportunities = value.sublist(0, 7);
      update();
    });
  }
}
