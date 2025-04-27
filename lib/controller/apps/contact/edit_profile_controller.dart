import '../../../controller/my_controller.dart';
import '../../../helper/widgets/my_form_validator.dart';

class EditProfileController extends MyController {
  MyFormValidator validation = MyFormValidator();
  bool showPassword = false;

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }
}
