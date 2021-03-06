import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/user/UserController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/utils/TrackableItemUtils.dart';
import 'package:flutter_ibs/widget/ScreenControls/TagWidget.dart';
import 'package:flutter_ibs/widget/utils.dart';
import 'package:get/get.dart';

class AddableTagListWidget extends StatefulWidget {
  final TrackableItem trackableItem;
  final bool isFirst;
  final bool isLast;
  final bool isChild;
  final Function(TrackableSubmitItem) onValueChanged;
  final Function(TrackableItem)  onValueRemoved;

  AddableTagListWidget({
    //Key key,
    this.trackableItem,
    this.isFirst,
    this.isLast,
    this.isChild,
    this.onValueChanged,
    this.onValueRemoved,
  }) : super();

  @override
  _AddableTagListWidgetState createState() => _AddableTagListWidgetState();
}

class _AddableTagListWidgetState extends State<AddableTagListWidget> {
  RxList<Tag> selectedItems;
  UserController _userController;
  RxList<Tag> _allTags;

  final _textController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _textController.dispose();
    widget.onValueRemoved(widget.trackableItem);
    super.dispose();
  }



  @override
  void initState() {
    super.initState();
    doInit();
  }


  @override
  void didUpdateWidget(covariant AddableTagListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    doInit();
  }


  void doInit(){
    selectedItems = RxList<Tag>();

    // Set the initial list of selected tags
    if (widget.trackableItem.tags.selectedTags != null) {
      widget.trackableItem.tags.selectedTags.forEach((selTag) {
        selectedItems.add(selTag);
      });
      selectedItems.refresh();
    }

    // Combine the available tags default with the user's list:
    _allTags = RxList<Tag>();
    List<Tag> combinedTags = TrackableItemUtils()
        .addUserTagsToList(
        tags: widget.trackableItem.tags.tagsDefault,
        category: widget.trackableItem.tags.category);

    // Set the available tags active if they are selected:
    combinedTags.forEach((aTag) {
      selectedItems.forEach((sTag) {
        if(sTag.value == aTag.value){
          aTag.selected = true;
        }
      });
    });

    _allTags.addAll(combinedTags);

    _userController = Get.find();
    _textController.addListener(_onAddTagFieldChanged);
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
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTen,
                vertical: ScreenConstant.defaultHeightTen),
            child: Column(
              children: [
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                Text(widget.trackableItem.name.tr,
                    style: TextStyles.textStyleIntroDescription
                        .apply(color: Colors.white, fontSizeDelta: -3)),
                SizedBox(height: ScreenConstant.defaultHeightTen),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenConstant.defaultWidthTwenty),
                  child: Text(widget.trackableItem.description.tr,
                      style: TextStyles.textStyleIntroDescription
                          .apply(color: Colors.white60, fontSizeDelta: -6),
                    textAlign: TextAlign.center),
                ),

                SizedBox(height: ScreenConstant.defaultHeightTen),

                // Selected Item Tags
                Wrap(
                  children: selectedItems
                      .map((item) => InkWell(
                            child: TagWidget(
                              tag: item,
                              onValueChanged: _userTagListTapped,
                            ),
                          ))
                      .toList()
                      .cast<Widget>(),
                ),

                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  margin: ScreenConstant.spacingAllLarge,
                  child: FractionallySizedBox(
                    child: TextFormField(
                      controller: _textController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: widget.trackableItem.tags.addableLabel.tr,
                          hintStyle: TextStyles.textStyleRegular
                              .apply(color: AppColors.colorTextHint),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: ScreenConstant.sizeMedium,
                          )),
                    ),
                  ),
                ),
                InkWell(
                  onTap: _addNewTag,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: ScreenConstant.defaultWidthTen * 1.5,
                        backgroundColor: AppColors.colorArrowButton,
                        child: Icon(
                          Icons.add,
                          size: FontSize.s11,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: ScreenConstant.sizeDefault),
                      Text(
                        widget.trackableItem.tags.addableLabel.tr,
                        style: TextStyles.textStyleRegular
                            .apply(color: AppColors.white),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                    width: ScreenConstant.sizeDefault,
                    height: ScreenConstant.defaultHeightTwenty),
                // Available tags list
                Obx(
                  () => Wrap(
                    children: _allTags
                        .map((item) => InkWell(
                              child: TagWidget(
                                tag: item,
                                onValueChanged: _userTagListTapped,
                              ),
                            ))
                        .toList()
                        .cast<Widget>(),
                  ),
                ),

                SizedBox(height: ScreenConstant.defaultHeightTwenty),
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

  /// Add tag button hit:
  _addNewTag() {
    String copy = _textController.text.trim();
    if (copy.length == 0) {
      return;
    }

    dismissKeyboard(this.context);

    Tag tag = Tag();
    tag.value = copy;
    tag.category = widget.trackableItem.tags.category;
    _userController.addTagToUser(tag);
    tag.selected = true;

    _allTags.add(tag);
    _allTags.refresh();

    _onHandleToggle(widget.trackableItem, tag);

    _textController.text = "";
  }

  /// Tap of the list of tags under the input field
  _userTagListTapped(Tag tag) {
    _onHandleToggle(widget.trackableItem, tag);
  }

  /// Flip the state of the tag and track the data:
  _onHandleToggle(TrackableItem item, Tag tag) {
    setState(() {
      if (tag.selected) {
        selectedItems.add(tag);
      } else {
        for(var i=0;i<selectedItems.length;i++){
          if (selectedItems[i].value == tag.value){
            selectedItems.removeAt(i);
          }
        }
        _allTags.forEach((aTag) {
          if (aTag.value == tag.value){
            aTag.selected = false;
          }
        });
      }
      selectedItems.refresh();
    });


    List<String> flatList = [];
    selectedItems.forEach((element) {
      flatList.add(element.value);
    });

    widget.onValueChanged(TrackableSubmitItem(
      tid: item.tid,
      category: item.category,
      kind: item.kind,
      dtype: "arr",
      value: TrackableSubmitItemValue(arr: flatList),
    ));
  }

  _onAddTagFieldChanged() {}
}
/*
   var count = selectedItems.length;
      bool isFound = false;
      for(var i=0; i < count; i++) {
        if (selectedItems[i].value == tag.value) {
          selectedItems.removeAt(i);
          isFound = true;
          break;
        }
      }

      if (!isFound){

        selectedItems.add(tag);
      }

 */
