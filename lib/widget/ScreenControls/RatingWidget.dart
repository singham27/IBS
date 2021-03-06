import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/ScreenControls/RenderItemChildrenWidget.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RatingWidget extends StatefulWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;
  final Function(TrackableItem)  onValueRemoved;

  const RatingWidget({
    Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
    this.onValueRemoved,
  }) : super(key: key);

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {

  double _currentValue;



  @override
  void initState() {
    _currentValue = widget.trackableItem.rating.value.toDouble();

    // As this is tracked, set its initial tracking state:
    widget.onValueChanged(TrackableSubmitItem(
      tid: widget.trackableItem.tid,
      category: widget.trackableItem.category,
      kind: widget.trackableItem.kind,
      dtype: "num",
      value: TrackableSubmitItemValue(number: _currentValue),
    ));
    super.initState();
  }


  @override
  void deactivate() {
    super.deactivate();
    widget.onValueRemoved(widget.trackableItem);
  }




  @override
  Widget build(BuildContext context) {
    bool hasChildren = widget.trackableItem.children.length > 0;

    return Stack(
      children: [
        Positioned.fill(
          top: widget.isFirst ? ScreenConstant.defaultHeightOneHundred : 0,
          child: Container(
            color: AppColors.colorYesButton,
          ),
        ),
        Card(
          color: AppColors.colorBackground,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(widget.isFirst ? 20 : 0),
                  topRight: Radius.circular(widget.isFirst ? 20 : 0),
                  bottomLeft: Radius.circular(widget.isLast ? 20 : 0),
                  bottomRight: Radius.circular(widget.isLast ? 20 : 0))),
          margin: EdgeInsets.only(
            left: widget.isChild ? 0 : ScreenConstant.defaultWidthTwenty,
            right: widget.isChild ? 0 : ScreenConstant.defaultWidthTwenty,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal:
                    widget.isChild ? 0 : ScreenConstant.defaultWidthTwenty,
                vertical: 1),
            child: Column(
              children: [
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                Text(widget.trackableItem.name.tr,
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.white, fontSizeDelta: -3)),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                SizedBox(
                  height: 34,
                  child: Text(
                    //trackableItem.description.tr,
                    widget.trackableItem.rating
                        .options[(_currentValue.toInt() - 1)].description.tr,
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyleRegular
                        .apply(color: AppColors.colorSkipButton),
                  ),
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenConstant.defaultWidthTen),
                  child: SfSliderTheme(
                    data: SfSliderThemeData(
                      labelOffset: Offset(0.0, 26.0),
                      thumbColor: AppColors.colorArrowButton,
                      thumbStrokeWidth: 5,
                      thumbRadius: 16,
                      thumbStrokeColor: Colors.white,
                      activeTrackHeight: 4,
                      overlayRadius: 0,
                      disabledActiveTrackColor: AppColors.colorTrackSlider,
                      disabledInactiveTrackColor: AppColors.colorTrackSlider,
                      activeDividerStrokeWidth: 2,
                      inactiveDividerStrokeWidth: 2,
                      inactiveTrackHeight: 4,
                      activeTrackColor: AppColors.colorTrackSlider,
                      inactiveTrackColor: AppColors.colorTrackSlider,
                      inactiveDividerStrokeColor: AppColors.white,
                      inactiveDividerRadius: 8,
                      inactiveDividerColor:
                          AppColors.colorInactiveDividerSlider,
                      activeDividerColor: AppColors.colorInactiveDividerSlider,
                      activeDividerStrokeColor: Colors.white,
                      activeDividerRadius: 8,
                      activeLabelStyle: TextStyles.textStyleRegular
                          .apply(color: AppColors.colorTrackSlider),
                      inactiveLabelStyle: TextStyles.textStyleRegular
                          .apply(color: AppColors.colorTrackSlider),
                    ),
                    child: SfSlider(
                      showDividers: true,
                      min: 1.0,
                      max: widget.trackableItem.rating.range,
                      interval: 1,
                      stepSize: 1,
                      showLabels: true,
                      value: _currentValue,
                      onChanged: (dynamic newValue) {
                        setState(() {
                          _currentValue = newValue;
                          widget.trackableItem.rating.value = newValue;
                        });

                        widget.onValueChanged(TrackableSubmitItem(
                          tid: widget.trackableItem.tid,
                          category: widget.trackableItem.category,
                          kind: widget.trackableItem.kind,
                          dtype: "num",
                          value:
                              TrackableSubmitItemValue(number: _currentValue),
                        ));
                      },
                      labelFormatterCallback:
                          (dynamic actualValue, String formattedText) {
                        return actualValue == 1
                            ? widget.trackableItem.rating.labels.min.tr
                            : actualValue == 2
                                ? ""
                                : actualValue == 3
                                    ? ""
                                    : widget.trackableItem.rating.labels.max.tr;
                      },
                    ),
                  ),
                ),
                SizedBox(height: ScreenConstant.defaultHeightForty),
                RenderItemChildrenWidget(
                  trackableItem: widget.trackableItem,
                  isChild: true,
                  isFirst: false,
                  isLast: false,
                  onValueChanged: widget.onValueChanged,
                  onValueRemoved: widget.onValueRemoved,
                ),
                Visibility(
                    visible: !widget.isChild && !widget.isLast && !hasChildren,
                    child: Divider(
                        thickness: 1,
                        color: AppColors.white.withOpacity(0.12))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
