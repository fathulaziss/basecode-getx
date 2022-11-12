import 'package:basecode_getx/app/controllers/user_info_controller.dart';
import 'package:basecode_getx/app/controllers/utility_controller.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(UserInfoController())
      ..put(UtilityController());
  }
}
