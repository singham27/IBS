// To parse this JSON data, do
//
//     final postTreatmentPlanSendModel = postTreatmentPlanSendModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_ibs/models/TreatmentPlanModel/TreatmentPlanModel.dart';

class PostTreatmentPlanSendModel {
  PostTreatmentPlanSendModel({
    this.pid,
    this.category,
    this.trackingDefaults,
    this.tags,
    this.reminders,
  });

  String pid;
  String category;
  List<TrackingSendData> trackingDefaults;
  List<dynamic> tags;
  List<Reminder> reminders;

  factory PostTreatmentPlanSendModel.fromRawJson(String str) =>
      PostTreatmentPlanSendModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostTreatmentPlanSendModel.fromJson(Map<String, dynamic> json) =>
      PostTreatmentPlanSendModel(
        pid: json["pid"] == null ? null : json["pid"],
        category: json["category"] == null ? null : json["category"],
        trackingDefaults: json["trackingDefaults"] == null
            ? null
            : List<TrackingSendData>.from(json["trackingDefaults"]
                .map((x) => TrackingSendData.fromJson(x))),
        tags: json["tags"] == null
            ? null
            : List<dynamic>.from(json["tags"].map((x) => x)),
        reminders: json["reminders"] == null
            ? null
            : List<Reminder>.from(
                json["reminders"].map((x) => Reminder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pid": pid == null ? null : pid,
        "category": category == null ? null : category,
        "trackingDefaults": trackingDefaults == null
            ? null
            : List<dynamic>.from(trackingDefaults.map((x) => x.toJson())),
        "tags": tags == null
            ? null
            : List<dynamic>.from(tags.map((x) => x.toJson())),
        "reminders": reminders == null
            ? null
            : List<dynamic>.from(reminders.map((x) => x.toJson())),
      };
}

class TrackingSendData {
  TrackingSendData({
    this.tid,
    this.category,
    this.kind,
    this.dtype,
    this.value,
  });

  String tid;
  String category;
  String kind;
  String dtype;
  TrackingValue value;

  factory TrackingSendData.fromRawJson(String str) =>
      TrackingSendData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrackingSendData.fromJson(Map<String, dynamic> json) =>
      TrackingSendData(
        tid: json["tid"] == null ? null : json["tid"],
        category: json["category"] == null ? null : json["category"],
        kind: json["kind"] == null ? null : json["kind"],
        dtype: json["dtype"] == null ? null : json["dtype"],
        value: json["value"] == null
            ? null
            : TrackingValue.fromJson(json["value"]),
      );

  Map<String, dynamic> toJson() => {
        "tid": tid == null ? null : tid,
        "category": category == null ? null : category,
        "kind": kind == null ? null : kind,
        "dtype": dtype == null ? null : dtype,
        "value": value == null ? null : value.toJson(),
      };
}

class TrackingValue {
  TrackingValue({
    this.str,
    this.arr,
    this.numValue,
  });

  String str;
  String arr;
  num numValue;

  factory TrackingValue.fromRawJson(String str) =>
      TrackingValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrackingValue.fromJson(Map<String, dynamic> json) => TrackingValue(
        str: json["str"] == null ? null : json["str"],
        arr: json["arr"] == null ? null : json["arr"],
        numValue: json["num"] == null ? null : json["num"],
      );

  Map<String, dynamic> toJson() => {
        "str": str == null ? null : str,
        "arr": arr == null ? null : arr,
        "num": numValue == null ? null : numValue,
      };
}
