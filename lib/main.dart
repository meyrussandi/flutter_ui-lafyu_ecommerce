import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/colors.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/data.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

            return GetMaterialApp(
              theme: ThemeData(primaryColor: MyColors.blueColor),
              title: "Application",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
            );

  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.blueColor,
        body: Center(
          child: Image.asset("assets/logos/logo_white.png", height: IconSizes.xxl,),
        ),
      );
    ;
  }
}
