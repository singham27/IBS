import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/dateTime/DateTimeCardController.dart';
import 'package:flutter_ibs/controllers/home/HomeController.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get.dart';

class DateTimeCardWidget extends StatelessWidget {
  //final HomeController _homeController = Get.find();
  final DateTimeCardController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(38)),
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  Assets.clock,
                  width: ScreenConstant.defaultWidthTen * 1.3,
                ),
                TextButton(
                    onPressed: () {
                      if (Platform.isIOS)
                        _controller.getCupertinoTimePicker(context);
                      else
                        _controller.getAndroidTimePicker(context);
                    },
                    child: Text(_controller.selectedTimeLabel.value,
                        style: TextStyles.textStyleRegular)),
                CircleAvatar(
                  backgroundColor: AppColors.colorTextRegular,
                  radius: 1,
                ),
                TextButton(
                  onPressed: () {
                    if (Platform.isIOS)
                      _controller.getCupertinoDatePicker();
                    else
                      _controller.getAndroidDatePicker();
                  },
                  child: Text(_controller.selectedDateLabel.value,
                      style: TextStyles.textStyleRegular),
                ),
              ],
            ),
          ),
        ));
  }
}
