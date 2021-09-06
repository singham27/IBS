import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/health/HealthController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/AdditionalNoteWidget.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/DropDownList.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Health extends StatelessWidget {
  final _healthWellnessController = Get.put(HealthController());
  final SignUpController _signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: ScreenConstant.defaultHeightTen),
              CustomElevatedButton(
                widthFactor: 0.7,
                text: "Save",
                onTap: _healthWellnessController.onSave,
              ),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Cancel",
                      style: TextStyles.textStyleIntroDescription.apply(
                        color: AppColors.colorskip_also_proceed,
                      )))
            ],
          ),
        ),
        backgroundColor: AppColors.barrierColor.withOpacity(0.6),
        body: Obx(
          () => ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: ScreenConstant.defaultHeightOneThirty),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: ScreenConstant.defaultHeightTwenty),
                      child: Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        )),
                        child: Column(
                          children: [
                            SizedBox(height: ScreenConstant.defaultHeightSixty),
                            Text(
                              "Track Wellness",
                              style: TextStyles.textStyleIntroDescription.apply(
                                  color: Colors.black, fontSizeDelta: -2),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: ScreenConstant.defaultHeightForty),
                            DateTimeCardWidget(),
                            SizedBox(height: ScreenConstant.defaultHeightForty),
                            _healthWellnessController.loader.value
                                ? Center(
                                    child: Padding(
                                    padding: ScreenConstant.spacingAllLarge,
                                    child: Container(
                                        height:
                                            ScreenConstant.screenHeightThird,
                                        child: Center(
                                            child:
                                                CircularProgressIndicator())),
                                  ))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemCount: _signUpController
                                        .healthWellness.value.items.length,
                                    itemBuilder: (_, mainIndex) {
                                      switch (_signUpController.healthWellness
                                          .value.items[mainIndex].tid) {
                                        case "healthWellness-stress_level":
                                          {
                                            return Stack(
                                              children: [
                                                Positioned.fill(
                                                  top: ScreenConstant
                                                      .defaultHeightOneHundred,
                                                  child: Container(
                                                    color: AppColors
                                                        .colorYesButton,
                                                  ),
                                                ),
                                                Card(
                                                  color:
                                                      AppColors.colorBackground,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20))),
                                                  margin: EdgeInsets.only(
                                                    left: ScreenConstant
                                                        .defaultWidthTwenty,
                                                    right: ScreenConstant
                                                        .defaultWidthTwenty,
                                                  ),
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: ScreenConstant
                                                            .defaultWidthTwenty),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                            height: ScreenConstant
                                                                .defaultHeightForty),
                                                        Text(
                                                            _signUpController
                                                                .healthWellness
                                                                .value
                                                                .items[
                                                                    mainIndex]
                                                                .name,
                                                            style: TextStyles
                                                                .textStyleIntroDescription
                                                                .apply(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSizeDelta:
                                                                        -3)),
                                                        SizedBox(
                                                            height: ScreenConstant
                                                                .defaultHeightTwentyFour),
                                                        Text(
                                                          _signUpController
                                                              .healthWellness
                                                              .value
                                                              .items[mainIndex]
                                                              .description,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyles
                                                              .textStyleRegular
                                                              .apply(
                                                                  color: AppColors
                                                                      .colorSkipButton),
                                                        ),
                                                        SizedBox(
                                                            height: ScreenConstant
                                                                .defaultHeightTwenty),
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal:
                                                                  ScreenConstant
                                                                      .defaultWidthTen),
                                                          child: SfSliderTheme(
                                                            data:
                                                                SfSliderThemeData(
                                                              thumbColor: AppColors
                                                                  .colorArrowButton,
                                                              thumbStrokeWidth:
                                                                  5,
                                                              thumbRadius: 16,
                                                              thumbStrokeColor:
                                                                  Colors.white,
                                                              activeTrackHeight:
                                                                  4,
                                                              overlayRadius: 0,
                                                              disabledActiveTrackColor:
                                                                  AppColors
                                                                      .colorTrackSlider,
                                                              disabledInactiveTrackColor:
                                                                  AppColors
                                                                      .colorTrackSlider,
                                                              activeDividerStrokeWidth:
                                                                  2,
                                                              inactiveDividerStrokeWidth:
                                                                  2,
                                                              inactiveTrackHeight:
                                                                  4,
                                                              activeTrackColor:
                                                                  AppColors
                                                                      .colorTrackSlider,
                                                              inactiveTrackColor:
                                                                  AppColors
                                                                      .colorTrackSlider,
                                                              inactiveDividerStrokeColor:
                                                                  AppColors
                                                                      .white,
                                                              inactiveDividerRadius:
                                                                  8,
                                                              inactiveDividerColor:
                                                                  AppColors
                                                                      .colorInactiveDividerSlider,
                                                              activeDividerColor:
                                                                  AppColors
                                                                      .colorInactiveDividerSlider,
                                                              activeDividerStrokeColor:
                                                                  Colors.white,
                                                              activeDividerRadius:
                                                                  8,
                                                              activeLabelStyle: TextStyles
                                                                  .textStyleRegular
                                                                  .apply(
                                                                      color: AppColors
                                                                          .colorTrackSlider),
                                                              inactiveLabelStyle: TextStyles
                                                                  .textStyleRegular
                                                                  .apply(
                                                                      color: AppColors
                                                                          .colorTrackSlider),
                                                            ),
                                                            child: SfSlider(
                                                              showDividers:
                                                                  true,
                                                              min: 1.0,
                                                              max: _signUpController
                                                                  .healthWellness
                                                                  .value
                                                                  .items[
                                                                      mainIndex]
                                                                  .rating
                                                                  .range,
                                                              interval: 1,
                                                              stepSize: 1,
                                                              showLabels: true,
                                                              value: _signUpController
                                                                  .healthWellness
                                                                  .value
                                                                  .items[
                                                                      mainIndex]
                                                                  .rating
                                                                  .ratingDefault,
                                                              onChanged: (dynamic
                                                                  newValue) {},
                                                              labelFormatterCallback:
                                                                  (dynamic
                                                                          actualValue,
                                                                      String
                                                                          formattedText) {
                                                                return actualValue ==
                                                                        1
                                                                    ? "None"
                                                                    : actualValue ==
                                                                            2
                                                                        ? ""
                                                                        : actualValue ==
                                                                                3
                                                                            ? ""
                                                                            : "Extremely";
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height: ScreenConstant
                                                                .defaultHeightTwenty),
                                                        Divider(
                                                            thickness: 1,
                                                            color: AppColors
                                                                .white
                                                                .withOpacity(
                                                                    0.12)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                          break;
                                        case "healthWellness-anxiety_level":
                                          {
                                            return Stack(
                                              children: [
                                                Positioned.fill(
                                                  child: Container(
                                                    color: AppColors
                                                        .colorYesButton,
                                                  ),
                                                ),
                                                Container(
                                                  color:
                                                      AppColors.colorBackground,
                                                  margin: EdgeInsets.only(
                                                    left: ScreenConstant
                                                        .defaultWidthTwenty,
                                                    right: ScreenConstant
                                                        .defaultWidthTwenty,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: ScreenConstant
                                                          .defaultWidthTwenty),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightForty),
                                                      Text(
                                                          _signUpController
                                                              .healthWellness
                                                              .value
                                                              .items[mainIndex]
                                                              .name,
                                                          style: TextStyles
                                                              .textStyleIntroDescription
                                                              .apply(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSizeDelta:
                                                                      -3)),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwentyFour),
                                                      Text(
                                                        _signUpController
                                                            .healthWellness
                                                            .value
                                                            .items[mainIndex]
                                                            .description,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyles
                                                            .textStyleRegular
                                                            .apply(
                                                                color: AppColors
                                                                    .colorSkipButton),
                                                      ),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                                ScreenConstant
                                                                    .defaultWidthTen),
                                                        child: SfSliderTheme(
                                                          data:
                                                              SfSliderThemeData(
                                                            thumbColor: AppColors
                                                                .colorArrowButton,
                                                            thumbStrokeWidth: 5,
                                                            thumbRadius: 16,
                                                            thumbStrokeColor:
                                                                Colors.white,
                                                            activeTrackHeight:
                                                                4,
                                                            overlayRadius: 0,
                                                            disabledActiveTrackColor:
                                                                AppColors
                                                                    .colorTrackSlider,
                                                            disabledInactiveTrackColor:
                                                                AppColors
                                                                    .colorTrackSlider,
                                                            activeDividerStrokeWidth:
                                                                2,
                                                            inactiveDividerStrokeWidth:
                                                                2,
                                                            inactiveTrackHeight:
                                                                4,
                                                            activeTrackColor:
                                                                AppColors
                                                                    .colorTrackSlider,
                                                            inactiveTrackColor:
                                                                AppColors
                                                                    .colorTrackSlider,
                                                            inactiveDividerStrokeColor:
                                                                AppColors.white,
                                                            inactiveDividerRadius:
                                                                8,
                                                            inactiveDividerColor:
                                                                AppColors
                                                                    .colorInactiveDividerSlider,
                                                            activeDividerColor:
                                                                AppColors
                                                                    .colorInactiveDividerSlider,
                                                            activeDividerStrokeColor:
                                                                Colors.white,
                                                            activeDividerRadius:
                                                                8,
                                                            activeLabelStyle: TextStyles
                                                                .textStyleRegular
                                                                .apply(
                                                                    color: AppColors
                                                                        .colorTrackSlider),
                                                            inactiveLabelStyle: TextStyles
                                                                .textStyleRegular
                                                                .apply(
                                                                    color: AppColors
                                                                        .colorTrackSlider),
                                                          ),
                                                          child: SfSlider(
                                                            showDividers: true,
                                                            min: 1.0,
                                                            max: _signUpController
                                                                .healthWellness
                                                                .value
                                                                .items[
                                                                    mainIndex]
                                                                .rating
                                                                .range,
                                                            interval: 1,
                                                            stepSize: 1,
                                                            showLabels: true,
                                                            value: _signUpController
                                                                .healthWellness
                                                                .value
                                                                .items[
                                                                    mainIndex]
                                                                .rating
                                                                .ratingDefault,
                                                            onChanged: (dynamic
                                                                newValue) {},
                                                            labelFormatterCallback:
                                                                (dynamic
                                                                        actualValue,
                                                                    String
                                                                        formattedText) {
                                                              return actualValue ==
                                                                      1
                                                                  ? "None"
                                                                  : actualValue ==
                                                                          2
                                                                      ? ""
                                                                      : actualValue ==
                                                                              3
                                                                          ? ""
                                                                          : "Extremely";
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                      Divider(
                                                          thickness: 1,
                                                          color: AppColors.white
                                                              .withOpacity(
                                                                  0.12)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                          break;
                                        case "healthWellness-depression":
                                          {
                                            return Stack(
                                              children: [
                                                Positioned.fill(
                                                  child: Container(
                                                    color: AppColors
                                                        .colorYesButton,
                                                  ),
                                                ),
                                                Container(
                                                  color:
                                                      AppColors.colorBackground,
                                                  margin: EdgeInsets.only(
                                                    left: ScreenConstant
                                                        .defaultWidthTwenty,
                                                    right: ScreenConstant
                                                        .defaultWidthTwenty,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: ScreenConstant
                                                          .defaultWidthTwenty),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightForty),
                                                      Text(
                                                          _signUpController
                                                              .healthWellness
                                                              .value
                                                              .items[mainIndex]
                                                              .name,
                                                          style: TextStyles
                                                              .textStyleIntroDescription
                                                              .apply(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSizeDelta:
                                                                      -3)),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwentyFour),
                                                      Text(
                                                        _signUpController
                                                            .healthWellness
                                                            .value
                                                            .items[mainIndex]
                                                            .description,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyles
                                                            .textStyleRegular
                                                            .apply(
                                                                color: AppColors
                                                                    .colorSkipButton),
                                                      ),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                                ScreenConstant
                                                                    .defaultWidthTen),
                                                        child: SfSliderTheme(
                                                          data:
                                                              SfSliderThemeData(
                                                            thumbColor: AppColors
                                                                .colorArrowButton,
                                                            thumbStrokeWidth: 5,
                                                            thumbRadius: 16,
                                                            thumbStrokeColor:
                                                                Colors.white,
                                                            activeTrackHeight:
                                                                4,
                                                            overlayRadius: 0,
                                                            disabledActiveTrackColor:
                                                                AppColors
                                                                    .colorTrackSlider,
                                                            disabledInactiveTrackColor:
                                                                AppColors
                                                                    .colorTrackSlider,
                                                            activeDividerStrokeWidth:
                                                                2,
                                                            inactiveDividerStrokeWidth:
                                                                2,
                                                            inactiveTrackHeight:
                                                                4,
                                                            activeTrackColor:
                                                                AppColors
                                                                    .colorTrackSlider,
                                                            inactiveTrackColor:
                                                                AppColors
                                                                    .colorTrackSlider,
                                                            inactiveDividerStrokeColor:
                                                                AppColors.white,
                                                            inactiveDividerRadius:
                                                                8,
                                                            inactiveDividerColor:
                                                                AppColors
                                                                    .colorInactiveDividerSlider,
                                                            activeDividerColor:
                                                                AppColors
                                                                    .colorInactiveDividerSlider,
                                                            activeDividerStrokeColor:
                                                                Colors.white,
                                                            activeDividerRadius:
                                                                8,
                                                            activeLabelStyle: TextStyles
                                                                .textStyleRegular
                                                                .apply(
                                                                    color: AppColors
                                                                        .colorTrackSlider),
                                                            inactiveLabelStyle: TextStyles
                                                                .textStyleRegular
                                                                .apply(
                                                                    color: AppColors
                                                                        .colorTrackSlider),
                                                          ),
                                                          child: SfSlider(
                                                            showDividers: true,
                                                            min: 1.0,
                                                            max: _signUpController
                                                                .healthWellness
                                                                .value
                                                                .items[
                                                                    mainIndex]
                                                                .rating
                                                                .range,
                                                            interval: 1,
                                                            stepSize: 1,
                                                            showLabels: true,
                                                            value: _signUpController
                                                                .healthWellness
                                                                .value
                                                                .items[
                                                                    mainIndex]
                                                                .rating
                                                                .ratingDefault,
                                                            onChanged: (dynamic
                                                                newValue) {},
                                                            labelFormatterCallback:
                                                                (dynamic
                                                                        actualValue,
                                                                    String
                                                                        formattedText) {
                                                              return actualValue ==
                                                                      1
                                                                  ? "None"
                                                                  : actualValue ==
                                                                          2
                                                                      ? ""
                                                                      : actualValue ==
                                                                              3
                                                                          ? ""
                                                                          : "Extremely";
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                      Divider(
                                                          thickness: 1,
                                                          color: AppColors.white
                                                              .withOpacity(
                                                                  0.12)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                          break;
                                        case "healthWellness-fatigue":
                                          {
                                            return Stack(
                                              children: [
                                                Positioned.fill(
                                                  child: Container(
                                                    color: AppColors
                                                        .colorYesButton,
                                                  ),
                                                ),
                                                Container(
                                                  color:
                                                      AppColors.colorBackground,
                                                  margin: EdgeInsets.only(
                                                    left: ScreenConstant
                                                        .defaultWidthTwenty,
                                                    right: ScreenConstant
                                                        .defaultWidthTwenty,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: ScreenConstant
                                                          .defaultWidthTwenty),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightForty),
                                                      Text(
                                                          _signUpController
                                                              .healthWellness
                                                              .value
                                                              .items[mainIndex]
                                                              .name,
                                                          style: TextStyles
                                                              .textStyleIntroDescription
                                                              .apply(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSizeDelta:
                                                                      -3)),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwentyFour),
                                                      Text(
                                                        _signUpController
                                                            .healthWellness
                                                            .value
                                                            .items[mainIndex]
                                                            .description,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyles
                                                            .textStyleRegular
                                                            .apply(
                                                                color: AppColors
                                                                    .colorSkipButton),
                                                      ),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                                ScreenConstant
                                                                    .defaultWidthTen),
                                                        child: SfSliderTheme(
                                                          data:
                                                              SfSliderThemeData(
                                                            thumbColor: AppColors
                                                                .colorArrowButton,
                                                            thumbStrokeWidth: 5,
                                                            thumbRadius: 16,
                                                            thumbStrokeColor:
                                                                Colors.white,
                                                            activeTrackHeight:
                                                                4,
                                                            overlayRadius: 0,
                                                            disabledActiveTrackColor:
                                                                AppColors
                                                                    .colorTrackSlider,
                                                            disabledInactiveTrackColor:
                                                                AppColors
                                                                    .colorTrackSlider,
                                                            activeDividerStrokeWidth:
                                                                2,
                                                            inactiveDividerStrokeWidth:
                                                                2,
                                                            inactiveTrackHeight:
                                                                4,
                                                            activeTrackColor:
                                                                AppColors
                                                                    .colorTrackSlider,
                                                            inactiveTrackColor:
                                                                AppColors
                                                                    .colorTrackSlider,
                                                            inactiveDividerStrokeColor:
                                                                AppColors.white,
                                                            inactiveDividerRadius:
                                                                8,
                                                            inactiveDividerColor:
                                                                AppColors
                                                                    .colorInactiveDividerSlider,
                                                            activeDividerColor:
                                                                AppColors
                                                                    .colorInactiveDividerSlider,
                                                            activeDividerStrokeColor:
                                                                Colors.white,
                                                            activeDividerRadius:
                                                                8,
                                                            activeLabelStyle: TextStyles
                                                                .textStyleRegular
                                                                .apply(
                                                                    color: AppColors
                                                                        .colorTrackSlider),
                                                            inactiveLabelStyle: TextStyles
                                                                .textStyleRegular
                                                                .apply(
                                                                    color: AppColors
                                                                        .colorTrackSlider),
                                                          ),
                                                          child: SfSlider(
                                                            showDividers: true,
                                                            min: 1.0,
                                                            max: _signUpController
                                                                .healthWellness
                                                                .value
                                                                .items[
                                                                    mainIndex]
                                                                .rating
                                                                .range,
                                                            interval: 1,
                                                            stepSize: 1,
                                                            showLabels: true,
                                                            value: _signUpController
                                                                .healthWellness
                                                                .value
                                                                .items[
                                                                    mainIndex]
                                                                .rating
                                                                .ratingDefault,
                                                            onChanged: (dynamic
                                                                newValue) {},
                                                            labelFormatterCallback:
                                                                (dynamic
                                                                        actualValue,
                                                                    String
                                                                        formattedText) {
                                                              return actualValue ==
                                                                      1
                                                                  ? "None"
                                                                  : actualValue ==
                                                                          2
                                                                      ? ""
                                                                      : actualValue ==
                                                                              3
                                                                          ? ""
                                                                          : "Extremely";
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                      Divider(
                                                          thickness: 1,
                                                          color: AppColors.white
                                                              .withOpacity(
                                                                  0.12)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                          break;
                                        case "healthWellness-activity_level":
                                          {
                                            return Stack(
                                              children: [
                                                Positioned.fill(
                                                  child: Container(
                                                    color: AppColors
                                                        .colorYesButton,
                                                  ),
                                                ),
                                                Container(
                                                  color:
                                                      AppColors.colorBackground,
                                                  margin: EdgeInsets.only(
                                                    left: ScreenConstant
                                                        .defaultWidthTwenty,
                                                    right: ScreenConstant
                                                        .defaultWidthTwenty,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: ScreenConstant
                                                          .defaultWidthTwenty),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightForty),
                                                      Text(
                                                          _signUpController
                                                              .healthWellness
                                                              .value
                                                              .items[mainIndex]
                                                              .name,
                                                          style: TextStyles
                                                              .textStyleIntroDescription
                                                              .apply(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSizeDelta:
                                                                      -3)),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwentyFour),
                                                      Text(
                                                        _signUpController
                                                            .healthWellness
                                                            .value
                                                            .items[mainIndex]
                                                            .description,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyles
                                                            .textStyleRegular
                                                            .apply(
                                                                color: AppColors
                                                                    .colorSkipButton),
                                                      ),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                                ScreenConstant
                                                                    .defaultWidthTen),
                                                        child: SfSliderTheme(
                                                          data:
                                                              SfSliderThemeData(
                                                            thumbColor: AppColors
                                                                .colorArrowButton,
                                                            thumbStrokeWidth: 5,
                                                            thumbRadius: 16,
                                                            thumbStrokeColor:
                                                                Colors.white,
                                                            activeTrackHeight:
                                                                4,
                                                            overlayRadius: 0,
                                                            disabledActiveTrackColor:
                                                                AppColors
                                                                    .colorTrackSlider,
                                                            disabledInactiveTrackColor:
                                                                AppColors
                                                                    .colorTrackSlider,
                                                            activeDividerStrokeWidth:
                                                                2,
                                                            inactiveDividerStrokeWidth:
                                                                2,
                                                            inactiveTrackHeight:
                                                                4,
                                                            activeTrackColor:
                                                                AppColors
                                                                    .colorTrackSlider,
                                                            inactiveTrackColor:
                                                                AppColors
                                                                    .colorTrackSlider,
                                                            inactiveDividerStrokeColor:
                                                                AppColors.white,
                                                            inactiveDividerRadius:
                                                                8,
                                                            inactiveDividerColor:
                                                                AppColors
                                                                    .colorInactiveDividerSlider,
                                                            activeDividerColor:
                                                                AppColors
                                                                    .colorInactiveDividerSlider,
                                                            activeDividerStrokeColor:
                                                                Colors.white,
                                                            activeDividerRadius:
                                                                8,
                                                            activeLabelStyle: TextStyles
                                                                .textStyleRegular
                                                                .apply(
                                                                    color: AppColors
                                                                        .colorTrackSlider),
                                                            inactiveLabelStyle: TextStyles
                                                                .textStyleRegular
                                                                .apply(
                                                                    color: AppColors
                                                                        .colorTrackSlider),
                                                          ),
                                                          child: SfSlider(
                                                            showDividers: true,
                                                            min: 1.0,
                                                            max: _signUpController
                                                                .healthWellness
                                                                .value
                                                                .items[
                                                                    mainIndex]
                                                                .rating
                                                                .range,
                                                            interval: 1,
                                                            stepSize: 1,
                                                            showLabels: true,
                                                            value: _signUpController
                                                                .healthWellness
                                                                .value
                                                                .items[
                                                                    mainIndex]
                                                                .rating
                                                                .ratingDefault,
                                                            onChanged: (dynamic
                                                                newValue) {},
                                                            labelFormatterCallback:
                                                                (dynamic
                                                                        actualValue,
                                                                    String
                                                                        formattedText) {
                                                              return actualValue ==
                                                                      1
                                                                  ? "None"
                                                                  : actualValue ==
                                                                          2
                                                                      ? ""
                                                                      : actualValue ==
                                                                              3
                                                                          ? ""
                                                                          : "Extremely";
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                      Divider(
                                                          thickness: 1,
                                                          color: AppColors.white
                                                              .withOpacity(
                                                                  0.12)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                          break;
                                        case "healthWellness-exercise":
                                          {
                                            return Stack(
                                              children: [
                                                Positioned.fill(
                                                  child: Container(
                                                    color: AppColors
                                                        .colorYesButton,
                                                  ),
                                                ),
                                                Container(
                                                  color:
                                                      AppColors.colorBackground,
                                                  margin: EdgeInsets.only(
                                                    left: ScreenConstant
                                                        .defaultWidthTwenty,
                                                    right: ScreenConstant
                                                        .defaultWidthTwenty,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: ScreenConstant
                                                          .defaultWidthTwenty),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightForty),
                                                      Text(
                                                          _signUpController
                                                              .healthWellness
                                                              .value
                                                              .items[mainIndex]
                                                              .name,
                                                          style: TextStyles
                                                              .textStyleIntroDescription
                                                              .apply(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSizeDelta:
                                                                      -3)),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwentyFour),
                                                      Text(
                                                        _signUpController
                                                            .healthWellness
                                                            .value
                                                            .items[mainIndex]
                                                            .description,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyles
                                                            .textStyleRegular
                                                            .apply(
                                                                color: AppColors
                                                                    .colorSkipButton),
                                                      ),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                                ScreenConstant
                                                                    .defaultWidthTen),
                                                        child: GridView.builder(
                                                          //   padding: EdgeInsets.symmetric(
                                                          //       horizontal: ScreenConstant.defaultWidthTwenty),
                                                          shrinkWrap: true,
                                                          physics:
                                                              NeverScrollableScrollPhysics(),
                                                          itemCount:
                                                              _signUpController
                                                                  .healthWellness
                                                                  .value
                                                                  .items[
                                                                      mainIndex]
                                                                  .list
                                                                  .options
                                                                  .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int optIdx) {
                                                            var model = _signUpController
                                                                .healthWellness
                                                                .value
                                                                .items[
                                                                    mainIndex]
                                                                .list
                                                                .options[optIdx];
                                                            return InkWell(
                                                              onTap: () {
                                                                _healthWellnessController
                                                                    .onOptionTapped(
                                                                  model:
                                                                      model, /* modelValue: _symptomsController.symptomsModel.value.items[index].children.first.value.arr*/
                                                                );
                                                              },
                                                              child: Card(
                                                                  elevation: 0,
                                                                  color: model
                                                                          .optionDefault
                                                                      ? AppColors
                                                                          .colorCloseLight
                                                                      : AppColors
                                                                          .colorSymptomsGridBg,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        ScreenConstant
                                                                            .spacingAllDefault,
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Image
                                                                            .network(
                                                                          model
                                                                              .image
                                                                              .active,
                                                                          width:
                                                                              ScreenConstant.defaultWidthTwenty * 2.0,
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                ScreenConstant.defaultHeightTen),
                                                                        Text(
                                                                            "${model.label}",
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: TextStyles.textStyleRegular.apply(color: AppColors.white, fontSizeDelta: -2)),
                                                                      ],
                                                                    ),
                                                                  )),
                                                            );
                                                          },
                                                          gridDelegate:
                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      3,
                                                                  childAspectRatio:
                                                                      1),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                      Divider(
                                                          thickness: 1,
                                                          color: AppColors.white
                                                              .withOpacity(
                                                                  0.12)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                          break;
                                        case "healthWellness-relaxation_techniques":
                                          {
                                            return Stack(
                                              children: [
                                                Positioned.fill(
                                                  top: 0,
                                                  bottom: 0,
                                                  child: Container(
                                                    color: AppColors
                                                        .colorYesButton,
                                                  ),
                                                ),
                                                Container(
                                                  color:
                                                      AppColors.colorBackground,
                                                  margin: EdgeInsets.only(
                                                    left: ScreenConstant
                                                        .defaultWidthTwenty,
                                                    right: ScreenConstant
                                                        .defaultWidthTwenty,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: ScreenConstant
                                                          .defaultWidthTwenty),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightForty),
                                                      Text(
                                                          _signUpController
                                                              .healthWellness
                                                              .value
                                                              .items[mainIndex]
                                                              .name,
                                                          style: TextStyles
                                                              .textStyleIntroDescription
                                                              .apply(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSizeDelta:
                                                                      -3)),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwentyFour),
                                                      Text(
                                                        _signUpController
                                                            .healthWellness
                                                            .value
                                                            .items[mainIndex]
                                                            .description,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyles
                                                            .textStyleRegular
                                                            .apply(
                                                                color: AppColors
                                                                    .colorSkipButton),
                                                      ),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                                ScreenConstant
                                                                    .defaultWidthTen),
                                                        child: Wrap(
                                                          children:
                                                              _signUpController
                                                                  .healthWellness
                                                                  .value
                                                                  .items[
                                                                      mainIndex]
                                                                  .tags
                                                                  .boolListDefault
                                                                  .map((item) =>
                                                                      InkWell(
                                                                        onTap:
                                                                            () {},
                                                                        child:
                                                                            Card(
                                                                          color:
                                                                              AppColors.colorSymptomsGridBg,
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                ScreenConstant.spacingAllExtraSmall,
                                                                            child:
                                                                                Text(
                                                                              item.value,
                                                                              textAlign: TextAlign.center,
                                                                              //overflow: TextOverflow.ellipsis,
                                                                              style: TextStyles.textStyleRegular.apply(color: Colors.white, fontSizeDelta: -2),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ))
                                                                  .toList()
                                                                  .cast<
                                                                      Widget>(),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                      Divider(
                                                          thickness: 1,
                                                          color: AppColors.white
                                                              .withOpacity(
                                                                  0.12)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                          break;
                                        case "healthWellness-sleepImprovement":
                                          {
                                            return Stack(
                                              children: [
                                                Positioned.fill(
                                                  top: 0,
                                                  bottom: 0,
                                                  child: Container(
                                                    color: AppColors
                                                        .colorYesButton,
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    left: ScreenConstant
                                                        .defaultWidthTwenty,
                                                    right: ScreenConstant
                                                        .defaultWidthTwenty,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: ScreenConstant
                                                          .defaultWidthTwenty),
                                                  decoration: BoxDecoration(
                                                      color: AppColors
                                                          .colorBackground,
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(20),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightForty),
                                                      Text(
                                                          _signUpController
                                                              .healthWellness
                                                              .value
                                                              .items[mainIndex]
                                                              .name,
                                                          style: TextStyles
                                                              .textStyleIntroDescription
                                                              .apply(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSizeDelta:
                                                                      -3)),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwentyFour),
                                                      Text(
                                                        _signUpController
                                                            .healthWellness
                                                            .value
                                                            .items[mainIndex]
                                                            .description,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyles
                                                            .textStyleRegular
                                                            .apply(
                                                                color: AppColors
                                                                    .colorSkipButton),
                                                      ),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                                ScreenConstant
                                                                    .defaultWidthTen),
                                                        child: ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                ClampingScrollPhysics(),
                                                            itemCount:
                                                                _signUpController
                                                                    .healthWellness
                                                                    .value
                                                                    .items[
                                                                        mainIndex]
                                                                    .children
                                                                    .first
                                                                    .items
                                                                    .length,
                                                            itemBuilder:
                                                                (_, count) {
                                                              switch (_signUpController
                                                                  .healthWellness
                                                                  .value
                                                                  .items[
                                                                      mainIndex]
                                                                  .children
                                                                  .first
                                                                  .items[count]
                                                                  .tid) {
                                                                case "healthWellness-sleepImprovement-quality":
                                                                  {
                                                                    return Column(
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              flex: 2,
                                                                              child: Text(_signUpController.healthWellness.value.items[mainIndex].children.first.items[count].name, style: TextStyles.textStyleIntroDescription.apply(color: Colors.white, fontSizeDelta: -6)),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Container(
                                                                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                                                                decoration: BoxDecoration(color: AppColors.colordropdownArrowBg, borderRadius: BorderRadius.all(Radius.circular(8))),
                                                                                child: CustomDropdown<SelectOption>(
                                                                                  value: _signUpController.healthWellness.value.items[mainIndex].children.first.items[count].select.selectDefault.label != null ? _signUpController.healthWellness.value.items[mainIndex].children.first.items[count].select.selectDefault : _signUpController.healthWellness.value.items[mainIndex].children.first.items[count].select.options.first,
                                                                                  dropdownMenuItemList: buildDropList(_signUpController.healthWellness.value.items[mainIndex].children.first.items[count].select.options),
                                                                                  onChanged: (SelectOption optionItem) {
                                                                                    _signUpController.healthWellness.value.items[mainIndex].children.first.items[count].select.selectDefault = optionItem;
                                                                                    _signUpController.healthWellness.refresh();
                                                                                  },
                                                                                  isEnabled: true,
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                          height:
                                                                              ScreenConstant.sizeXL,
                                                                        ),
                                                                        Divider(
                                                                            thickness:
                                                                                1,
                                                                            color:
                                                                                AppColors.white.withOpacity(0.12)),
                                                                        SizedBox(
                                                                            height:
                                                                                ScreenConstant.defaultHeightTwenty),
                                                                      ],
                                                                    );
                                                                  }
                                                                  break;
                                                                case "healthWellness-sleepImprovement-tiredness_waking":
                                                                  {
                                                                    return Column(
                                                                      children: [
                                                                        SizedBox(
                                                                            height: ScreenConstant
                                                                                .defaultHeightForty),
                                                                        Text(
                                                                            _signUpController
                                                                                .healthWellness
                                                                                .value
                                                                                .items[
                                                                            mainIndex]
                                                                                .children
                                                                                .first
                                                                                .items[count].name,
                                                                            style: TextStyles
                                                                                .textStyleIntroDescription
                                                                                .apply(
                                                                                color: Colors
                                                                                    .white,
                                                                                fontSizeDelta:
                                                                                -3)),
                                                                        SizedBox(
                                                                            height: ScreenConstant
                                                                                .defaultHeightTwentyFour),
                                                                        Text(
                                                                          _signUpController
                                                                              .healthWellness
                                                                              .value
                                                                              .items[
                                                                          mainIndex]
                                                                              .children
                                                                              .first
                                                                              .items[count]
                                                                              .description,
                                                                          textAlign:
                                                                          TextAlign.center,
                                                                          style: TextStyles
                                                                              .textStyleRegular
                                                                              .apply(
                                                                              color: AppColors
                                                                                  .colorSkipButton),
                                                                        ),
                                                                        SizedBox(
                                                                            height: ScreenConstant
                                                                                .defaultHeightTwenty),
                                                                        Padding(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal:
                                                                              ScreenConstant
                                                                                  .defaultWidthTen),
                                                                          child: SfSliderTheme(
                                                                            data:
                                                                            SfSliderThemeData(
                                                                              thumbColor: AppColors
                                                                                  .colorArrowButton,
                                                                              thumbStrokeWidth: 5,
                                                                              thumbRadius: 16,
                                                                              thumbStrokeColor:
                                                                              Colors.white,
                                                                              activeTrackHeight:
                                                                              4,
                                                                              overlayRadius: 0,
                                                                              disabledActiveTrackColor:
                                                                              AppColors
                                                                                  .colorTrackSlider,
                                                                              disabledInactiveTrackColor:
                                                                              AppColors
                                                                                  .colorTrackSlider,
                                                                              activeDividerStrokeWidth:
                                                                              2,
                                                                              inactiveDividerStrokeWidth:
                                                                              2,
                                                                              inactiveTrackHeight:
                                                                              4,
                                                                              activeTrackColor:
                                                                              AppColors
                                                                                  .colorTrackSlider,
                                                                              inactiveTrackColor:
                                                                              AppColors
                                                                                  .colorTrackSlider,
                                                                              inactiveDividerStrokeColor:
                                                                              AppColors.white,
                                                                              inactiveDividerRadius:
                                                                              8,
                                                                              inactiveDividerColor:
                                                                              AppColors
                                                                                  .colorInactiveDividerSlider,
                                                                              activeDividerColor:
                                                                              AppColors
                                                                                  .colorInactiveDividerSlider,
                                                                              activeDividerStrokeColor:
                                                                              Colors.white,
                                                                              activeDividerRadius:
                                                                              8,
                                                                              activeLabelStyle: TextStyles
                                                                                  .textStyleRegular
                                                                                  .apply(
                                                                                  color: AppColors
                                                                                      .colorTrackSlider),
                                                                              inactiveLabelStyle: TextStyles
                                                                                  .textStyleRegular
                                                                                  .apply(
                                                                                  color: AppColors
                                                                                      .colorTrackSlider),
                                                                            ),
                                                                            child: SfSlider(
                                                                              showDividers: true,
                                                                              min: 1.0,
                                                                              max: _signUpController
                                                                                  .healthWellness
                                                                                  .value
                                                                                  .items[
                                                                              mainIndex]
                                                                                  .children
                                                                                  .first
                                                                                  .items[count]
                                                                                  .rating.range,
                                                                              interval: 1,
                                                                              stepSize: 1,
                                                                              showLabels: true,
                                                                              value: _signUpController
                                                                                  .healthWellness
                                                                                  .value
                                                                                  .items[
                                                                              mainIndex]
                                                                                  .children
                                                                                  .first
                                                                                  .items[count]
                                                                                  .rating
                                                                                  .ratingDefault,
                                                                              onChanged: (dynamic
                                                                              newValue) {},
                                                                              labelFormatterCallback:
                                                                                  (dynamic
                                                                              actualValue,
                                                                                  String
                                                                                  formattedText) {
                                                                                return actualValue ==
                                                                                    1
                                                                                    ? "None"
                                                                                    : actualValue ==
                                                                                    2
                                                                                    ? ""
                                                                                    : actualValue ==
                                                                                    3
                                                                                    ? ""
                                                                                    : "Extremely";
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height: ScreenConstant
                                                                                .defaultHeightTwenty),
                                                                      ],
                                                                    );
                                                                  }
                                                                  break;

                                                                default:
                                                                  {
                                                                    return Column(
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              flex:
                                                                              2,
                                                                              child: Text(
                                                                                  _signUpController.healthWellness.value.items[mainIndex].children.first.items[count].name,
                                                                                  style: TextStyles.textStyleIntroDescription.apply(color: Colors.white, fontSizeDelta: -6)),
                                                                            ),
                                                                            Expanded(
                                                                              flex:
                                                                              1,
                                                                              child:
                                                                              Container(
                                                                                padding:
                                                                                EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                                                                decoration:
                                                                                BoxDecoration(color: AppColors.colordropdownArrowBg, borderRadius: BorderRadius.all(Radius.circular(8))),
                                                                                child:
                                                                                CustomDropdown(
                                                                                  value: _healthWellnessController.selectedTime.value,
                                                                                  dropdownMenuItemList: buildTimeDropList(_healthWellnessController.timeList),
                                                                                  onChanged: (optionItem) {
                                                                                    _healthWellnessController.selectedTime.value = optionItem;
                                                                                  },
                                                                                  isEnabled: true,
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                          height: ScreenConstant.sizeMedium,
                                                                        ),
                                                                      ],
                                                                    );
                                                                  }
                                                                  break;
                                                              }
                                                            }),
                                                      ),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                      Divider(
                                                          thickness: 1,
                                                          color: AppColors.white
                                                              .withOpacity(
                                                                  0.12)),
                                                      SizedBox(
                                                          height: ScreenConstant
                                                              .defaultHeightTwenty),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                          break;
                                        case "healthWellness-notes":
                                          {
                                            return Stack(
                                              children: [
                                                Positioned.fill(
                                                  top: 0,
                                                  bottom: ScreenConstant
                                                      .screenHeightHalf,
                                                  child: _buildWavePainter(),
                                                ),
                                                SizedBox(
                                                    height:
                                                        ScreenConstant.sizeXL),
                                                Column(
                                                  children: [
                                                    Container(
                                                      height: ScreenConstant
                                                          .screenHeightThird,
                                                    ),
                                                    AdditionalNoteWidget(
                                                      textEditingController:
                                                          _healthWellnessController
                                                              .noteTextController,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          }
                                          break;

                                        default:
                                          {
                                            return Offstage();
                                          }
                                          break;
                                      }
                                    }),
                            SizedBox(
                                height: ScreenConstant.defaultHeightTwenty),
                          ],
                        ),
                      ),
                    ),
                    Positioned(right: 0, left: 0, child: CustomArcPainter())
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  _buildWavePainter() {
    return Container(
      margin: EdgeInsets.only(bottom: ScreenConstant.defaultHeightTwenty * 1.5),
      width: Get.context.mediaQuerySize.width,
      child: CustomPaint(
        size: Size(Get.context.mediaQuerySize.width,
            Get.context.mediaQuerySize.height),
        painter: WavePainter(),
      ),
    );
  }

  List<DropdownMenuItem<SelectOption>> buildDropList(
      List favouriteFoodModelList) {
    List<DropdownMenuItem<SelectOption>> items = [];
    for (SelectOption favouriteFoodModel in favouriteFoodModelList) {
      items.add(DropdownMenuItem(
        value: favouriteFoodModel,
        child: Text(favouriteFoodModel.label),
      ));
    }
    return items;
  }

  List<DropdownMenuItem<String>> buildTimeDropList(
      List favouriteFoodModelList) {
    List<DropdownMenuItem<String>> items = [];
    for (String favouriteFoodModel in favouriteFoodModelList) {
      items.add(DropdownMenuItem(
        value: favouriteFoodModel,
        child: Text(favouriteFoodModel),
      ));
    }
    return items;
  }
}
