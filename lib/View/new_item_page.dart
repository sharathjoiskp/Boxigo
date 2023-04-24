import 'package:auto_size_text/auto_size_text.dart';
import 'package:boxigo/Services/api_service.dart';
import 'package:boxigo/View/view_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../Model/box_model.dart';

class NewItemPage extends StatefulWidget {
  const NewItemPage({super.key});

  @override
  State<NewItemPage> createState() => _NewItemPageState();
}

class _NewItemPageState extends State<NewItemPage> {
  List<CustomerEstimateFlow> dataList = [];
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    print('....Fechnes function running....');
    final response = await getdata();
    setState(() {
      dataList = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              var date = dataList[index].movingOn;

              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                    height: 351,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  DateFormat.LLL().format(date),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  DateFormat.d().format(date),
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange),
                                ),
                                Text(
                                  DateFormat.Hm().format(date),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      dataList[index].fromAddress.fromCity,
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Text(
                                      dataList[index].estimateId,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: 290.0,
                                      maxHeight: 100.0,
                                    ),
                                    child: AutoSizeText(
                                      dataList[index].movingFrom,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: 300,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomIconWithName(
                                        label: '',
                                        icon: Icons.arrow_downward_sharp,
                                      ),
                                      CustomIconWithName(
                                        label: dataList[index].propertySize,
                                        icon: Icons.home,
                                      ),
                                      CustomIconWithName(
                                        label: dataList[index].totalItems,
                                        icon: Icons.download,
                                      ),
                                      CustomIconWithName(
                                        label: '12',
                                        icon: Icons.gif_box,
                                      ),
                                      CustomIconWithName(
                                        label: dataList[index].distance,
                                        icon: Icons.social_distance,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  dataList[index].toAddress.toCity,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: 290.0,
                                      maxHeight: 100.0,
                                    ),
                                    child: AutoSizeText(
                                      dataList[index].movingTo,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(ViewDetailsPage(
                                          index: index,
                                        ));
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.orange, width: 1),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'View Details',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 150,
                                      height: 40,
                                      color: Colors.orange,
                                      child: Center(
                                        child: Text(
                                          'Submit Quote',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey,
                          width: MediaQuery.of(context).size.width,
                        )
                      ],
                    )),
              );
            }));
  }
}

class CustomIconWithName extends StatelessWidget {
  CustomIconWithName({
    required this.label,
    required this.icon,
    super.key,
  });
  String label;
  var icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.orange,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
