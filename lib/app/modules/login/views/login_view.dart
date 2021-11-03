import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/assets.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/colors.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/data.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/style.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/theme.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/routes/app_pages.dart';
import 'package:flutter_ui_lafyu_e_commerce/utils/widgets/button/button_default.dart';
import 'package:flutter_ui_lafyu_e_commerce/utils/widgets/button/button_default_outline.dart';
import 'package:flutter_ui_lafyu_e_commerce/utils/widgets/form/form_default.dart';
import 'package:flutter_ui_lafyu_e_commerce/utils/widgets/form/form_email.dart';
import 'package:flutter_ui_lafyu_e_commerce/utils/widgets/form/form_password.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: Insets.lg),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpace(Sizes.med + Sizes.xl),
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
                FormEmail(
                  hintText: "Your Email",
                  controller: controller.controllerEmail,
                  isValid: (v) {
                    controller.emailValid.value = v;
                  },
                  email: (v) {},
                ),
                FormPassword(
                  hintText: "Password",
                    validate: (v) {},
                    onChange: (v) {},
                    controller: controller.controllerPassword),
                verticalSpace(Insets.lg),
                ButtonDefault(onPressed: () {}, label: "Sign In"),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: MyColors.lightColor,
                    )),
                    Padding(
                      padding: EdgeInsets.all(Insets.xl),
                      child: Text(
                        "OR",
                        style: TextStyles.mediumText1
                            .copyWith(color: MyColors.greyColor),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: MyColors.lightColor,
                    )),
                  ],
                ),
                ButtonDefaultOutline(
                  onPressed: () {},
                  label: "Login with Google",
                  icon: MyIcons.icGoogle,
                  labelStyle:
                      TextStyles.mediumText1.copyWith(color: MyColors.greyColor),
                ),
                verticalSpace(Insets.lg),
                ButtonDefaultOutline(
                  onPressed: () {},
                  label: "Login with facebook",
                  icon: MyIcons.icFacebook,
                  labelStyle:
                      TextStyles.mediumText1.copyWith(color: MyColors.greyColor),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyles.mediumText1
                          .copyWith(color: MyColors.blueColor),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have a account?",
                        style: TextStyles.mediumText2
                            .copyWith(color: MyColors.greyColor)),
                    TextButton(
                      onPressed: ()=>Get.toNamed(Routes.REGISTER),
                      child: Text(" Register",
                          style: TextStyles.mediumText1
                              .copyWith(color: MyColors.blueColor)),
                    ),
                  ],
                ),
                verticalSpace(Insets.lg),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
