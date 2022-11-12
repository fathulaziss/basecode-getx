import 'package:basecode_getx/app/bindings/initial_bindings.dart';
import 'package:basecode_getx/app/controllers/utility_controller.dart';
import 'package:basecode_getx/app/modules/api_log/components/api_log_overlay_button.dart';
import 'package:basecode_getx/app/routes/app_pages.dart';
import 'package:basecode_getx/styles/styles.dart';
import 'package:basecode_getx/utils/app_utils.dart';
import 'package:basecode_getx/widgets/pages/page_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

start() {
  Get.put(UtilityController());
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final cUtility = Get.find<UtilityController>();
  String pageName = '';

  void updatePageRoute(Routing? value) {
    try {
      final name = value!.route!.settings.name.toString();
      cUtility.currentPage.value = name;
      setState(() {
        pageName = name;
      });
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Basecode Getx',
          theme: AppStyle.appTheme(0xFF00B34D, Colors.white),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaleFactor: Get.width <= 360 ? .85 : 1),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: AppUtils.dismissKeyboard,
                child: Obx(
                  () => Stack(
                    children: [
                      child!,
                      if (cUtility.isShowLog.value) const ApiLogOverlayButton(),
                      if (cUtility.isShowLog.value)
                        PageInfo(pageName: pageName),
                    ],
                  ),
                ),
              ),
            );
          },
          initialBinding: InitialBindings(),
          initialRoute: Routes.SPLASH_SCREEN,
          getPages: AppPages.routes,
          locale: const Locale('id', 'ID'),
          routingCallback: (value) {
            if (value != null) updatePageRoute(value);
          },
        );
      },
    );
  }
}
