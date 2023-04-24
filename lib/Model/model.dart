
import 'dart:convert';

import 'package:boxigo/Model/customer_estimate_flow.dart';
import 'package:boxigo/Model/size.dart';


Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
    Model({
        required this.customerEstimateFlow,
    });

    List<CustomerEstimateFlow> customerEstimateFlow;

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        customerEstimateFlow: List<CustomerEstimateFlow>.from(json["Customer_Estimate_Flow"].map((x) => CustomerEstimateFlow.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Customer_Estimate_Flow": List<dynamic>.from(customerEstimateFlow.map((x) => x.toJson())),
    };
}

enum SelectType { SINGLE, NONE, MULTIPLE }

final selectTypeValues = EnumValues({
    "multiple": SelectType.MULTIPLE,
    "none": SelectType.NONE,
    "single": SelectType.SINGLE
});





