import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/dateTime/DateTimeCardController.dart';
import 'package:flutter_ibs/controllers/treatment_plan/TreatmentPlanController.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/TreatmentPlanResponseModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomDialog.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/CustomPainters.dart';
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
  final DateTimeCardController dateTimeController =
      Get.put(DateTimeCardController());

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
            _treatmentPlanController.existTreatmentPlans.contains(data.pid)
                ? Offstage()
                : CustomElevatedButton(
                    widthFactor: 0.7,
                    text: "Save Changes",
                    onTap: _treatmentPlanController.onSave,
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
                          _treatmentPlanController.existTreatmentPlans
                                  .contains(data.pid)
                              ? CustomElevatedButton2(
                                  elevation: 16,
                                  widthFactor: 0.7,
                                  onTap: () => Get.dialog(CustomDialog3(
                                    title: "Are you sure?",
                                    description:
                                        '''Stopping the treatment plan will remove all plan notifications and tracking options associated with this plan. Any data associated with the plan will remain''',
                                    onTap: _treatmentPlanController
                                        .onStopTreatmentPlan,
                                  )),
                                  textColor: AppColors.colorTextStop,
                                  text: data.stopPlan.tr,
                                  buttonColor: AppColors.white,
                                )
                              : Offstage(),
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
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                                top: -120,
                                                child: Container(
                                                    height: 150,
                                                    width: 150,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppColors
                                                            .colorSymptomsGridBg
                                                            .withOpacity(
                                                                0.5)))),
                                            Positioned(
                                                top: -200,
                                                child: Container(
                                                    height: 300,
                                                    width: 300,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppColors
                                                            .colorSymptomsGridBg
                                                            .withOpacity(
                                                                0.2)))),
                                            Positioned(
                                                bottom: -120,
                                                child: Container(
                                                    height: 150,
                                                    width: 150,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppColors
                                                            .colorSymptomsGridBg
                                                            .withOpacity(
                                                                0.5)))),
                                            Positioned(
                                                bottom: -200,
                                                child: Container(
                                                    height: 300,
                                                    width: 300,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppColors
                                                            .colorSymptomsGridBg
                                                            .withOpacity(
                                                                0.2)))),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: ScreenConstant
                                                    .defaultWidthTwenty,
                                              ),
                                              child: _treatmentPlanController
                                                      .loader.value
                                                  ? Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    )
                                                  : Column(
                                                      children: [
                                                        SizedBox(
                                                            height: ScreenConstant
                                                                .defaultHeightTen),
                                                        DynamicWidget(
                                                          data: data.trackables,
                                                        ),
                                                        Divider(
                                                            thickness: 1,
                                                            color: AppColors
                                                                .white
                                                                .withOpacity(
                                                                    0.12)),
                                                        ReminderWidget(
                                                          title: data.reminders
                                                              .name.tr,
                                                          description: data
                                                              .reminders
                                                              .description
                                                              .tr,
                                                          data: data.reminders
                                                              .children,
                                                        ),
                                                        SizedBox(
                                                            height: ScreenConstant
                                                                    .defaultHeightForty *
                                                                1.4),
                                                      ],
                                                    ),
                                            ),
                                          ],
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
                                        optionList: _treatmentPlanController
                                            .selectedOptionList,
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
                                listOption: data.reminders.children,
                                onChanged: (_) {
                                  _treatmentPlanController.reminderList.clear();
                                  _treatmentPlanController.reminderList
                                      .refresh();
                                },
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
