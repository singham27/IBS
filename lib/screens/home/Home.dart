import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/bowel_movement/BowelMovementController.dart';
import 'package:flutter_ibs/controllers/food/FoodController.dart';
import 'package:flutter_ibs/controllers/health/HealthController.dart';
import 'package:flutter_ibs/controllers/home/HomeController.dart';
import 'package:flutter_ibs/controllers/journal/JournalController.dart';
import 'package:flutter_ibs/controllers/medication/MedicationController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/controllers/symptoms/SymptomsController.dart';
import 'package:flutter_ibs/controllers/user/UserController.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/screens/bowel_movement/BowelMovement.dart';
import 'package:flutter_ibs/screens/food/Foods.dart';
import 'package:flutter_ibs/screens/health/Health.dart';
import 'package:flutter_ibs/screens/journal/Journal.dart';
import 'package:flutter_ibs/screens/medication/Medication.dart';
import 'package:flutter_ibs/screens/symptoms/Symptoms.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomBottomNavigation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final _controller = Get.put(HomeController());
  final SignUpController _signUpController = Get.find();
  final UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          backgroundColor: AppColors.colorHomeBg,
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(ScreenConstant.defaultHeightTwoHundred),
            child: AppBar(
              flexibleSpace: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    (_controller.formattedTime.value >= 5 &&
                            _controller.formattedTime.value < 12)
                        ? Assets.morning
                        : (_controller.formattedTime.value >= 12 &&
                                _controller.formattedTime.value < 18)
                            ? Assets.afternoon
                            : (_controller.formattedTime.value >= 18 &&
                                    _controller.formattedTime.value < 22)
                                ? Assets.evening
                                : Assets.night,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                      bottom: ScreenConstant.defaultHeightTwenty,
                      left: ScreenConstant.defaultWidthTwenty,
                      child: Container(
                        padding: ScreenConstant.spacingAllDefault,
                        decoration: BoxDecoration(
                          color: AppColors.colorHomeCard,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16)),
                        ),
                        child: Text(
                          (_controller.formattedTime.value >= 5 &&
                                  _controller.formattedTime.value < 12)
                              ? "Good Morning"
                              : (_controller.formattedTime.value >= 12 &&
                                      _controller.formattedTime.value < 18)
                                  ? "Good Afternoon"
                                  : (_controller.formattedTime.value >= 18 &&
                                          _controller.formattedTime.value < 22)
                                      ? "Good Evening"
                                      : "Good Night",
                          style: TextStyles.textStyleIntroDescription
                              .apply(fontSizeDelta: -4, color: Colors.white),
                        ),
                      ))
                ],
              ),
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: AppColors.colorButton,
                        ),
                        onPressed: () {
                          _controller.goBackOneDay();
                        }),
                  ),
                  TextButton(
                      //_controller.dateController.text,
                      //style: ,
                      onPressed: () {
                        if (Platform.isIOS)
                          _controller.getCupertinoDatePicker();
                        else
                          _controller.getAndroidDatePicker();
                      },
                      child: Text(_controller.selectedDateLabel.value,
                          style: TextStyles.appBarTitle)),
                  IconButton(
                      icon: Icon(Icons.arrow_forward_ios_outlined,
                          color: AppColors.colorButton),
                      onPressed: () {
                        _controller.goForwardOneDay();
                      }),
                ],
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              actions: [
                InkWell(
                  onTap: () => Get.toNamed(settings),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenConstant.defaultWidthTwenty),
                    child: Image.asset(
                      Assets.settings,
                      width: ScreenConstant.defaultWidthTwenty,
                    ),
                  ),
                )
              ],
              automaticallyImplyLeading: false,
            ),
          ),
          body: Obx(
            () => Stack(
              children: [
                _signUpController.loader.value
                    ? Center(child: CircularProgressIndicator())
                    : Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        margin: EdgeInsets.zero,
                        clipBehavior: Clip.antiAlias,
                        color: AppColors.colorTracBg,
                        child: ListView(
                          physics: ClampingScrollPhysics(),
                          padding: ScreenConstant.spacingAllLarge,
                          children: [
                            SizedBox(
                                height: ScreenConstant.defaultHeightSixteen),
                            _buildTrackAndLogBar(),
                            SizedBox(
                                height: ScreenConstant.defaultHeightTwentyFour),
                            Obx(() =>
                                _controller.segmentedControlGroupValue.value ==
                                        1
                                    ? _buildDailyLogList()
                                    : _buildTrackList()),
                            SizedBox(
                                height: ScreenConstant.defaultHeightOneHundred),
                          ],
                        ),
                      ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CustomBottomNavigation()),
              ],
            ),
          )),
    );
  }

  _buildTrackAndLogBar() {
    return Obx(
      () => CupertinoSlidingSegmentedControl(
          padding: ScreenConstant.spacingAllDefault,
          groupValue: _controller.segmentedControlGroupValue.value,
          thumbColor: AppColors.colorButton,
          backgroundColor: AppColors.colorHomeTabBg,
          children: <int, Widget>{
            0: Text(
              "Track",
              style: TextStyles.textStyleRegular.apply(
                  color: _controller.segmentedControlGroupValue.value == 1
                      ? Colors.black
                      : Colors.white,
                  fontSizeDelta: 2),
            ),
            1: Text(
              "Daily Log",
              style: TextStyles.textStyleRegular.apply(
                  color: _controller.segmentedControlGroupValue.value == 0
                      ? Colors.black
                      : Colors.white,
                  fontSizeDelta: 2),
            )
          },
          onValueChanged: (dynamic i) {
            setState(() {
              _controller.segmentedControlGroupValue.value = i as int;
              if (_controller.segmentedControlGroupValue.value == 1) {
                _controller.getTrackHistoryList();
              }
            });
          }),
    );
  }

  _buildTrackList() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: DummyData.trackFlow.length,
      itemBuilder: (BuildContext context, int index) {
        var model = DummyData.trackFlow[index];
        bool isTracked = _userController.doesUserTrackCategory(model.category);

        if (!isTracked) {
          return Offstage();
        }

        return GestureDetector(
          onTap: () => _returnBottomsheet(index),
          child: Container(
            height: ScreenConstant.defaultHeightSeventy,
            padding: ScreenConstant.spacingAllDefault,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  // padding: ScreenConstant.spacingAllMedium,
                  // height: ScreenConstant.defaultHeightSeventy,
                  // decoration: BoxDecoration(
                  backgroundColor: AppColors.colorArrowButton.withOpacity(0.1),
                  // borderRadius: BorderRadius.circular(50)),
                  child: Image.asset(model.image,
                      width: ScreenConstant.defaultWidthTwenty
                      // color: AppColors.colorArrowButton,
                      ),
                ),
                SizedBox(width: ScreenConstant.defaultWidthTen),
                Text(model.text,
                    style: TextStyles.textStyleRegular
                        .apply(fontSizeDelta: 2, color: Colors.black)),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.colorArrowButton,
                  size: FontSize.s12,
                ),
                SizedBox(width: ScreenConstant.defaultWidthTen),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: ScreenConstant.defaultHeightTen),
    );
  }

  _buildDailyLogList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          height: ScreenConstant.defaultHeightSeventy,
          padding: ScreenConstant.spacingAllLarge,
          child: Text("Treatment Plan :",
              textAlign: TextAlign.start,
              style: TextStyles.textStyleRegular
                  .apply(fontSizeDelta: 2, color: Colors.black)),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _controller.trackHistoryList?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            var model = _controller.trackHistoryList[index];
            return InkWell(
              onTap: () {
                // _controller.selcetedDailyLogindividualId.value = model.id;
                // _controller.selcetedDailyLogIndex.value = index;

                // _controller.selcetedDailyLogIndex.value = index;
                // _controller.selcetedDailyLogCategory.value = model.category;
                _controller.navigateToTrackHistory(model);
                // Get.bottomSheet(DailyLog(),
                //     isScrollControlled: true,
                //     barrierColor: AppColors.barrierColor.withOpacity(0.60));
              },
              child: Container(
                  height: ScreenConstant.defaultHeightSeventy,
                  decoration: BoxDecoration(
                    color:
                        index.isEven ? AppColors.colorCardSeen : Colors.white,
                    // borderRadius: BorderRadius.all(
                    //   Radius.circular(12),
                    // ),
                  ),
                  child: ListTile(
                      dense: true,
                      leading: Container(
                        // padding: ScreenConstant.spacingAll,
                        height: ScreenConstant.defaultHeightSeventy,
                        child: Image.network(
                          model.image.normal,
                          width: ScreenConstant.defaultWidthTwenty,
                        ),
                      ),
                      title: Text(model.category,
                          style: TextStyles.textStyleRegular
                              .apply(fontSizeDelta: 2, color: Colors.black)),
                      subtitle: Text(
                          DateFormat('EEEE, MMM d, y - hh:mm a').format(model.trackedAt.toLocal()),
                          style: TextStyles.textStyleRegular.apply(
                              fontSizeDelta: -2,
                              color: Colors.black.withOpacity(0.54))),
                      trailing: Image.asset(Assets.edit,
                          width: ScreenConstant.defaultWidthTen * 1.2))),
            );
          },
        ),
      ],
    );
  }

  _returnBottomsheet(int index) {
    switch (index) {
      case 0:
        {
          SymptomsController controller = Get.find();
          controller.setup();

          return Get.bottomSheet(Symptoms(),
              barrierColor: AppColors.barrierColor.withOpacity(0.60),
              isScrollControlled: true);
        }
      case 1:
        BowelMovementController controller = Get.find();
        controller.setup();

        return Get.bottomSheet(BowelMovement(),
            barrierColor: AppColors.barrierColor.withOpacity(0.60),
            isScrollControlled: true);

        break;
      case 2:
        MedicationController controller = Get.find();
        controller.setup();

        return Get.bottomSheet(Medication(),
            barrierColor: AppColors.barrierColor.withOpacity(0.60),
            isScrollControlled: true);

        break;
      case 3:
        HealthController controller = Get.find();
        controller.setup();

        return Get.bottomSheet(Health(),
            barrierColor: AppColors.barrierColor.withOpacity(0.60),
            isScrollControlled: true);

        break;
      case 4:
        FoodController controller = Get.find();
        controller.setup();

        return Get.bottomSheet(Foods(),
            barrierColor: AppColors.barrierColor.withOpacity(0.60),
            isScrollControlled: true);

        break;
      case 5:
        JournalController controller = Get.find();
        controller.setup();

        return Get.bottomSheet(Journal(),
            barrierColor: AppColors.barrierColor.withOpacity(0.60),
            isScrollControlled: true);

        break;
      default:
        return;
    }
  }
}
