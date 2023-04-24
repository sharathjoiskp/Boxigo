class FromAddress {
    FromAddress({
        required this.firstName,
        required this.lastName,
        required this.fromAddress,
        required this.fromLocality,
        required this.fromCity,
        required this.fromState,
        required this.pincode,
    });

    String firstName;
    String lastName;
    String fromAddress;
    String fromLocality;
    String fromCity;
    String fromState;
    String pincode;

    factory FromAddress.fromJson(Map<String, dynamic> json) => FromAddress(
        firstName: json["firstName"],
        lastName: json["lastName"],
        fromAddress: json["fromAddress"],
        fromLocality: json["fromLocality"],
        fromCity: json["fromCity"],
        fromState: json["fromState"],
        pincode: json["pincode"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "fromAddress": fromAddress,
        "fromLocality": fromLocality,
        "fromCity": fromCity,
        "fromState": fromState,
        "pincode": pincode,
    };
}

