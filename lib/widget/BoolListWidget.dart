import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomSwitch.dart';
import 'package:flutter_ibs/widget/ShowMoreWidget.dart';

class BoolListWidget extends StatefulWidget {
  final String title;
  final String description;
  final int itemCount;
  final EdgeInsetsGeometry gridPadding;
  final Function(bool) onChanged;
  final bool value;
  final dataList;
  final String listText;

  BoolListWidget(
      {Key key,
      this.title = "",
      this.description = "",
      this.itemCount = 0,
      this.onChanged,
      this.value,
      this.listText = "",
      this.gridPadding,
      this.dataList})
      : super(key: key);
  @override
  _BoolListWidgetState createState() => _BoolListWidgetState();
}

class _BoolListWidgetState extends State<BoolListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ScreenConstant.spacingAllMedium,
      child: Column(
        children: [
          SizedBox(height: ScreenConstant.defaultHeightTwenty),
          Text(widget.title,
              textAlign: TextAlign.center,
              style: TextStyles.textStyleIntroDescription
                  .apply(color: Colors.white, fontSizeDelta: -3)),
          SizedBox(height: ScreenConstant.defaultHeightTen),
          Text(
            widget.description,
            textAlign: TextAlign.center,
            style: TextStyles.textStyleRegular
                .apply(color: AppColors.colorSkipButton),
          ),
          widget.dataList.boolList.boolListDefault.length > 0
              ? SizedBox(height: ScreenConstant.defaultHeightTwentyFour)
              : Offstage(),
          ListView.separated(
            itemCount: widget.dataList.boolList.boolListDefault.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Text(
                    widget.listText,
                    style:
                        TextStyles.textStyleRegular.apply(color: Colors.white),
                  ),
                  Spacer(),
                  CustomSwitch(
                    color: AppColors.colorIcons,
                    value: widget.value,
                    onChanged: widget.onChanged,
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                Divider(thickness: 1, color: AppColors.white.withOpacity(0.12)),
          ),
          SizedBox(height: ScreenConstant.defaultHeightTen),
          widget.dataList.boolList.userAddable
              ? Column(
                  children: [
                    Container(
                      height: ScreenConstant.sizeDefault,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: FractionallySizedBox(
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Add medication",
                              hintStyle: TextStyles.textStyleRegular
                                  .apply(color: AppColors.colorTextHint),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: ScreenConstant.sizeMedium,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenConstant.defaultHeightSixteen),
                    ShowMoreWidget(
                      text: "Add medication",
                    ),
                    SizedBox(height: ScreenConstant.defaultHeightSixteen),
                  ],
                )
              : Offstage(),
        ],
      ),
    );
  }
}
