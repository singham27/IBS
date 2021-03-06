import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/MyAccount/MyAccountController.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/DummyData.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomDialog.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';

class MyIBSDiagnosis extends StatelessWidget {
  final MyAccountController _controller = Get.put(MyAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorProfileBg,
        appBar: AppBar(
          elevation: 0,
          leading: _controller.pagecount.value >= 1
              ? LeadingBackButton(
                  onPressed: () => _controller.pagecount.value--,
                )
              : LeadingBackButton(
                  onPressed: () => Get.back(),
                ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "MY IBS DIAGNOSIS",
            style: TextStyles.appBarTitle,
          ),
        ),
        body: _buildProfileStep4());
  }

  _buildProfileStep4() {
    return ListView(
      children: [
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Container(
            padding: EdgeInsets.only(
              bottom: ScreenConstant.defaultHeightTwenty,
              top: ScreenConstant.defaultHeightTwenty,
              left: ScreenConstant.defaultHeightForty,
              right: ScreenConstant.defaultHeightForty,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Your IBS Diagnosis",
                  style: TextStyles.textStyleSettingTitle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: ScreenConstant.sizeDefault),
                Text(
                  "You may change your IBS Diagnosis at any time. "
                  "Note that you may only have one diagnosis at any given time. "
                  "All data previously collected will remain unchanged.",
                  style: TextStyles.textStyleSettingDescription,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
        SizedBox(height: ScreenConstant.defaultHeightTen),
        Padding(
          padding: ScreenConstant.spacingAllLarge,
          child: Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
                padding: ScreenConstant.spacingAllLarge,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Do you know ",
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.black, fontSizeDelta: -4),
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => _buildIbsDialog(),
                          text: "which type of IBS ",
                          style: TextStyles.textStyleIntroDescription.apply(
                              color: AppColors.colorBackground,
                              fontSizeDelta: -4)),
                      TextSpan(text: "you have ?")
                    ],
                  ),
                )),
          ),
        ),
        SizedBox(height: ScreenConstant.defaultHeightTen),
        _buildListIbsType(),
        SizedBox(
          height: ScreenConstant.defaultHeightOneHundred,
        ),
        Container(
            child: CustomElevatedButton2(
          textColor: Colors.white,
          buttonColor: AppColors.colorBackground,
          widthFactor: 0.8,
          text: "Save Changes",
          onTap: () {
            _controller.updateIBS();
          },
        )),
        SizedBox(height: ScreenConstant.defaultHeightTwenty),
        Container(
            child: CustomElevatedButton2(
          textColor: Colors.black,
          buttonColor: Colors.transparent,
          widthFactor: 0.8,
          text: "Cancel",
          onTap: () {
            _controller.setUIDataMyIBSDiagnosis();
          },
        )),
      ],
    );
  }

  _buildListIbsType() {
    return GridView.builder(
      padding:
          EdgeInsets.symmetric(horizontal: ScreenConstant.defaultWidthTwenty),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: DummyData.iBsType.length,
      itemBuilder: (BuildContext context, int index) {
        var model = DummyData.iBsType[index];
        return GetBuilder<MyAccountController>(
            init: MyAccountController(),
            initState: (state) {
              // print('HomePageController state initialized');
            },
            builder: (authController) {
              authController.settingType = '1'.obs;
              authController.getUserList();

              return Obx(
                () => GestureDetector(
                  onTap: () {
                    _controller.selctedIbsType.value = index;
                    _controller.selectIbsType(_controller.selctedIbsType.value);
                  },
                  child: Card(
                      elevation: 0,
                      color: _controller.selctedIbsType.value == index
                          ? AppColors.colorYesButton
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${model.title}",
                              style: TextStyles.textStyleIntroDescription.apply(
                                  color:
                                      _controller.selctedIbsType.value == index
                                          ? Colors.white
                                          : AppColors.colorBackground,
                                  fontSizeDelta: -3)),
                          Text("${model.description}",
                              style: TextStyles.textStyleIntroDescription.apply(
                                  color:
                                      _controller.selctedIbsType.value == index
                                          ? Colors.white
                                          : AppColors.colorBackground,
                                  fontSizeDelta: -9)),
                        ],
                      )),
                ),
              );
            });
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 3),
    );
  }

  _buildIbsDialog() {
    Get.dialog(CustomDialog(
      title: "Sub-types of IBS",
      description:
          '''There are four sub-types of IBS. The sub- types are determined by the frequency and consistency of your stool.  

IBS-C: IBS with constipation. Common symptoms are stomach pain, bloating, abnormally delayed or infrequent bowel movements, or lumpy/hard stool.  

IBS-D: IBS with diarrhea. This comes with stomach pain, an urgent need to move your bowels, abnormally frequent bowel movements, or loose/watery stool.  IBS-M: IBS with mixed bowel habits. Both constipation and diarrhea.  ''',
    ));
  }
}
