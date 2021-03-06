import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ibs/Store/HiveStore.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:get/route_manager.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    super.initState();
    HiveStore().initBox();
    Future.delayed(Duration(seconds: 2), () {
      HiveStore().put(Keys.USERID, null);
      if ((HiveStore().get(Keys.USERID) != null)) {
        Get.offNamed(home);
      } else
        Get.offNamed(intro);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenConstant.setScreenAwareConstant(context);
    return Container(
        color: AppColors.colorBackground,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenConstant.defaultWidthSixty,
              vertical: ScreenConstant.defaultHeightSixty),
          child: Center(
            child: Image.asset("assets/images/intro/intro0.png"),
          ),
        ));
  }
}
