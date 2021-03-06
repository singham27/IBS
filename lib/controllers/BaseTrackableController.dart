
import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/track_history/TrackHistoryResponseModel.dart';
import 'package:get/get.dart';

class BaseTrackableController extends GetxController {
  RxBool loader = false.obs;

  TrackablesController trackablesController = Get.find();
  RxList<TrackableItem> formWidgetList = RxList();



  void onCancel() {
    Get.back();
  }


  void setSavedData({TrackHistoryResponseModel pageData}){

    if (pageData != null){
      formWidgetList.forEach((item) {
        setPreviousValue(item, pageData);
        item.children.forEach((child) {
          child.items.forEach((childItem) {
            setPreviousValue(childItem, pageData);
          });
        });
      });
    }

    // Refresh the local list so the form can generate:
    formWidgetList.refresh();
  }



  // Sets the value of each trackable to the stored history
  void setPreviousValue(TrackableItem item, TrackHistoryResponseModel pageData){
    int num = pageData.items.length;
    for (var i=0;i<num;i++){
      if (pageData.items[i].tid == item.tid){
        var pageItem = pageData.items[i];
        switch(item.kind){
          case 'rating':
            item.rating.value = pageItem.val;
            break;
          case 'bristolScale':
            item.rating.value = pageItem.val;
            break;
          case 'list':
            item.list.setOptionsByValues(pageItem.val);
            break;
          case 'selectInline':
            item.select.setOptionByValue(pageItem.val);
          break;
          case 'select':
            item.select.setOptionByValue(pageItem.val);
            break;
          case 'textInput':
            item.textInput.value = pageItem.val;
            break;
          case 'color':
            item.color.setOptionsByValues(pageItem.val);
            break;
          case 'toggleInline':
            item.toggle.value = pageItem.val;
            break;
          case 'numberInput':
            item.numberInput.value = pageItem.val.toString();
            break;
          case 'tags':
            item.tags.setTagsByValues(pageItem.val);
            break;
          case 'timePickerInline':
            var time = pageItem.val.split(":");
            item.timePicker = new TimeOfDay(hour: int.parse(time[0]), minute: int.parse(time[1]));
            break;
          case 'sum':
            item.sum.value =pageItem.val;
            break;
          default:
            String kind = item.kind;
            //throw new Exception("Unknown widget type for setPreviousValue, $kind");
          print("Unknown widget type for setPreviousValue, $kind");
        }
        break;
      }
    }
  }

}
