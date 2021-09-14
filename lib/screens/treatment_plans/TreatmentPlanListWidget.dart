import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/treatment_plan/TreatmentPlanController.dart';
import 'package:flutter_ibs/models/TreatmentPlanResponseModel.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/screens/stress_management/StressTreatmentPlan.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:flutter_ibs/widget/TreatmentPlanListItem.dart';
import 'package:get/get.dart';

import 'TreatmentPlanListWidgetDetails.dart';

class TreatmentPlanListWidget extends StatelessWidget {
  final TreatmentPlanController _treatmentPlanController = Get.find();
  final TreatmentPlanItemData data;
  TreatmentPlanListWidget({this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorTracBg,
      appBar: AppBar(
        elevation: 0,
        leading: LeadingBackButton(
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          data.planName.tr,
          style: TextStyles.appBarTitle,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty),
            child: Image.asset(
              Assets.settings,
              width: ScreenConstant.defaultWidthTwenty,
            ),
          )
        ],
      ),
      body: ListView(
        padding: ScreenConstant.spacingAllMedium,
        physics: ClampingScrollPhysics(),
        children: [
          Center(
              child: Image.network(data.image.active,
                  width: ScreenConstant.defaultHeightTwoHundredTen)),
          SizedBox(height: ScreenConstant.defaultHeightSixteen),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty * 2),
            child: Text(
              data.planDescription.tr,
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular.apply(color: Colors.black),
            ),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwenty),
          TreatmentPlanListItem(data.planDescription.tr, () {}),
          SizedBox(height: ScreenConstant.defaultHeightSixteen),
          CustomElevatedButton(
            text: "Start Plan",
            widthFactor: 0.95,
            onTap: () {
              Get.bottomSheet(StressTreatmentPlan(),
                  isScrollControlled: true,
                  barrierColor: AppColors.barrierColor.withOpacity(0.60));
            },
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          Text(
            "Additional Resources",
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -4),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: ScreenConstant.defaultHeightTen),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.additionalResources.length,
            itemBuilder: (BuildContext context, int index) {
              var model = data.additionalResources[index];
              return TreatmentPlanListItem(model.name.tr, () {
                Get.to(TreatmentPlanListWidgetDetails(
                  details: model.details,
                  title: data.planName.tr,
                ));
              });
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: ScreenConstant.sizeDefault,
            ),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        ],
      ),
    );
  }
}
