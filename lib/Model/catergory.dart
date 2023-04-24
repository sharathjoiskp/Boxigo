import 'package:boxigo/Model/chid_items.dart';

class Category {
    Category({
        required this.id,
        required this.order,
        required this.name,
        required this.displayName,
        required this.items,
    });

    String id;
    int order;
    String name;
    String displayName;
    List<ChildItemElement> items;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        order: json["order "],
        name: json["name"],
        displayName: json["displayName"],
        items: List<ChildItemElement>.from(json["items"].map((x) => ChildItemElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order ": order,
        "name": name,
        "displayName": displayName,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

