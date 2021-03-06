import 'package:flutter_ibs/controllers/BaseTrackableController.dart';
import 'package:flutter_ibs/controllers/dateTime/DateTimeCardController.dart';
import 'package:flutter_ibs/controllers/home/HomeController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/food/FoodResponseModel.dart';
import 'package:flutter_ibs/models/food/FoodSendModel.dart';
import 'package:flutter_ibs/models/track_history/TrackHistoryResponseModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/DateTime.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';

class FoodController extends BaseTrackableController {
  HomeController homeController = Get.find();
  DateTimeCardController dateTimeController = Get.put(DateTimeCardController());

  Rx<FoodSendModel> foodModel = FoodSendModel(items: []).obs;
  RxList<TrackableItem> formWidgetList;

  //Rx<DateTime> currentDateTime = DateTime.now().obs;
  RxInt endTimeDifference = 0.obs;
  RxInt startTimeDifference = 0.obs;
  bool _isDefaultFoodSet = false;


  @override
  void onInit() {
    super.onInit();
  }


  void setup({TrackHistoryResponseModel pageData}) {
    foodModel.value.id = null;
    formWidgetList = trackablesController.getFoods();
    dateTimeController.setTimeToCurrent();

    _isDefaultFoodSet = false;

    if (pageData != null) {
      foodModel.value.id = pageData.id;
      dateTimeController.setDate(pageData.trackedAt);
      setSavedData(pageData: pageData);
      // Set the selected mean option:
      formWidgetList.first.list.options.forEach((food) {
        if (food.selected){
          formWidgetList.first.list.value = food;
        }
      });
    }else {
      // Set the default selected food based on time:
      formWidgetList.first.list.options.forEach((food) {
        mealOptionDefault(food);
      });
    }
  }


  onCancel() {
    Get.back();
  }


  /// Set the meal selection based on time of day
  mealOptionDefault(ListOption mealOption) {
    mealOption.selected = false;

    var startTime = CustomDateTime().parseTimeAsDateTime(
        dateTime: mealOption.conditionalDefault.time.first.startTime,
        returnFormat: "HH:mm");
    var endTime = CustomDateTime().parseTimeAsDateTime(
        dateTime: mealOption.conditionalDefault.time.first.endTime,
        returnFormat: "HH:mm");

    var s = "${dateTimeController.selectedDate.hour}:${dateTimeController.selectedDate.minute}";
    var u = CustomDateTime()
        .parseTimeAsDateTime(dateTime: s, returnFormat: "HH:mm");

    startTimeDifference.value = u.difference(startTime).inSeconds;
    endTimeDifference.value = (endTime.difference(u).inSeconds);
    if ((endTime.difference(u).inSeconds) > 0 &&
        (u.difference(startTime).inSeconds) > 0) {
      if (!_isDefaultFoodSet) {
        mealOption.selected = true;
        formWidgetList.first.list.value = mealOption;
        _isDefaultFoodSet = true;
      }
    }
  }



  valueChanged(TrackableSubmitItem submitItem) {
    var count = foodModel.value.items.length;
    bool isAdded = false;
    for (var i = 0; i < count; i++) {
      if (foodModel.value.items[i].tid == submitItem.tid) {
        foodModel.value.items[i] = submitItem;
        isAdded = true;
        break;
      }
    }

    if (!isAdded) {
      foodModel.value.items.add(submitItem);
    }
  }


  // Removed it from our tracked list:
  void onValueRemoved(TrackableItem item){
    var count = foodModel.value.items.length;
    for (var i = 0; i < count; i++) {
      if (foodModel.value.items[i].tid == item.tid) {
        // Remove all the children items:
        item.children.forEach((child) {
          child.items.forEach((childItem) {
            onValueRemoved(childItem);
          });
        });
        foodModel.value.items.removeAt(i);
        item.reset();
        break;
      }
    }

  }




  void onSave() async {
    foodModel.value.trackedAt = dateTimeController.selectedDate.toUtc();
    loader.value = true;

    bool isUpdate = false;

    FoodResponseModel data;
    if (foodModel.value.id != null){
      isUpdate = true;
      data = await ServiceApi().foodUpdateApi(id: foodModel.value.id, bodyData: foodModel.toJson());
      homeController.getTrackHistoryList();
    }else{
      data = await ServiceApi().foodTrackApi(bodyData: foodModel.toJson());
    }

    loader.value = false;
    if (data != null ) {
      Get.back();
      CustomSnackBar().successSnackBar(
          title: "Success", message: isUpdate ? "Food Updated Successfully" : "Food Added Successfully");
    }

  }



}


