class ToAddress {
    ToAddress({
        required this.firstName,
        required this.lastName,
        required this.toAddress,
        required this.toLocality,
        required this.toCity,
        required this.toState,
        required this.pincode,
    });

    String firstName;
    String lastName;
    String toAddress;
    String toLocality;
    String toCity;
    String toState;
    String pincode;

    factory ToAddress.fromJson(Map<String, dynamic> json) => ToAddress(
        firstName: json["firstName"],
        lastName: json["lastName"],
        toAddress: json["toAddress"],
        toLocality: json["toLocality"],
        toCity: json["toCity"],
        toState: json["toState"],
        pincode: json["pincode"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "toAddress": toAddress,
        "toLocality": toLocality,
        "toCity": toCity,
        "toState": toState,
        "pincode": pincode,
    };
}
