import 'custom_item.dart';
import 'inventory.dart';

class Items {
    Items({
        required this.inventory,
        required this.customItems,
    });

    List<Inventory> inventory;
    CustomItems customItems;

    factory Items.fromJson(Map<String, dynamic> json) => Items(
        inventory: List<Inventory>.from(json["inventory"].map((x) => Inventory.fromJson(x))),
        customItems: CustomItems.fromJson(json["customItems"]),
    );

    Map<String, dynamic> toJson() => {
        "inventory": List<dynamic>.from(inventory.map((x) => x.toJson())),
        "customItems": customItems.toJson(),
    };
}
