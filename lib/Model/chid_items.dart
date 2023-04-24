import 'meta.dart';
import 'model.dart';
import 'size.dart';

class ChildItemElement {
    ChildItemElement({
        this.size,
        this.childItems,
        this.typeOptions,
        required this.meta,
        required this.uniquieId,
        required this.name,
        required this.displayName,
        required this.order,
        this.nameOld,
        required this.qty,
        required this.type,
        required this.id,
    });

    List<Size>? size;
    List<ChildItemElement>? childItems;
    String? typeOptions;
    Meta meta;
    int uniquieId;
    String name;
    String displayName;
    int order;
    String? nameOld;
    int qty;
    List<Type> type;
    String id;

    factory ChildItemElement.fromJson(Map<String, dynamic> json) => ChildItemElement(
        size: json["size"] == null ? [] : List<Size>.from(json["size"]!.map((x) => Size.fromJson(x))),
        childItems: json["childItems"] == null ? [] : List<ChildItemElement>.from(json["childItems"]!.map((x) => ChildItemElement.fromJson(x))),
        typeOptions: json["typeOptions"],
        meta: Meta.fromJson(json["meta"]),
        uniquieId: json["uniquieId"],
        name: json["name"],
        displayName: json["displayName"],
        order: json["order"],
        nameOld: json["name_old"],
        qty: json["qty"],
        type: List<Type>.from(json["type"].map((x) => Type.fromJson(x))),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "size": size == null ? [] : List<dynamic>.from(size!.map((x) => x.toJson())),
        "childItems": childItems == null ? [] : List<dynamic>.from(childItems!.map((x) => x.toJson())),
        "typeOptions": typeOptions,
        "meta": meta.toJson(),
        "uniquieId": uniquieId,
        "name": name,
        "displayName": displayName,
        "order": order,
        "name_old": nameOld,
        "qty": qty,
        "type": List<dynamic>.from(type.map((x) => x.toJson())),
        "id": id,
    };
}

class Type {
    Type({
        required this.id,
        required this.option,
        required this.selected,
    });

    String id;
    String option;
    bool selected;

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        option: json["option"],
        selected: json["selected"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "option": option,
        "selected": selected,
    };
}