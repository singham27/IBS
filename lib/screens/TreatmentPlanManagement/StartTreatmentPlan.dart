import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/treatment_plan/TreatmentPlanController.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/TreatmentPlanResponseModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/DynamicWidget.dart';
import 'package:flutter_ibs/widget/PlanDetailsManagmentWidget.dart';
import 'package:flutter_ibs/widget/ReminderPlanWidget.dart';
import 'package:flutter_ibs/widget/ReminderWidget.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:flutter_ibs/widget/utils.dart';
import 'package:get/get.dart';

class StartTreatmentPlan extends StatelessWidget {
  final TreatmentPlanController _treatmentPlanController = Get.find();
  final TreatmentPlanItemData data;

  StartTreatmentPlan({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: ScreenConstant.defaultHeightTen),
            CustomElevatedButton(
              widthFactor: 0.7,
              text: "Save Changes",
              onTap: () {},
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
      body: InkWell(
        onTap: () {
          dismissKeyboard(context);
        },
        child: ListView(
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
                            data.planDescription.tr,
                            style: TextStyles.textStyleIntroDescription
                                .apply(color: Colors.black, fontSizeDelta: -2),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          DateTimeCardWidget(),
                          SizedBox(height: ScreenConstant.sizeDefault),
                          CustomElevatedButton2(
                            elevation: 16,
                            widthFactor: 0.7,
                            onTap: () {},
                            textColor: AppColors.colorTextStop,
                            text: data.startButton.tr,
                            buttonColor: AppColors.white,
                          ),
                          SizedBox(
                              height: ScreenConstant.defaultHeightTwentyFour),
                          Stack(
                            children: [
                              Positioned.fill(
                                top: ScreenConstant.defaultHeightOneHundred,
                                child: _buildWavePainter(),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal:
                                        ScreenConstant.defaultWidthTwenty,
                                  ),
                                  child: Column(
                                    children: [
                                      Card(
                                        margin: EdgeInsets.zero,
                                        color: AppColors.colorBackground,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: ScreenConstant
                                                .defaultWidthTwenty,
                                          ),
                                          child: Column(
                                            children: [
                                              // SizedBox(
                                              //     height: ScreenConstant
                                              //         .defaultHeightTwenty),
                                              // Text(data.trackables.,
                                              //     textAlign: TextAlign.center,
                                              //     style: TextStyles
                                              //         .textStyleIntroDescription
                                              //         .apply(
                                              //             color: Colors.white,
                                              //             fontSizeDelta: -3)),
                                              // SizedBox(
                                              //     height: ScreenConstant
                                              //         .defaultHeightTen),
                                              // Text(
                                              //   widget.description,
                                              //   textAlign: TextAlign.center,
                                              //   style: TextStyles
                                              //       .textStyleRegular
                                              //       .apply(
                                              //           color: AppColors
                                              //               .colorSkipButton),
                                              // ),
                                              // SizedBox(
                                              //     height: ScreenConstant
                                              //         .defaultHeightTwentyFour),
                                              DynamicWidget(
                                                data: data.trackables,
                                              ),
                                              ReminderWidget(
                                                title: data.reminders.name.tr,
                                                description: data
                                                    .reminders.description.tr,
                                                data: data.reminders.children,
                                              ),
                                              SizedBox(
                                                  height: ScreenConstant
                                                          .defaultHeightForty *
                                                      1.4),
                                            ],
                                          ),
                                        ),
                                      ),
                                      PlanDetailsManagementWidget(
                                        title: data.planDescription.tr,
                                        heading: data.planDetails.details.first
                                            .heading.tr,
                                        body: data
                                            .planDetails.details.first.body.tr,
                                        tags: _treatmentPlanController
                                            .selectedTags,
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightTwenty),
                          Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: ScreenConstant.defaultWidthTwenty,
                              ),
                              child: ReminderPlanWidget(
                                listData: _treatmentPlanController.reminderList,
                              )),
                          SizedBox(height: ScreenConstant.defaultHeightTwenty),
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
      ),
    );
  }

  _buildWavePainter() {
    return Container(
      margin: EdgeInsets.only(top: ScreenConstant.defaultHeightTwenty * 1.5),
      width: Get.context.mediaQuerySize.width,
      child: CustomPaint(
        size: Size(Get.context.mediaQuerySize.width,
            Get.context.mediaQuerySize.height),
        painter: WavePainter(),
      ),
    );
  }
}
