import 'package:basecode_getx/constants/constant.dart';
import 'package:basecode_getx/utils/app_storage.dart';
import 'package:basecode_getx/utils/app_utils.dart';
import 'package:get/get.dart';

class UtilityController extends GetxController {
  String appVersion = 'version 1.0.0';
  RxBool isShowLog = false.obs;
  RxString currentPage = ''.obs;

  @override
  void onInit() {
    getAppVersion();
    initData();
    super.onInit();
  }

  Future<void> initData() async {
    final b = await AppStorage.isContain(key: 'log-button');
    isShowLog(b);
  }

  Future<void> getAppVersion() async {
    appVersion = await AppUtils.getAppVersion();
  }

  Future<void> showLogButton() async {
    await AppStorage.write(key: LOG_BUTTON, value: '1');
    isShowLog(true);
  }

  Future<void> hideLogButton() async {
    await AppStorage.delete(key: LOG_BUTTON);
    isShowLog(false);
  }
}
