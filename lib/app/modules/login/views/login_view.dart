import 'package:basecode_getx/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LoginView'), centerTitle: true),
      body: const Center(
        child: Text('LoginView is working', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
