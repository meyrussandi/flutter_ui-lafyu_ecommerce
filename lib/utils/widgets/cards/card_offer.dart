import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/theme.dart';
import 'package:get/get.dart';

class CardPromo extends StatefulWidget {
  final Map<String, dynamic> model;
  const CardPromo({Key? key, required this.model}) : super(key: key);

  @override
  _CardPromoState createState() => _CardPromoState();
}

class _CardPromoState extends State<CardPromo> {
  Timer? _timer;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  @override
  void initState() {
    super.initState();
    hours = int.parse(widget.model['remaining_time'].toString().split(":")[0]);
    minutes =
        int.parse(widget.model['remaining_time'].toString().split(":")[1]);
    seconds =
        int.parse(widget.model['remaining_time'].toString().split(":")[2]);
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      if(hours == 0){
        setState(() {
          timer.cancel();
        });
      }else{
        if(seconds == 0) {
          seconds = 60;
          minutes--;
        }if(minutes == -1){
          minutes = 59;
          hours--;
        }
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Insets.lg),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage( widget.model['image']),fit: BoxFit.fill
          )
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: Get.width * 0.5,
              child: Text(
                widget.model['title'],
                style: TextStyles.h2.copyWith(color: MyColors.whiteColor),
              )),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(Insets.sm),
                decoration: BoxDecoration(
                  color: MyColors.whiteColor,
                  borderRadius: Corners.medBorder,
                ),
                child:
                Text(hours <10?"0$hours" : "$hours", style: TextStyles.h4.copyWith()),
              ),
              Text(" : ",
                  style: TextStyles.h2.copyWith(color: MyColors.whiteColor)),
              Container(
                padding: EdgeInsets.all(Insets.sm),
                decoration: BoxDecoration(
                  color: MyColors.whiteColor,
                  borderRadius: Corners.medBorder,
                ),
                child:
                Text(minutes<10?"0$minutes" : "$minutes", style: TextStyles.h4.copyWith()),
              ),
              Text(" : ",
                  style: TextStyles.h2.copyWith(color: MyColors.whiteColor)),
              Container(
                padding: EdgeInsets.all(Insets.sm),
                decoration: BoxDecoration(
                  color: MyColors.whiteColor,
                  borderRadius: Corners.medBorder,
                ),
                child:
                Text(seconds<10?"0$seconds":"$seconds", style: TextStyles.h4.copyWith()),
              ),
            ],
          )
        ],
      ) ,
    );
  }
}
