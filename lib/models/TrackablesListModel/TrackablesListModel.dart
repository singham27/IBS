// To parse this JSON data, do
//
//     final trackablesListModel = trackablesListModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_ibs/services/url.dart';

class TrackablesListModel {
  TrackablesListModel({
    this.total,
    this.limit,
    this.skip,
    this.data,
  });

  int total;
  int limit;
  int skip;
  List<Datum> data;

  factory TrackablesListModel.fromJson(Map<String, dynamic> json) => TrackablesListModel(
    total: json["total"] == null ? null : json["total"],
    limit: json["limit"] == null ? null : json["limit"],
    skip: json["skip"] == null ? null : json["skip"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "limit": limit == null ? null : limit,
    "skip": skip == null ? null : skip,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.tid,
    this.service,
    this.kind,
    this.category,
    this.name,
    this.header,
    this.image,
    this.items,
    this.version,
    this.enabled,
  });

  String id;
  String tid;
  String service;
  String kind;
  String category;
  String name;
  String header;
  ModelImage image;
  List<DatumItem> items;
  int version;
  bool enabled;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"] == null ? null : json["_id"],
    tid: json["tid"] == null ? null : json["tid"],
    service: json["service"] == null ? null : json["service"],
    kind: json["kind"] == null ? null : json["kind"],
    category: json["category"] == null ? null : json["category"],
    name: json["name"] == null ? null : json["name"],
    header: json["header"] == null ? null : json["header"],
    image: json["image"] == null ? null : ModelImage.fromJson(json["image"]),
    items: json["items"] == null ? null : List<DatumItem>.from(json["items"].map((x) => DatumItem.fromJson(x))),
    version: json["version"] == null ? null : json["version"],
    enabled: json["enabled"] == null ? null : json["enabled"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "tid": tid == null ? null : tid,
    "service": service == null ? null : service,
    "kind": kind == null ? null : kind,
    "category": category == null ? null : category,
    "name": name == null ? null : name,
    "header": header == null ? null : header,
    "image": image == null ? null : image.toJson(),
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
    "version": version == null ? null : version,
    "enabled": enabled == null ? null : enabled,
  };
}

class ModelImage {
  ModelImage({
    this.normal,
    this.active,
  });

  String normal;
  String active;

  factory ModelImage.fromJson(Map<String, dynamic> json) => ModelImage(
        normal: json["normal"] == null
            ? BLANK_PLACEHOLDER
            : "$BASE_URL/${json["normal"]}",
        active: json["active"] == null
            ? BLANK_PLACEHOLDER
            : "$BASE_URL/${json["active"]}",
      );

  Map<String, dynamic> toJson() => {
        "normal": normal,
        "active": active,
      };
}

class DatumItem {
  DatumItem({
    this.tid,
    this.name,
    this.description,
    this.category,
    this.style,
    this.kind,
    this.enabledDefault,
    this.rating,
    this.children,
    this.textInput,
    this.validation,
    this.color,
    this.list,
    this.sum,
    this.tags,
    this.boolList,
    this.condition,
  });

  String tid;
  String name;
  String description;
  String category;
  PurpleStyle style;
  String kind;
  bool enabledDefault;
  FluffyRating rating;
  List<PurpleChild> children;
  TextInput textInput;
  ListValidation validation;
  ModelColor color;
  FluffyList list;
  Sum sum;
  FluffyTags tags;
  BoolList boolList;
  ItemCondition condition;

  factory DatumItem.fromJson(Map<String, dynamic> json) => DatumItem(
    tid: json["tid"] == null ? null : json["tid"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    category: json["category"] == null ? null : json["category"],
    style: json["style"] == null ? null : fluffyStyleValues.map[json["style"]],
    kind: json["kind"] == null ? null : json["kind"],
    enabledDefault: json["enabledDefault"] == null ? false : json["enabledDefault"],
    rating: json["rating"] == null ? null : FluffyRating.fromJson(json["rating"]),
    children: json["children"] == null ? null : List<PurpleChild>.from(json["children"].map((x) => PurpleChild.fromJson(x))),
    textInput: json["textInput"] == null ? null : TextInput.fromJson(json["textInput"]),
    validation: json["validation"] == null ? null : ListValidation.fromJson(json["validation"]),
    color: json["color"] == null ? null : ModelColor.fromJson(json["color"]),
    list: json["list"] == null ? null : FluffyList.fromJson(json["list"]),
    sum: json["sum"] == null ? null : Sum.fromJson(json["sum"]),
    tags: json["tags"] == null ? null : FluffyTags.fromJson(json["tags"]),
    boolList: json["boolList"] == null ? null : BoolList.fromJson(json["boolList"]),
    condition: json["condition"] == null ? null : ItemCondition.fromJson(json["condition"]),
  );

  Map<String, dynamic> toJson() => {
    "tid": tid == null ? null : tid,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "category": category == null ? null : category,
    "style": style == null ? null : fluffyStyleValues.reverse[style],
    "kind": kind == null ? null : kind,
    "enabledDefault": enabledDefault == null ? null : enabledDefault,
    "rating": rating == null ? null : rating.toJson(),
    "children": children == null ? null : List<dynamic>.from(children.map((x) => x.toJson())),
    "textInput": textInput == null ? null : textInput.toJson(),
    "validation": validation == null ? null : validation.toJson(),
    "color": color == null ? null : color.toJson(),
    "list": list == null ? null : list.toJson(),
    "sum": sum == null ? null : sum.toJson(),
    "tags": tags == null ? null : tags.toJson(),
    "boolList": boolList == null ? null : boolList.toJson(),
    "condition": condition == null ? null : condition.toJson(),
  };
}

class BoolList {
  BoolList({
    this.name,
    this.description,
    this.userAddable,
    this.boolListDefault,
    this.source,
    this.relation,
  });

  String name;
  String description;
  bool userAddable;
  List<dynamic> boolListDefault;
  String source;
  BoolListRelation relation;

  factory BoolList.fromJson(Map<String, dynamic> json) => BoolList(
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    userAddable: json["userAddable"] == null ? null : json["userAddable"],
    boolListDefault: json["default"] == null ? null : List<dynamic>.from(json["default"].map((x) => x)),
    source: json["source"] == null ? null : json["source"],
    relation: json["relation"] == null ? null : BoolListRelation.fromJson(json["relation"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "userAddable": userAddable == null ? null : userAddable,
    "default": boolListDefault == null ? null : List<dynamic>.from(boolListDefault.map((x) => x)),
    "source": source == null ? null : source,
    "relation": relation == null ? null : relation.toJson(),
  };
}

class BoolListRelation {
  BoolListRelation({
    this.related,
    this.property,
  });

  String related;
  String property;

  factory BoolListRelation.fromJson(Map<String, dynamic> json) => BoolListRelation(
    related: json["related"] == null ? null : json["related"],
    property: json["property"] == null ? null : json["property"],
  );

  Map<String, dynamic> toJson() => {
    "related": related == null ? null : related,
    "property": property == null ? null : property,
  };
}

class PurpleChild {
  PurpleChild({
    this.condition,
    this.items,
    this.validation,
  });

  PurpleCondition condition;
  List<PurpleItem> items;
  ListValidation validation;

  factory PurpleChild.fromJson(Map<String, dynamic> json) => PurpleChild(
    condition: json["condition"] == null ? null : PurpleCondition.fromJson(json["condition"]),
    items: json["items"] == null ? null : List<PurpleItem>.from(json["items"].map((x) => PurpleItem.fromJson(x))),
    validation: json["validation"] == null ? null : ListValidation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "condition": condition == null ? null : condition.toJson(),
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
    "validation": validation == null ? null : validation.toJson(),
  };
}

class PurpleCondition {
  PurpleCondition({
    this.conditionOperator,
    this.value,
  });

  String conditionOperator;
  dynamic value;

  factory PurpleCondition.fromJson(Map<String, dynamic> json) => PurpleCondition(
    conditionOperator: json["operator"] == null ? null : json["operator"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "operator": conditionOperator == null ? null : conditionOperator,
    "value": value,
  };
}

class PurpleItem {
  PurpleItem({
    this.tid,
    this.name,
    this.description,
    this.category,
    this.style,
    this.kind,
    this.enabledDefault,
    this.list,
    this.select,
    this.toggle,
    this.tags,
    this.children,
    this.numberInput,
    this.timePicker,
  });

  String tid;
  String name;
  String selectedValue;
  String description;
  String category;
  TagsStyle style;
  String kind;
  bool enabledDefault;
  PurpleList list;
  Select select;
  Toggle toggle;
  FluffyTags tags;
  List<FluffyChild> children;
  NumberInput numberInput;
  TimePicker timePicker;

  factory PurpleItem.fromJson(Map<String, dynamic> json) => PurpleItem(
    tid: json["tid"] == null ? null : json["tid"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    category: json["category"] == null ? null : json["category"],
    style: json["style"] == null ? null : purpleStyleValues.map[json["style"]],
    kind: json["kind"] == null ? null : json["kind"],
    enabledDefault: json["enabledDefault"] == null ? null : json["enabledDefault"],
    list: json["list"] == null ? null : PurpleList.fromJson(json["list"]),
    select: json["select"] == null ? null : Select.fromJson(json["select"]),
    toggle: json["toggle"] == null ? null : Toggle.fromJson(json["toggle"]),
    tags: json["tags"] == null ? null : FluffyTags.fromJson(json["tags"]),
    children: json["children"] == null ? null : List<FluffyChild>.from(json["children"].map((x) => FluffyChild.fromJson(x))),
    numberInput: json["numberInput"] == null ? null : NumberInput.fromJson(json["numberInput"]),
    timePicker: json["timePicker"] == null ? null : TimePicker.fromJson(json["timePicker"]),
  );

  Map<String, dynamic> toJson() => {
    "tid": tid == null ? null : tid,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "category": category == null ? null : category,
    "style": style == null ? null : purpleStyleValues.reverse[style],
    "kind": kind == null ? null : kind,
    "enabledDefault": enabledDefault == null ? null : enabledDefault,
    "list": list == null ? null : list.toJson(),
    "select": select == null ? null : select.toJson(),
    "toggle": toggle == null ? null : toggle.toJson(),
    "tags": tags == null ? null : tags.toJson(),
    "children": children == null ? null : List<dynamic>.from(children.map((x) => x.toJson())),
    "numberInput": numberInput == null ? null : numberInput.toJson(),
    "timePicker": timePicker == null ? null : timePicker.toJson(),
  };
}

class FluffyChild {
  FluffyChild({
    this.condition,
    this.items,
  });

  FluffyCondition condition;
  List<FluffyItem> items;

  factory FluffyChild.fromJson(Map<String, dynamic> json) => FluffyChild(
    condition: json["condition"] == null ? null : FluffyCondition.fromJson(json["condition"]),
    items: json["items"] == null ? null : List<FluffyItem>.from(json["items"].map((x) => FluffyItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "condition": condition == null ? null : condition.toJson(),
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class FluffyCondition {
  FluffyCondition({
    this.conditionOperator,
    this.relation,
    this.value,
  });

  String conditionOperator;
  ConditionRelation relation;
  bool value;

  factory FluffyCondition.fromJson(Map<String, dynamic> json) => FluffyCondition(
    conditionOperator: json["operator"] == null ? null : json["operator"],
    relation: json["relation"] == null ? null : ConditionRelation.fromJson(json["relation"]),
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toJson() => {
    "operator": conditionOperator == null ? null : conditionOperator,
    "relation": relation == null ? null : relation.toJson(),
    "value": value == null ? null : value,
  };
}

class ConditionRelation {
  ConditionRelation({
    this.related,
    this.property,
    this.contains,
  });

  String related;
  String property;
  String contains;

  factory ConditionRelation.fromJson(Map<String, dynamic> json) => ConditionRelation(
    related: json["related"] == null ? null : json["related"],
    property: json["property"] == null ? null : json["property"],
    contains: json["contains"] == null ? null : json["contains"],
  );

  Map<String, dynamic> toJson() => {
    "related": related == null ? null : related,
    "property": property == null ? null : property,
    "contains": contains == null ? null : contains,
  };
}

class FluffyItem {
  FluffyItem({
    this.tid,
    this.name,
    this.description,
    this.category,
    this.style,
    this.kind,
    this.enabledDefault,
    this.tags,
  });

  String tid;
  String name;
  String description;
  String category;
  TagsStyle style;
  String kind;
  bool enabledDefault;
  PurpleTags tags;

  factory FluffyItem.fromJson(Map<String, dynamic> json) => FluffyItem(
    tid: json["tid"] == null ? null : json["tid"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    category: json["category"] == null ? null : json["category"],
    style: json["style"] == null ? null : purpleStyleValues.map[json["style"]],
    kind: json["kind"] == null ? null : json["kind"],
    enabledDefault: json["enabledDefault"] == null ? null : json["enabledDefault"],
    tags: json["tags"] == null ? null : PurpleTags.fromJson(json["tags"]),
  );

  Map<String, dynamic> toJson() => {
    "tid": tid == null ? null : tid,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "category": category == null ? null : category,
    "style": style == null ? null : purpleStyleValues.reverse[style],
    "kind": kind == null ? null : kind,
    "enabledDefault": enabledDefault == null ? null : enabledDefault,
    "tags": tags == null ? null : tags.toJson(),
  };
}

enum TagsStyle { PURPLE_BLUE, GREY_PURPLE }

final purpleStyleValues = EnumValues({
  "GREY_PURPLE": TagsStyle.GREY_PURPLE,
  "PURPLE_BLUE": TagsStyle.PURPLE_BLUE
});

class PurpleTags {
  PurpleTags({
    this.name,
    this.description,
    this.userAddable,
    this.addableLabel,
    this.placeholder,
    this.tagsDefault,
    this.limit,
  });

  String name;
  String description;
  bool userAddable;
  String addableLabel;
  String placeholder;
  List<Default> tagsDefault;
  int limit;

  factory PurpleTags.fromJson(Map<String, dynamic> json) => PurpleTags(
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    userAddable: json["userAddable"] == null ? null : json["userAddable"],
    addableLabel: json["addableLabel"] == null ? null : json["addableLabel"],
    placeholder: json["placeholder"] == null ? null : json["placeholder"],
    tagsDefault: json["default"] == null ? null : List<Default>.from(json["default"].map((x) => Default.fromJson(x))),
    limit: json["limit"] == null ? null : json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "userAddable": userAddable == null ? null : userAddable,
    "addableLabel": addableLabel == null ? null : addableLabel,
    "placeholder": placeholder == null ? null : placeholder,
    "default": tagsDefault == null ? null : List<dynamic>.from(tagsDefault.map((x) => x.toJson())),
    "limit": limit == null ? null : limit,
  };
}

class Default {
  Default({
    this.category,
    this.key,
    this.value,
    this.required,
  });

  String category;
  String key;
  String value;
  bool required;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
    category: json["category"] == null ? null : json["category"],
    key: json["key"] == null ? null : json["key"],
    value: json["value"] == null ? null : json["value"],
    required: json["required"] == null ? null : json["required"],
  );

  Map<String, dynamic> toJson() => {
    "category": category == null ? null : category,
    "key": key == null ? null : key,
    "value": value == null ? null : value,
    "required": required == null ? null : required,
  };
}

class PurpleList {
  PurpleList({
    this.options,
    this.validation,
  });

  List<ListOption> options;
  ListValidation validation;

  factory PurpleList.fromJson(Map<String, dynamic> json) => PurpleList(
    options: json["options"] == null ? null : List<ListOption>.from(json["options"].map((x) => ListOption.fromJson(x))),
    validation: json["validation"] == null ? null : ListValidation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "options": options == null ? null : List<dynamic>.from(options.map((x) => x.toJson())),
    "validation": validation == null ? null : validation.toJson(),
  };
}

class ListOption {
  ListOption({
    this.value,
    this.label,
    this.image,
    this.optionDefault,
    this.conditionalDefault,
  });

  String value;
  String label;
  ModelImage image;
  bool optionDefault;
  ConditionalDefault conditionalDefault;

  factory ListOption.fromJson(Map<String, dynamic> json) => ListOption(
    value: json["value"] == null ? null : json["value"],
    label: json["label"] == null ? null : json["label"],
    image: json["image"] == null ? null : ModelImage.fromJson(json["image"]),
    optionDefault: json["default"] == null ? null : json["default"],
    conditionalDefault: json["conditionalDefault"] == null ? null : ConditionalDefault.fromJson(json["conditionalDefault"]),
  );

  Map<String, dynamic> toJson() => {
    "value": value == null ? null : value,
    "label": label == null ? null : label,
    "image": image == null ? null : image.toJson(),
    "default": optionDefault == null ? null : optionDefault,
    "conditionalDefault": conditionalDefault == null ? null : conditionalDefault.toJson(),
  };
}

class ConditionalDefault {
  ConditionalDefault({
    this.time,
  });

  List<Time> time;

  factory ConditionalDefault.fromJson(Map<String, dynamic> json) => ConditionalDefault(
    time: json["time"] == null ? null : List<Time>.from(json["time"].map((x) => Time.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "time": time == null ? null : List<dynamic>.from(time.map((x) => x.toJson())),
  };
}

class Time {
  Time({
    this.startTime,
    this.endTime,
  });

  String startTime;
  String endTime;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    startTime: json["startTime"] == null ? null : json["startTime"],
    endTime: json["endTime"] == null ? null : json["endTime"],
  );

  Map<String, dynamic> toJson() => {
    "startTime": startTime == null ? null : startTime,
    "endTime": endTime == null ? null : endTime,
  };
}

class ListValidation {
  ListValidation({
    this.required,
  });

  RequiredClass required;

  factory ListValidation.fromJson(Map<String, dynamic> json) => ListValidation(
    required: json["required"] == null ? null : RequiredClass.fromJson(json["required"]),
  );

  Map<String, dynamic> toJson() => {
    "required": required == null ? null : required.toJson(),
  };
}

class RequiredClass {
  RequiredClass({
    this.required,
    this.copy,
  });

  bool required;
  Copy copy;

  factory RequiredClass.fromJson(Map<String, dynamic> json) => RequiredClass(
    required: json["required"] == null ? null : json["required"],
    copy: json["copy"] == null ? null : copyValues.map[json["copy"]],
  );

  Map<String, dynamic> toJson() => {
    "required": required == null ? null : required,
    "copy": copy == null ? null : copyValues.reverse[copy],
  };
}

enum Copy { EMPTY, REQUIRED_TIME, JOURNAL_ENTRY_REQUIRED }

final copyValues = EnumValues({
  "": Copy.EMPTY,
  "journal-entry_required": Copy.JOURNAL_ENTRY_REQUIRED,
  "required_time": Copy.REQUIRED_TIME
});

class NumberInput {
  NumberInput({
    this.numberInputDefault,
    this.label,
    this.validation,
  });

  dynamic numberInputDefault;
  String label;
  ListValidation validation;

  factory NumberInput.fromJson(Map<String, dynamic> json) => NumberInput(
    numberInputDefault: json["default"],
    label: json["label"] == null ? null : json["label"],
    validation: json["validation"] == null ? null : ListValidation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "default": numberInputDefault,
    "label": label == null ? null : label,
    "validation": validation == null ? null : validation.toJson(),
  };
}

class Select {
  Select({
    this.selectDefault,
    this.options,
    this.validation,
  });

  SelectOption selectDefault;
  List<SelectOption> options;
  ListValidation validation;

  factory Select.fromJson(Map<String, dynamic> json) => Select(
    selectDefault: json["default"] == null
        ? SelectOption()
        : SelectOption(value: json["default"], label: null),    options: json["options"] == null ? null : List<SelectOption>.from(json["options"].map((x) => SelectOption.fromJson(x))),
    validation: json["validation"] == null ? null : ListValidation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "default": selectDefault == null ? null : selectDefault,
    "options": options == null ? null : List<dynamic>.from(options.map((x) => x.toJson())),
    "validation": validation == null ? null : validation.toJson(),
  };
}

class SelectOption {
  SelectOption({
    this.value,
    this.label,
  });

  String value;
  String label;

  factory SelectOption.fromJson(Map<String, dynamic> json) => SelectOption(
    value: json["value"] == null ? null : json["value"],
    label: json["label"] == null ? null : json["label"],
  );

  Map<String, dynamic> toJson() => {
    "value": value == null ? null : value,
    "label": label == null ? null : label,
  };
}

class FluffyTags {
  FluffyTags({
    this.name,
    this.description,
    this.userAddable,
    this.addableLabel,
    this.placeholder,
    this.tagsDefault,
    this.autocompleteId,
    this.source,
    this.relation,
    this.limit,
  });

  String name;
  String description;
  bool userAddable;
  String addableLabel;
  String placeholder;
  List<Default> tagsDefault;
  String autocompleteId;
  String source;
  BoolListRelation relation;
  int limit;

  factory FluffyTags.fromJson(Map<String, dynamic> json) => FluffyTags(
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    userAddable: json["userAddable"] == null ? null : json["userAddable"],
    addableLabel: json["addableLabel"] == null ? null : json["addableLabel"],
    placeholder: json["placeholder"] == null ? null : json["placeholder"],
    tagsDefault: json["default"] == null ? null : List<Default>.from(json["default"].map((x) => Default.fromJson(x))),
    autocompleteId: json["autocompleteId"] == null ? null : json["autocompleteId"],
    source: json["source"] == null ? null : json["source"],
    relation: json["relation"] == null ? null : BoolListRelation.fromJson(json["relation"]),
    limit: json["limit"] == null ? null : json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "userAddable": userAddable == null ? null : userAddable,
    "addableLabel": addableLabel == null ? null : addableLabel,
    "placeholder": placeholder == null ? null : placeholder,
    "default": tagsDefault == null ? null : List<dynamic>.from(tagsDefault.map((x) => x.toJson())),
    "autocompleteId": autocompleteId == null ? null : autocompleteId,
    "source": source == null ? null : source,
    "relation": relation == null ? null : relation.toJson(),
    "limit": limit == null ? null : limit,
  };
}

class TimePicker {
  TimePicker({
    this.timePickerDefault,
    this.validation,
  });

  dynamic timePickerDefault;
  ListValidation validation;

  factory TimePicker.fromJson(Map<String, dynamic> json) => TimePicker(
    timePickerDefault: json["default"],
    validation: json["validation"] == null ? null : ListValidation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "default": timePickerDefault,
    "validation": validation == null ? null : validation.toJson(),
  };
}

class Toggle {
  Toggle({
    this.toggleDefault,
    this.options,
    this.validation,
  });

  bool toggleDefault;
  Options options;
  ListValidation validation;

  factory Toggle.fromJson(Map<String, dynamic> json) => Toggle(
    toggleDefault: json["default"] == null ? null : json["default"],
    options: json["options"] == null ? null : Options.fromJson(json["options"]),
    validation: json["validation"] == null ? null : ListValidation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "default": toggleDefault == null ? null : toggleDefault,
    "options": options == null ? null : options.toJson(),
    "validation": validation == null ? null : validation.toJson(),
  };
}

class Options {
  Options({
    this.optionsTrue,
    this.optionsFalse,
  });

  False optionsTrue;
  False optionsFalse;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
    optionsTrue: json["true"] == null ? null : False.fromJson(json["true"]),
    optionsFalse: json["false"] == null ? null : False.fromJson(json["false"]),
  );

  Map<String, dynamic> toJson() => {
    "true": optionsTrue == null ? null : optionsTrue.toJson(),
    "false": optionsFalse == null ? null : optionsFalse.toJson(),
  };
}

class False {
  False({
    this.label,
  });

  String label;

  factory False.fromJson(Map<String, dynamic> json) => False(
    label: json["label"] == null ? null : json["label"],
  );

  Map<String, dynamic> toJson() => {
    "label": label == null ? null : label,
  };
}

class ModelColor {
  ModelColor({
    this.colorDefault,
    this.options,
  });

  ColorOption colorDefault;
  List<ColorOption> options;

  factory ModelColor.fromJson(Map<String, dynamic> json) => ModelColor(
    colorDefault: json["default"] == null ? ColorOption() : json["default"],
    options: json["options"] == null ? null : List<ColorOption>.from(json["options"].map((x) => ColorOption.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "default": colorDefault,
    "options": options == null ? null : List<dynamic>.from(options.map((x) => x.toJson())),
  };
}

class ColorOption {
  ColorOption({
    this.value,
    this.description,
    this.hex,
  });

  String value;
  String description;
  String hex;

  factory ColorOption.fromJson(Map<String, dynamic> json) => ColorOption(
    value: json["value"] == null ? null : json["value"],
    description: json["description"] == null ? null : json["description"],
    hex: json["hex"] == null ? null : json["hex"],
  );

  Map<String, dynamic> toJson() => {
    "value": value == null ? null : value,
    "description": description == null ? null : description,
    "hex": hex == null ? null : hex,
  };
}

class ItemCondition {
  ItemCondition({
    this.conditionOperator,
    this.relation,
  });

  String conditionOperator;
  ConditionRelation relation;

  factory ItemCondition.fromJson(Map<String, dynamic> json) => ItemCondition(
    conditionOperator: json["operator"] == null ? null : json["operator"],
    relation: json["relation"] == null ? null : ConditionRelation.fromJson(json["relation"]),
  );

  Map<String, dynamic> toJson() => {
    "operator": conditionOperator == null ? null : conditionOperator,
    "relation": relation == null ? null : relation.toJson(),
  };
}

class FluffyList {
  FluffyList({
    this.options,
  });

  List<ListOption> options;

  factory FluffyList.fromJson(Map<String, dynamic> json) => FluffyList(
    options: json["options"] == null ? null : List<ListOption>.from(json["options"].map((x) => ListOption.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "options": options == null ? null : List<dynamic>.from(options.map((x) => x.toJson())),
  };
}

class FluffyRating {
  FluffyRating({
    this.range,
    this.ratingDefault,
    this.options,
    this.labels,
    this.validation,
  });

  int range;
  num ratingDefault;
  List<RatingOption> options;
  Labels labels;
  RatingValidation validation;

  factory FluffyRating.fromJson(Map<String, dynamic> json) => FluffyRating(
    range: json["range"] == null ? null : json["range"],
    ratingDefault: json["default"] == null ? null : json["default"],
    options: json["options"] == null ? null : List<RatingOption>.from(json["options"].map((x) => RatingOption.fromJson(x))),
    labels: json["labels"] == null ? null : Labels.fromJson(json["labels"]),
    validation: json["validation"] == null ? null : RatingValidation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "range": range == null ? null : range,
    "default": ratingDefault == null ? null : ratingDefault,
    "options": options == null ? null : List<dynamic>.from(options.map((x) => x.toJson())),
    "labels": labels == null ? null : labels.toJson(),
    "validation": validation == null ? null : validation.toJson(),
  };
}

class Labels {
  Labels({
    this.min,
    this.max,
  });

  String min;
  String max;

  factory Labels.fromJson(Map<String, dynamic> json) => Labels(
    min: json["min"] == null ? null : json["min"],
    max: json["max"] == null ? null : json["max"],
  );

  Map<String, dynamic> toJson() => {
    "min": min == null ? null : min,
    "max": max == null ? null : max,
  };
}

class RatingOption {
  RatingOption({
    this.value,
    this.label,
    this.description,
    this.image,
  });

  int value;
  String label;
  String description;
  ModelImage image;

  factory RatingOption.fromJson(Map<String, dynamic> json) => RatingOption(
    value: json["value"] == null ? null : json["value"],
    label: json["label"] == null ? null : json["label"],
    description: json["description"] == null ? null : json["description"],
    image: json["image"] == null ? null : ModelImage.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "value": value == null ? null : value,
    "label": label == null ? null : label,
    "description": description == null ? null : description,
    "image": image == null ? null : image.toJson(),
  };
}

class RatingValidation {
  RatingValidation({
    this.required,
    this.requiredCopy,
  });

  dynamic required;
  String requiredCopy;

  factory RatingValidation.fromJson(Map<String, dynamic> json) => RatingValidation(
    required: json["required"],
    requiredCopy: json["requiredCopy"] == null ? null : json["requiredCopy"],
  );

  Map<String, dynamic> toJson() => {
    "required": required,
    "requiredCopy": requiredCopy == null ? null : requiredCopy,
  };
}

enum PurpleStyle { PURPLE_BLUE, WHITE_WHITE, BLUE_BLUE }

final fluffyStyleValues = EnumValues({
  "BLUE_BLUE": PurpleStyle.BLUE_BLUE,
  "PURPLE_BLUE": PurpleStyle.PURPLE_BLUE,
  "WHITE_WHITE": PurpleStyle.WHITE_WHITE
});

class Sum {
  Sum({
    this.range,
    this.sumDefault,
    this.image,
  });

  int range;
  int sumDefault;
  ModelImage image;

  factory Sum.fromJson(Map<String, dynamic> json) => Sum(
    range: json["range"] == null ? null : json["range"],
    sumDefault: json["default"] == null ? null : json["default"],
    image: json["image"] == null ? null : ModelImage.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "range": range == null ? null : range,
    "default": sumDefault == null ? null : sumDefault,
    "image": image == null ? null : image.toJson(),
  };
}

class TextInput {
  TextInput({
    this.textInputDefault,
    this.validation,
  });

  String textInputDefault;
  TextInputValidation validation;

  factory TextInput.fromJson(Map<String, dynamic> json) => TextInput(
    textInputDefault: json["default"] == null ? null : json["default"],
    validation: json["validation"] == null ? null : TextInputValidation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "default": textInputDefault == null ? null : textInputDefault,
    "validation": validation == null ? null : validation.toJson(),
  };
}

class TextInputValidation {
  TextInputValidation({
    this.required,
    this.min,
    this.max,
  });

  RequiredClass required;
  Min min;
  Max max;

  factory TextInputValidation.fromJson(Map<String, dynamic> json) => TextInputValidation(
    required: json["required"] == null ? null : RequiredClass.fromJson(json["required"]),
    min: json["min"] == null ? null : Min.fromJson(json["min"]),
    max: json["max"] == null ? null : Max.fromJson(json["max"]),
  );

  Map<String, dynamic> toJson() => {
    "required": required == null ? null : required.toJson(),
    "min": min == null ? null : min.toJson(),
    "max": max == null ? null : max.toJson(),
  };
}

class Max {
  Max({
    this.max,
    this.copy,
  });

  int max;
  String copy;

  factory Max.fromJson(Map<String, dynamic> json) => Max(
    max: json["max"] == null ? null : json["max"],
    copy: json["copy"] == null ? null : json["copy"],
  );

  Map<String, dynamic> toJson() => {
    "max": max == null ? null : max,
    "copy": copy == null ? null : copy,
  };
}

class Min {
  Min({
    this.min,
    this.copy,
  });

  int min;
  String copy;

  factory Min.fromJson(Map<String, dynamic> json) => Min(
    min: json["min"] == null ? null : json["min"],
    copy: json["copy"] == null ? null : json["copy"],
  );

  Map<String, dynamic> toJson() => {
    "min": min == null ? null : min,
    "copy": copy == null ? null : copy,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
