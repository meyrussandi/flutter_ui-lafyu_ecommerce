import 'package:flutter/material.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/data.dart';
import 'package:flutter_ui_lafyu_e_commerce/utils/widgets/button/button_default.dart';
import 'package:flutter_ui_lafyu_e_commerce/utils/widgets/form/form_default.dart';
import 'package:flutter_ui_lafyu_e_commerce/utils/widgets/form/form_email.dart';
import 'package:flutter_ui_lafyu_e_commerce/utils/widgets/form/form_password.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Insets.lg),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpace(Sizes.xxl),
                Image.asset(MyLogos.logoBlue, height: IconSizes.xxl),
                verticalSpace(Insets.lg),
                Text(
                  "Welcome to Lafyuu",
                  style: TextStyles.h4,
                ),
                verticalSpace(Insets.sm),
                Text(
                  "Sign in to continue",
                  style: TextStyles.normalText2,
                ),
                verticalSpace(Sizes.med),
                FormDefault(
                  hintText: "Full Name",
                  controller: controller.fullNameController,
                  onChange: (String) {},
                  prefixIcon: Icon(Icons.person),
                ),
                FormEmail(
                    hintText: "Your Email",
                    controller: controller.emailController,
                    isValid: (v) {},
                    email: (v) {}),
                FormPassword(
                    hintText: "Password",
                    onChange: (v) {},
                    validate: (v) {},
                    controller: controller.passwordController),
                FormPassword(
                    hintText: "Password Again",
                    onChange: (v) {},
                    validate: (v) {},
                    controller: controller.confirmPasswordController),
                ButtonDefault(onPressed: () {}, label: "Sign Up"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("have a account? ",
                        style: TextStyles.mediumText2
                            .copyWith(color: MyColors.greyColor)),
                    TextButton(
                      onPressed: () => Get.back(),
                      child: Text("Sign In",
                          style: TextStyles.mediumText1
                              .copyWith(color: MyColors.blueColor)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
