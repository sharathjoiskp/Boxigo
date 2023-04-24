
import 'package:boxigo/Model/to_address.dart';

import 'from_address.dart';
import 'main_item.dart';

class CustomerEstimateFlow {
    CustomerEstimateFlow({
        required this.estimateId,
        required this.userId,
        required this.movingFrom,
        required this.movingTo,
        required this.movingOn,
        required this.distance,
        required this.propertySize,
        required this.oldFloorNo,
        required this.newFloorNo,
        required this.oldElevatorAvailability,
        required this.newElevatorAvailability,
        required this.oldParkingDistance,
        required this.newParkingDistance,
        required this.unpackingService,
        required this.packingService,
        required this.items,
        required this.oldHouseAdditionalInfo,
        required this.newHouseAdditionalInfo,
        required this.totalItems,
        required this.status,
        required this.orderDate,
        required this.dateCreated,
        this.dateOfComplete,
        this.dateOfCancel,
        required this.estimateStatus,
        required this.customStatus,
        this.estimateComparison,
        this.estimateAmount,
        required this.successfulPayments,
        required this.orderReviewed,
        required this.callBack,
        required this.moveDateFlexible,
        required this.fromAddress,
        required this.toAddress,
        required this.serviceType,
        this.storageItems,
    });

    String estimateId;
    String userId;
    String movingFrom;
    String movingTo;
    DateTime movingOn;
    String distance;
    String propertySize;
    String oldFloorNo;
    String newFloorNo;
    String oldElevatorAvailability;
    String newElevatorAvailability;
    String oldParkingDistance;
    String newParkingDistance;
    String unpackingService;
    String packingService;
    Items items;
    String oldHouseAdditionalInfo;
    String newHouseAdditionalInfo;
    String totalItems;
    String status;
    DateTime orderDate;
    DateTime dateCreated;
    dynamic dateOfComplete;
    dynamic dateOfCancel;
    String estimateStatus;
    String customStatus;
    dynamic estimateComparison;
    dynamic estimateAmount;
    List<dynamic> successfulPayments;
    String orderReviewed;
    String callBack;
    String moveDateFlexible;
    FromAddress fromAddress;
    ToAddress toAddress;
    String serviceType;
    dynamic storageItems;

    factory CustomerEstimateFlow.fromJson(Map<String, dynamic> json) => CustomerEstimateFlow(
        estimateId: json["estimate_id"],
        userId: json["user_id"],
        movingFrom: json["moving_from"],
        movingTo: json["moving_to"],
        movingOn: DateTime.parse(json["moving_on"]),
        distance: json["distance"],
        propertySize: json["property_size"],
        oldFloorNo: json["old_floor_no"],
        newFloorNo: json["new_floor_no"],
        oldElevatorAvailability: json["old_elevator_availability"],
        newElevatorAvailability: json["new_elevator_availability"],
        oldParkingDistance: json["old_parking_distance"],
        newParkingDistance: json["new_parking_distance"],
        unpackingService: json["unpacking_service"],
        packingService: json["packing_service"],
        items: Items.fromJson(json["items"]),
        oldHouseAdditionalInfo: json["old_house_additional_info"],
        newHouseAdditionalInfo: json["new_house_additional_info"],
        totalItems: json["total_items"],
        status: json["status"],
        orderDate: DateTime.parse(json["order_date"]),
        dateCreated: DateTime.parse(json["date_created"]),
        dateOfComplete: json["date_of_complete"],
        dateOfCancel: json["date_of_cancel"],
        estimateStatus: json["estimate_status"],
        customStatus: json["custom_status"],
        estimateComparison: json["estimate_comparison"],
        estimateAmount: json["estimateAmount"],
        successfulPayments: List<dynamic>.from(json["successfulPayments"].map((x) => x)),
        orderReviewed: json["order_reviewed"],
        callBack: json["call_back"],
        moveDateFlexible: json["move_date_flexible"],
        fromAddress: FromAddress.fromJson(json["from_address"]),
        toAddress: ToAddress.fromJson(json["to_address"]),
        serviceType: json["service_type"],
        storageItems: json["storage_items"],
    );

    Map<String, dynamic> toJson() => {
        "estimate_id": estimateId,
        "user_id": userId,
        "moving_from": movingFrom,
        "moving_to": movingTo,
        "moving_on": movingOn.toIso8601String(),
        "distance": distance,
        "property_size": propertySize,
        "old_floor_no": oldFloorNo,
        "new_floor_no": newFloorNo,
        "old_elevator_availability": oldElevatorAvailability,
        "new_elevator_availability": newElevatorAvailability,
        "old_parking_distance": oldParkingDistance,
        "new_parking_distance": newParkingDistance,
        "unpacking_service": unpackingService,
        "packing_service": packingService,
        "items": items.toJson(),
        "old_house_additional_info": oldHouseAdditionalInfo,
        "new_house_additional_info": newHouseAdditionalInfo,
        "total_items": totalItems,
        "status": status,
        "order_date": orderDate.toIso8601String(),
        "date_created": dateCreated.toIso8601String(),
        "date_of_complete": dateOfComplete,
        "date_of_cancel": dateOfCancel,
        "estimate_status": estimateStatus,
        "custom_status": customStatus,
        "estimate_comparison": estimateComparison,
        "estimateAmount": estimateAmount,
        "successfulPayments": List<dynamic>.from(successfulPayments.map((x) => x)),
        "order_reviewed": orderReviewed,
        "call_back": callBack,
        "move_date_flexible": moveDateFlexible,
        "from_address": fromAddress.toJson(),
        "to_address": toAddress.toJson(),
        "service_type": serviceType,
        "storage_items": storageItems,
    };
}
