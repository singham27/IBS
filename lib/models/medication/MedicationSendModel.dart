// To parse this JSON data, do
//
//     final medicationSendModel = medicationSendModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';

class MedicationSendModel {
  MedicationSendModel({
    this.id,
    this.category = "medications",
    this.items,
    this.trackedAt,
  });

  String id;
  String category;
  List<TrackableSubmitItem> items;
  DateTime trackedAt;


  factory MedicationSendModel.fromRawJson(String str) =>
      MedicationSendModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicationSendModel.fromJson(Map<String, dynamic> json) =>
      MedicationSendModel(
        id: json["_id"] == null ? null : json["_id"],
        category: json["category"] == null ? null : json["category"],
        items: json["items"] == null
            ? null
            : List<TrackableSubmitItem>.from(
                json["items"].map((x) => TrackableSubmitItem.fromJson(x))),
        trackedAt:
        json["trackedAt"] == null ? null : new DateTime(json["trackedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "category": category == null ? null : category,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
          "trackedAt": trackedAt.toUtc().toString(),
      };
}
/*
class MedicationItem {
  MedicationItem({
    this.tid,
    this.kind,
    this.dtype,
    this.value,
    this.category,
  });

  String tid;
  String kind;
  String dtype;
  MedicationValue value;
  String category;

  factory MedicationItem.fromRawJson(String str) =>
      MedicationItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicationItem.fromJson(Map<String, dynamic> json) => MedicationItem(
        tid: json["tid"] == null ? null : json["tid"],
        kind: json["kind"] == null ? null : json["kind"],
        dtype: json["dtype"] == null ? null : json["dtype"],
        value: json["value"] == null
            ? null
            : MedicationValue.fromJson(json["value"]),
        category: "medications",
  );

  Map<String, dynamic> toJson() => {
        "tid": tid == null ? null : tid,
        "kind": kind == null ? null : kind,
        "dtype": dtype == null ? null : dtype,
        "value": value == null ? null : value.toJson(),
        "category": "medications",
      };
}

class MedicationValue {
  MedicationValue({
    this.arr,
    this.str,
  });

  List<String> arr;
  String str;

  factory MedicationValue.fromRawJson(String str) =>
      MedicationValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicationValue.fromJson(Map<String, dynamic> json) =>
      MedicationValue(
        arr: json["arr"] == null
            ? null
            : List<String>.from(json["arr"].map((x) => x)),
        str: json["str"] == null ? null : json["str"],
      );

  Map<String, dynamic> toJson() => {
        "arr": arr == null ? null : List<dynamic>.from(arr.map((x) => x)),
        "str": str == null ? null : str,
      };
}
 */
