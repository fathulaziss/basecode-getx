import 'package:basecode_getx/app/controllers/utility_controller.dart';
import 'package:basecode_getx/services/app_cycle_service.dart';
import 'package:basecode_getx/styles/colors.dart';
import 'package:basecode_getx/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final cUtility = Get.find<UtilityController>();
  double width = Get.width * 0.1;

  @override
  void initState() {
    cUtility.getAppLanguage();
    startAnimation();
    checkRoute();
    super.initState();
  }

  Future<void> startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (mounted) {
      setState(() {
        width = Get.width * 0.45;
      });
    }
  }

  Future<void> checkRoute() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    await AppCycleService().checkTokenAndRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          width: width,
          height: width,
          child: Image.asset(AppAsset.logo('logo_app.png')),
        ),
      ),
    );
  }
}
