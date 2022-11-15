import 'package:basecode_getx/app/modules/login/controllers/login_controller.dart';
import 'package:basecode_getx/styles/styles.dart';
import 'package:basecode_getx/widgets/buttons/button_primary.dart';
import 'package:basecode_getx/widgets/inputs/input_date.dart';
import 'package:basecode_getx/widgets/inputs/input_dropdown.dart';
import 'package:basecode_getx/widgets/inputs/input_email.dart';
import 'package:basecode_getx/widgets/inputs/input_number.dart';
import 'package:basecode_getx/widgets/inputs/input_password.dart';
import 'package:basecode_getx/widgets/inputs/input_phone.dart';
import 'package:basecode_getx/widgets/inputs/input_primary.dart';
import 'package:basecode_getx/widgets/others/input_dropdwon_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputPrimary(
                  label: 'Input Primary',
                  onChanged: (value) {},
                ),
                InputEmail(
                  label: 'Input Email',
                  value: (value) {},
                ),
                InputPassword(
                  label: 'Input Password',
                  value: (value) {},
                ),
                InputNumber(
                  label: 'Input Number',
                  value: (value) {},
                ),
                InputPhone(
                  label: 'Input Phone',
                  controller: controller.cPhoneNumber,
                  value: (value) {},
                ),
                Obx(
                  () => InputDropdown(
                    title: 'Input Dropdown',
                    hintText: 'Choose Item',
                    items: [
                      ...controller.listDropdownExample.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: InputDropdownItem(value: item),
                        );
                      })
                    ],
                    selectedItem: controller.selectedDropdown.value,
                    onChanged: (value) {
                      if (value != null) {
                        final data = value as String;
                        controller.setSelectedDropdown(data);
                      }
                    },
                  ),
                ),
                InputDate(
                  label: 'Input Date',
                  controller: controller.cDate,
                  value: (value) {},
                ),
                verticalSpace(Insets.lg),
                ButtonPrimary(
                  label: 'LOGIN',
                  onTap: () {},
                )
              ],
            ),
          ),
          Positioned(
            top: 40.w,
            right: 30.w,
            child: SizedBox(
              width: 72.w,
              height: 50.w,
              child: Obx(
                () => InputDropdown(
                  hintText: '',
                  borderColor: Colors.blueGrey[100],
                  outlinedBorderColor: Colors.transparent,
                  textAlign: TextAlign.center,
                  items: [
                    ...controller.listLanguage.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: InputDropdownItem(value: item),
                      );
                    })
                  ],
                  selectedItem: controller.selectedLanguage.value,
                  onChanged: (value) {
                    if (value != null) {
                      final data = value as String;
                      controller.selectedLanguage(data);
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
