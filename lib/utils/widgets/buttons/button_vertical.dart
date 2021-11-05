import 'package:flutter/material.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/theme.dart';

class ButtonVertical extends StatelessWidget {
  final String title;
  final String imagePath;
  const ButtonVertical({Key? key, required this.title, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:  EdgeInsets.all(Insets.xl + Insets.sm),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: MyColors.lightColor),
          ),
          child: Image.asset(MyIcons.icManShirt, width: IconSizes.sm,),
        ),
        verticalSpace(Insets.sm),
        Text(
          'Man Shirt',
          style: TextStyles.largeCaption2.copyWith(color: MyColors.greyColor),
        ),
      ],
    );
  }
}
