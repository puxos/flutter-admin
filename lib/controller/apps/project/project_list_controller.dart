import 'package:get/get.dart';
import '../../../controller/my_controller.dart';
import '../../../helper/widgets/my_text_utils.dart';
import '../../../images.dart';
import '../../../models/project_list_data.dart';

class ProjectListController extends MyController {
  List<ProjectList> projectList = [];
  List<String> dummyTexts = List.generate(12, (index) => MyTextUtils.getDummyText(60));
  List<String> images = [Images.avatars[0], Images.avatars[1], Images.avatars[2], Images.avatars[3]];

  @override
  void onInit() {
    super.onInit();
    ProjectList.dummyList.then((value) {
      projectList = value.sublist(0, 7);
      update();
    });
  }

  void goToCreateProject() {
    Get.toNamed('/projects/create-project');
  }
}
