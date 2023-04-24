import 'model.dart';

class Meta {
    Meta({
        required this.hasType,
        required this.selectType,
        required this.hasVariation,
        required this.hasSize,
    });

    bool hasType;
    SelectType selectType;
    bool hasVariation;
    bool hasSize;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        hasType: json["hasType"],
        selectType: selectTypeValues.map[json["selectType"]]!,
        hasVariation: json["hasVariation"],
        hasSize: json["hasSize"],
    );

    Map<String, dynamic> toJson() => {
        "hasType": hasType,
        "selectType": selectTypeValues.reverse[selectType],
        "hasVariation": hasVariation,
        "hasSize": hasSize,
    };
}