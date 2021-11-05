import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/constants/constants.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/constants/dummy_promo.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/assets.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/colors.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/data.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/style.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/theme.dart';
import 'package:flutter_ui_lafyu_e_commerce/utils/widgets/buttons/button_vertical.dart';
import 'package:flutter_ui_lafyu_e_commerce/utils/widgets/cards/card_offer.dart';
import 'package:flutter_ui_lafyu_e_commerce/utils/widgets/forms/form_default.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Sizes.xxl,
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.whiteColor,
        title: InkWell(
          child: FormDefault(
            enable: false,
            controller: TextEditingController(),
            onChange: (String) {},
            prefixIcon: Icon(
              Icons.search,
              color: MyColors.blueColor,
            ),
          ),
        ),
        actions: [
          Icon(
            Icons.favorite_border_outlined,
            color: MyColors.greyColor,
          ),
          Icon(
            Icons.notifications_outlined,
            color: MyColors.greyColor,
          ),
          horizontalSpace(Insets.lg)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(Insets.lg),
            Padding(
              padding: EdgeInsets.all(Insets.lg),
              child: HeaderHome(),
            ),
            Padding(
              padding:  EdgeInsets.all(Insets.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category',
                    style: TextStyles.h5,
                  ),
                  Text(
                    'More Category',
                    style: TextStyles.mediumText1.copyWith(color: MyColors.blueColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Sizes.xxl * 1.5,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: MenuService.listMenuServices.map((e) => Padding(
                  padding: EdgeInsets.only(left: MenuService.listMenuServices.indexOf(e)==0?Insets.lg:0, right: Insets.lg),
                  child: ButtonVertical(title: e['title'],imagePath: e['icon'],),
                )).take(5).toList(),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(Insets.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Flash Sale',
                    style: TextStyles.h5,
                  ),
                  Text(
                    'See More',
                    style: TextStyles.mediumText1.copyWith(color: MyColors.blueColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderHome extends StatefulWidget {
  HeaderHome({
    Key? key,
  }) : super(key: key);

  @override
  _HeaderHomeState createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
            carouselController: _controller,
            items: dummyPromo.map((e) => CardPromo(model: e)).toList(),
            options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                })),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dummyPromo.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}



