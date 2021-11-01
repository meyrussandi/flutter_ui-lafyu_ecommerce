import 'package:flutter/material.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/data.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              verticalSpace(Sizes.med +Sizes.xl),
              Image.asset(MyLogos.logo_blue, height: IconSizes.xxl),verticalSpace(Insets.lg),
              Text("Welcome to Lafyuu", style: TextStyles.h4,),
              verticalSpace(Insets.sm),
              Text("Sign in to continue", style: TextStyles.normalText2,),
            ],
          ),
        ],
      ),
    );
  }
}
