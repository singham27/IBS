import 'package:flutter/material.dart';
import 'package:flutter_ibs/screens/sleep/SleepTreatmentPlan.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class Sleep extends StatelessWidget {
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
          "Improve sleep".toUpperCase(),
          style: TextStyles.appBarTitle,
        ),
      ),
      body: ListView(
        padding: ScreenConstant.spacingAllMedium,
        physics: ClampingScrollPhysics(),
        children: [
          Center(
              child: Image.asset(Assets.sleep,
                  width: ScreenConstant.defaultHeightTwoHundredTen)),
          SizedBox(height: ScreenConstant.defaultHeightSixteen),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty * 2),
            child: Text(
              "Feeling well-rested can help improve your IBS symptoms",
              textAlign: TextAlign.center,
              style: TextStyles.textStyleRegular.apply(color: Colors.black),
            ),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTwenty),
          _buildExercise("Improved Sleep Treatment Plan", () {}),
          SizedBox(height: ScreenConstant.defaultHeightSixteen),
          CustomElevatedButton(
            text: "Start Plan",
            widthFactor: 0.95,
            onTap: () {
              Get.bottomSheet(SleepTreatmentPlan(),
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
          _buildListAdditionalResources(),
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        ],
      ),
    );
  }

  Widget _buildExercise(String title, Function onPressed) {
    return Container(
      padding: ScreenConstant.spacingAllSmall,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.colorBorder, width: 1)),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        title: Padding(
          padding: EdgeInsets.only(left: ScreenConstant.sizeXXL),
          child: Text(
            title,
            style: TextStyles.textStyleIntroDescription
                .apply(color: Colors.black, fontSizeDelta: -6),
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            color: AppColors.colorYesButton,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            icon: Icon(Icons.arrow_forward_ios_outlined,
                color: AppColors.white, size: FontSize.s14),
            onPressed: onPressed as void Function()?,
          ),
        ),
      ),
    );
  }

  _buildListAdditionalResources() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: DummyData.sleepAdditionalResourcesList.length,
      itemBuilder: (BuildContext context, int index) {
        var model = DummyData.sleepAdditionalResourcesList[index];
        return _buildExercise(model.title!, () {
          // Get.toNamed(sleepTreatmentPlan);
        });
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: ScreenConstant.sizeDefault,
      ),
    );
  }
}
