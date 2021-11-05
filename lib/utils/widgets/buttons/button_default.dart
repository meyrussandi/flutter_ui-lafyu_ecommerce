import 'package:flutter/material.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/colors.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/theme.dart';

class ButtonDefault extends StatelessWidget {
  const ButtonDefault({
    Key? key,
    required this.onPressed,
    required this.label,
    this.size,
    this.color,
    this.labelStyle,
    this.height,
    this.margin,
    this.enable = true,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  final Function() onPressed;
  final Color? color;
  final bool enable;
  final double? height;
  final String? icon;
  final Color? iconColor;
  final String label;
  final TextStyle? labelStyle;
  final EdgeInsets? margin;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin ?? EdgeInsets.zero,
        height: height ?? Sizes.xl + Sizes.xs,
        width: size ?? double.infinity,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: enable
                  ? color ?? MyColors.blueColor
                  : MyColors.greyColor,
              shape: RoundedRectangleBorder(
                borderRadius: Corners.lgBorder,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon != null
                    ? Padding(
                  padding: EdgeInsets.only(right: Insets.med),
                  child: Image.asset(
                    icon!,
                    width: IconSizes.med,
                    color: iconColor ?? MyColors.blueColor
                  ),
                )
                    : horizontalSpace(0),
                Text(
                  label,
                  style: labelStyle ??
                      TextStyles.mediumText1,
                  textAlign: TextAlign.center,
                ),
              ],
            )));
  }
}
