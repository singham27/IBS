import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/health/HealthController.dart';
import 'package:flutter_ibs/controllers/signup/SignUpController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/RenderWidgetByType.dart';
import 'package:get/get.dart';

class Health extends StatelessWidget {
  final controller = Get.put(HealthController());
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
               // onTap: _healthWellnessController.onSave,
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
        resizeToAvoidBottomInset: false,
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
                            controller.loader.value
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
                                    itemCount: controller.formWidgetList.length,
                                    itemBuilder: (_, mainIndex) {
                                      var isLast = false;

                                      if (mainIndex ==  (controller.formWidgetList.length - 2)
                                          || mainIndex ==  (controller.formWidgetList.length - 1 )){
                                        // If it's the last one or two... because additional notes could be after.
                                        isLast = true;
                                      }
                                      return RenderWidgetByType().renderTrackableItem(
                                          controller.formWidgetList[mainIndex],
                                          isFirst: mainIndex == 0,
                                          isLast: isLast,
                                          onValueChanged: controller.valueChanged
                                      );
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



}
