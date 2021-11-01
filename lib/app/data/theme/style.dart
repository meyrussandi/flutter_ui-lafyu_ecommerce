import 'package:flutter/material.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/colors.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/data.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

double scale = Get.width <= 320 ? 0.75 : 1;

class BorderStyles {
  static Border borderGrey =
      Border.all(color: Colors.grey.withOpacity(0.4), width: 1.5);
  static Border borderPrimary =
      Border.all(color: MyColors.blueColor, width: 1.5);

  static OutlineInputBorder enableTextField = OutlineInputBorder(
    borderSide: BorderSide(color: MyColors.greyColor, width: Strokes.xthin),
    borderRadius: Corners.lgBorder,
  );

  static OutlineInputBorder focusTextField = OutlineInputBorder(
    borderSide:
        const BorderSide(color: MyColors.greenColor, width: Strokes.med),
    borderRadius: Corners.lgBorder,
  );

  static OutlineInputBorder disableTextField = OutlineInputBorder(
    borderSide: BorderSide(color: MyColors.lightColor, width: Strokes.xthin),
    borderRadius: Corners.lgBorder,
  );

  static OutlineInputBorder errorTextField = OutlineInputBorder(
    borderSide:
        const BorderSide(color: MyColors.redColor, width: Strokes.xthin),
    borderRadius: Corners.lgBorder,
  );
}

InputDecoration inputDecoration(
    {required String hintText, Widget? prefixIcon, Widget? suffixIcon}) {
  return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: MyColors.lightColor,
      contentPadding:
          EdgeInsets.symmetric(horizontal: Insets.med, vertical: Insets.med),
      hintText: hintText,
      border: BorderStyles.enableTextField,
      focusedBorder: BorderStyles.focusTextField,
      enabledBorder: BorderStyles.enableTextField,
      errorBorder: BorderStyles.errorTextField,
      disabledBorder: BorderStyles.disableTextField,
      errorMaxLines: 5,
      prefixIcon: prefixIcon,
      prefixIconConstraints:
          BoxConstraints(minHeight: Sizes.lg, minWidth: Sizes.lg),
      suffixIcon: suffixIcon,
      hintStyle: TextStyles.normalText2.copyWith(color: MyColors.lightColor));
}

Widget verticalSpace(double v) {
  return SizedBox(height: v);
}

Widget horizontalSpace(double v) {
  return SizedBox(width: v);
}

/// Used for all animations in the  app
class Times {
  static const Duration fastest = Duration(milliseconds: 150);
  static const fast = Duration(milliseconds: 250);
  static const medium = Duration(milliseconds: 350);
  static const slow = Duration(milliseconds: 700);
  static const slower = Duration(milliseconds: 1000);
}

class Sizes {
  static double get xs => 8 * scale;
  static double get sm => 12 * scale;
  static double get med => 20 * scale;
  static double get lg => 32 * scale;
  static double get xl => 48 * scale;
  static double get xxl => 80 * scale;
}

class IconSizes {
  static double get sm => 16 * scale;
  static double get med => 24 * scale;
  static double get lg => 32 * scale;
  static double get xl => 48 * scale;
  static double get xxl => 60 * scale;
}

class Insets {
  static double offsetScale = 1;
  static double get xs => 4 * scale;
  static double get sm => 8 * scale;
  static double get med => 12 * scale;
  static double get lg => 16 * scale;
  static double get xl => 20 * scale;
  static double get xxl => 32 * scale;
  // Offset, used for the edge of the window, or to separate large sections in the app
  static double get offset => 40 * offsetScale;
}

class Corners {
  static double sm = 3 * scale;
  static BorderRadius smBorder = BorderRadius.all(smRadius);
  static Radius smRadius = Radius.circular(sm);

  static double med = 5 * scale;
  static BorderRadius medBorder = BorderRadius.all(medRadius);
  static Radius medRadius = Radius.circular(med);

  static double lg = 8 * scale;
  static BorderRadius lgBorder = BorderRadius.all(lgRadius);
  static Radius lgRadius = Radius.circular(lg);

  static double xl = 16 * scale;
  static BorderRadius xlBorder = BorderRadius.all(xlRadius);
  static Radius xlRadius = Radius.circular(xl);

  static double xxl = 24 * scale;
  static BorderRadius xxlBorder = BorderRadius.all(xxlRadius);
  static Radius xxlRadius = Radius.circular(xxl);
}

class Strokes {
  static const double xthin = 0.7;
  static const double thin = 1;
  static const double med = 2;
  static const double thick = 4;
}

class Shadows {
  static List<BoxShadow> get universal => [
        BoxShadow(
            color: const Color(0xff333333).withOpacity(.13),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 5)),
      ];
  static List<BoxShadow> get small => [
        BoxShadow(
            color: const Color(0xff333333).withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(0, 1)),
      ];
  static List<BoxShadow> get none => [
        BoxShadow(
            color: MyColors.whiteColor,
            spreadRadius: 0,
            blurRadius: 0,
            offset: const Offset(0, 0)),
      ];

  static List<BoxShadow> get shadowsUp => [
        BoxShadow(
            color: const Color(0xff333333).withOpacity(.15),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(-1, 0)),
      ];
}

/// Font Sizes
/// You can use these directly if you need, but usually there should be a predefined style in TextStyles.
class FontSizes {
  /// Provides the ability to nudge the app-wide font scale in either direction
  static double get s9 => 9 * scale;
  static double get s10 => 10 * scale;
  static double get s11 => 11 * scale;
  static double get s12 => 12 * scale;
  static double get s14 => 14 * scale;
  static double get s16 => 16 * scale;
  static double get s18 => 18 * scale;
  static double get s20 => 20 * scale;
  static double get s24 => 24 * scale;
  static double get s26 => 26 * scale;
  static double get s32 => 32 * scale;
  static double get s40 => 40 * scale;
  static double get s56 => 56 * scale;
}

/// Fonts - A list of Font Families, this is uses by the TextStyles class to create concrete styles.

/// TextStyles - All the core text styles for the app should be declared here.
/// Don't try and create every variant in existence here, just the high level ones.
/// More specific variants can be created on the fly using `style.copyWith()`
/// `newStyle = TextStyles.body1.copyWith(lineHeight: 2, color: Colors.red)`
class TextStyles {
  /// Declare a base style for each Family if use assets/fonts
  // static const TextStyle inter =
  // TextStyle(fontWeight: FontWeight.w400, height: 1, fontFamily: 'Inter');
  /// use googlefonts
  static TextStyle poppins = GoogleFonts.poppins().copyWith(letterSpacing: -.05,);

  static TextStyle get h1 => poppins.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: FontSizes.s32,
      height: 1.5);
  static TextStyle get h2 => h1.copyWith(
        fontSize: FontSizes.s24,
      );
  static TextStyle get h3 => h1.copyWith(
        fontSize: FontSizes.s20,
      );

  static TextStyle get h4 => h1.copyWith(fontSize: FontSizes.s16);
  static TextStyle get h5 => h1.copyWith(fontSize: FontSizes.s14);
  static TextStyle get h6 => h3.copyWith(fontSize: FontSizes.s10);
  static TextStyle get largeText1 => poppins.copyWith(
      fontWeight: FontWeight.w700, fontSize: FontSizes.s16, height: 1.8);
  static TextStyle get largeText2 => largeText1.copyWith(
      fontWeight: FontWeight.w400, fontSize: FontSizes.s16);
  static TextStyle get mediumText1 => poppins.copyWith(
      fontWeight: FontWeight.w700, fontSize: FontSizes.s14, height: 1.8);
  static TextStyle get mediumText2 =>
      mediumText1.copyWith(fontWeight: FontWeight.w400,fontSize: FontSizes.s14);
  static TextStyle get normalText1 => poppins.copyWith(
        fontSize: FontSizes.s12,
        fontWeight: FontWeight.w700,
        height: 1.8,
      );
  static TextStyle get normalText2 =>
      normalText1.copyWith(fontSize: FontSizes.s12, fontWeight: FontWeight.w400);
  static TextStyle get largeCaption1 => poppins.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: FontSizes.s12,
      height: 1.5,
      letterSpacing: .5);
  static TextStyle get largeCaption2 =>
      largeCaption1.copyWith(fontSize: FontSizes.s12,      fontWeight: FontWeight.w400,
      );
  static TextStyle get largeCaption3 =>
      largeCaption1.copyWith(fontSize: FontSizes.s10, fontWeight: FontWeight.w700,);
  static TextStyle get largeCaption4 =>
      largeCaption1.copyWith(fontSize: FontSizes.s10, fontWeight: FontWeight.w400,);
  static TextStyle get linkCaption1 => largeCaption1.copyWith(color: MyColors.blueColor);
  static TextStyle get linkCaption2 => largeCaption1.copyWith(color: MyColors.blueColor, fontWeight: FontWeight.w400);

}

class Borders {
  static const BorderSide universalBorder = BorderSide(
    color: MyColors.greenColor,
    width: 1,
  );

  static const BorderSide smallBorder = BorderSide(
    color: MyColors.greyColor,
    width: 0.5,
  );

  static BoxDecoration borderPin({
    Color? borderColor,
    double? strokeWidth,
  }) {
    return BoxDecoration(
        color: MyColors.lightColor,
        borderRadius: Corners.lgBorder,
        border: Border.all(
          width: strokeWidth ?? Strokes.xthin,
          color: borderColor ?? MyColors.lightColor,
        ));
  }
}
