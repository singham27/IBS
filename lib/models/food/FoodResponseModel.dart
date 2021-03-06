// To parse this JSON data, do
//
//     final foodResponseModel = foodResponseModelFromJson(jsonString);

import 'dart:convert';

FoodResponseModel foodResponseModelFromJson(String str) =>
    FoodResponseModel.fromJson(json.decode(str));

String foodResponseModelToJson(FoodResponseModel data) =>
    json.encode(data.toJson());

class FoodResponseModel {
  FoodResponseModel({
    this.id,
    this.items,
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  List<Item> items;
  String uid;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory FoodResponseModel.fromJson(Map<String, dynamic> json) =>
      FoodResponseModel(
        id: json["_id"] == null ? null : json["_id"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        uid: json["uid"] == null ? null : json["uid"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
        "uid": uid == null ? null : uid,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Item {
  Item({
    this.value,
    this.id,
    this.tid,
    this.kind,
    this.dtype,
    this.children,
  });

  ItemValue value;
  String id;
  String tid;
  String kind;
  String dtype;
  List<Child> children;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        value: json["value"] == null ? null : ItemValue.fromJson(json["value"]),
        id: json["_id"] == null ? null : json["_id"],
        tid: json["tid"] == null ? null : json["tid"],
        kind: json["kind"] == null ? null : json["kind"],
        dtype: json["dtype"] == null ? null : json["dtype"],
        children: json["children"] == null
            ? null
            : List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value.toJson(),
        "_id": id == null ? null : id,
        "tid": tid == null ? null : tid,
        "kind": kind == null ? null : kind,
        "dtype": dtype == null ? null : dtype,
        "children": children == null
            ? null
            : List<dynamic>.from(children.map((x) => x.toJson())),
      };
}

class Child {
  Child({
    this.value,
    this.id,
    this.tid,
    this.kind,
    this.dtype,
  });

  ChildValue value;
  String id;
  String tid;
  String kind;
  String dtype;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        value:
            json["value"] == null ? null : ChildValue.fromJson(json["value"]),
        id: json["_id"] == null ? null : json["_id"],
        tid: json["tid"] == null ? null : json["tid"],
        kind: json["kind"] == null ? null : json["kind"],
        dtype: json["dtype"] == null ? null : json["dtype"],
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value.toJson(),
        "_id": id == null ? null : id,
        "tid": tid == null ? null : tid,
        "kind": kind == null ? null : kind,
        "dtype": dtype == null ? null : dtype,
      };
}

class ChildValue {
  ChildValue({
    this.arr,
  });

  List<String> arr;

  factory ChildValue.fromJson(Map<String, dynamic> json) => ChildValue(
        arr: json["arr"] == null
            ? null
            : List<String>.from(json["arr"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "arr": arr == null ? null : List<dynamic>.from(arr.map((x) => x)),
      };
}

class ItemValue {
  ItemValue({
    this.arr,
    this.str,
  });

  List<dynamic> arr;
  String str;

  factory ItemValue.fromJson(Map<String, dynamic> json) => ItemValue(
        arr: json["arr"] == null
            ? null
            : List<dynamic>.from(json["arr"].map((x) => x)),
        str: json["str"] == null ? null : json["str"],
      );

  Map<String, dynamic> toJson() => {
        "arr": arr == null ? null : List<dynamic>.from(arr.map((x) => x)),
        "str": str == null ? null : str,
      };
}
