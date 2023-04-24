class Size {
    Size({
        required this.option,
        required this.tooltip,
        required this.selected,
    });

    Option option;
    Tooltip tooltip;
    bool selected;

    factory Size.fromJson(Map<String, dynamic> json) => Size(
        option: optionValues.map[json["option"]]!,
        tooltip: tooltipValues.map[json["tooltip"]]!,
        selected: json["selected"],
    );

    Map<String, dynamic> toJson() => {
        "option": optionValues.reverse[option],
        "tooltip": tooltipValues.reverse[tooltip],
        "selected": selected,
    };
}

enum Option { SMALL, MEDIUM, LARGE }

final optionValues = EnumValues({
    "large": Option.LARGE,
    "medium": Option.MEDIUM,
    "small": Option.SMALL
});

enum Tooltip { THE_2_FT_2_FT, THE_3_FT_3_FT, THE_4_FT_4_FT, XL, XXL, XXXL, THE_4_FT, THE_46_FT, THE_6_FT }

final tooltipValues = EnumValues({
    "2ft * 2ft": Tooltip.THE_2_FT_2_FT,
    "3ft * 3ft": Tooltip.THE_3_FT_3_FT,
    "4-6 ft": Tooltip.THE_46_FT,
    "<4 ft": Tooltip.THE_4_FT,
    "4ft * 4ft": Tooltip.THE_4_FT_4_FT,
    ">6 ft": Tooltip.THE_6_FT,
    "XL": Tooltip.XL,
    "XXL": Tooltip.XXL,
    "XXXL": Tooltip.XXXL
});


class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
