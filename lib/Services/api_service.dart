import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';

import '../Model/box_model.dart';

// class CustomerEstimateFlowController  extends GetxController {
//   RxBool loading = false.obs;

//   Model? customer_estimate_flow_data;

//   void getCustomerFlowData() async {
//     print('..................................');
//     loading(true);
//     var response =
//         await get(Uri.parse('http://test.api.boxigo.in/sale-data/'));
//     customer_estimate_flow_data = Model.fromJson(json.decode(response.body));
//     print('..................................');
//     loading(false);
//   }
// }
Future<List<CustomerEstimateFlow>> getdata() async {
  final response =
      await get(Uri.parse('http://test.api.boxigo.in/sample-data/'));
  if (response.statusCode == 200) {
    var body = BoxModel.fromJson(json.decode(response.body));
    var data = json.decode(response.body);
    print('.....................................');
    print(body.customerEstimateFlow[0].toAddress.firstName);

    return body.customerEstimateFlow;
  } else {
    return [];
  }
}
