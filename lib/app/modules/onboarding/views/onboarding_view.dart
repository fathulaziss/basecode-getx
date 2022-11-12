import 'package:basecode_getx/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OnboardingView'), centerTitle: true),
      body: const Center(
        child:
            Text('OnboardingView is working', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
