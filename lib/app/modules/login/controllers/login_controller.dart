import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final cDate = TextEditingController();
  final cPhoneNumber = TextEditingController();

  List<String> listDropdownExample = [
    'Dropdwon Item 1',
    'Dropdown Item 2',
    'Dropdown Item 3'
  ];
  RxString selectedDropdown = ''.obs;

  List<String> listLanguage = [
    'ID',
    'EN',
  ];
  RxString selectedLanguage = 'ID'.obs;

  void setSelectedDropdown(String value) {
    selectedDropdown(value);
  }

  void setSelectedLanguage(String value) {
    selectedLanguage(value);
  }
}
