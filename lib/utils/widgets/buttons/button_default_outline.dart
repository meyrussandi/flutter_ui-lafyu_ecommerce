import 'package:flutter/material.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/theme.dart';

class ButtonDefaultOutline extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final double? width;
  final Color? color;
  final Color? outlineColor;
  final double? elevation;
  final String? icon;
  final TextStyle? labelStyle;
  final Color? iconColor;
  final double? height;
  final bool enable;

  const ButtonDefaultOutline({
    Key? key,
    required this.onPressed,
    required this.label,
    this.width,
    this.color,
    this.outlineColor,
    this.elevation,
    this.icon,
    this.labelStyle,
    this.iconColor,
    this.height,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Sizes.xl + Sizes.xs,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 1,
          primary: color ?? MyColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: Corners.lgBorder,
            side: BorderSide(
                color: enable
                    ? outlineColor ?? MyColors.blueColor
                    : MyColors.greyColor,
                width: Strokes.thin),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.med, vertical: Insets.med),
              child: Image.asset(
                icon!,
                width: IconSizes.med,
              ),
            )
                : horizontalSpace(0),
            Expanded(
              child: Text(
                label,
                style: labelStyle ??
                    TextStyles.mediumText1.copyWith(
                        color: enable
                            ? MyColors.blueColor
                            :MyColors.greyColor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
