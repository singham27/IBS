import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';

class GridImageCommonWidget extends StatefulWidget {
  final String title;
  final String description;
  final int itemCount;
  final int gridIndex;
  final dataList;
  final EdgeInsetsGeometry gridPadding;
  final Function() onTap;
  final Color color;
  final String imageText;
  final String gridText;

  const GridImageCommonWidget(
      {Key key,
      this.title,
      this.description,
      this.itemCount,
      this.onTap,
      this.color,
      this.imageText,
      this.gridText,
      this.gridPadding,
      this.gridIndex,
      this.dataList})
      : super(key: key);

  @override
  State<GridImageCommonWidget> createState() => _GridImageCommonWidgetState();
}

class _GridImageCommonWidgetState extends State<GridImageCommonWidget> {
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
          SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
          GridView.builder(
            padding: widget.gridPadding,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.dataList.options.length,
            itemBuilder: (BuildContext context, int index) {
              var model = widget.dataList.options[index];
              return InkWell(
                onTap: widget.onTap,
                child: Card(
                    elevation: 0,
                    color: AppColors.colorSymptomsGridBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: ScreenConstant.spacingAllDefault,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            model.image.active,
                            width: ScreenConstant.defaultWidthTwenty * 2.0,
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightTen),
                          Text(model.value,
                              textAlign: TextAlign.center,
                              style: TextStyles.textStyleRegular.apply(
                                  color: AppColors.white, fontSizeDelta: -2)),
                        ],
                      ),
                    )),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 0.85),
          ),
        ],
      ),
    );
  }
}
