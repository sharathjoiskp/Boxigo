class CustomItemsItem {
    CustomItemsItem({
        required this.id,
        required this.itemHeight,
        required this.itemLength,
        required this.itemQty,
        required this.itemWidth,
        required this.itemDescription,
        required this.itemName,
    });

    String id;
    String itemHeight;
    String itemLength;
    String itemQty;
    String itemWidth;
    String itemDescription;
    String itemName;

    factory CustomItemsItem.fromJson(Map<String, dynamic> json) => CustomItemsItem(
        id: json["id"],
        itemHeight: json["item_height"],
        itemLength: json["item_length"],
        itemQty: json["item_qty"],
        itemWidth: json["item_width"],
        itemDescription: json["item_description"],
        itemName: json["item_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "item_height": itemHeight,
        "item_length": itemLength,
        "item_qty": itemQty,
        "item_width": itemWidth,
        "item_description": itemDescription,
        "item_name": itemName,
    };
}
