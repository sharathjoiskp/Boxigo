import 'custom_item_item.dart';

class CustomItems {
    CustomItems({
        required this.units,
        required this.items,
    });

    String units;
    List<CustomItemsItem> items;

    factory CustomItems.fromJson(Map<String, dynamic> json) => CustomItems(
        units: json["units"],
        items: List<CustomItemsItem>.from(json["items"].map((x) => CustomItemsItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "units": units,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}