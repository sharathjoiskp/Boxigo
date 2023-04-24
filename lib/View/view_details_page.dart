import 'package:auto_size_text/auto_size_text.dart';

import 'package:boxigo/View/floor_info_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../Model/box_model.dart';
import '../Services/api_service.dart';

class ViewDetailsPage extends StatefulWidget {
  ViewDetailsPage({required this.index, super.key});
  int index;

  @override
  State<ViewDetailsPage> createState() => _ViewDetailsPageState();
}

class _ViewDetailsPageState extends State<ViewDetailsPage> {
  List<CustomerEstimateFlow> itemsDataList = [];
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    print('....Fechnes function running....');
    final response = await getdata();
    setState(() {
      itemsDataList = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Center(
              child: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios_sharp,
              size: 30,
              color: Colors.grey,
            ),
          )),
          title: Text(
            'New Leads',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          actions: [
            Icon(Icons.notifications_active, color: Colors.black),
            SizedBox(
              width: 15,
            ),
            Icon(Icons.search, color: Colors.black),
            SizedBox(
              width: 15,
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.black,
            isScrollable: true,
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            padding: EdgeInsets.symmetric(horizontal: 15),
            tabs: [
              Tab(
                text: '  Items   ',
              ),
              Tab(
                text: '  Floor Info  ',
              ),
              Tab(
                text: '  Send Quote  ',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey.shade300,
                      child: ListTile(
                        title: Text(
                          'Living Room',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.red.shade400,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_up,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 550,
                      child: ListView.builder(
                          itemCount: itemsDataList[widget.index]
                              .items
                              .inventory
                              .length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    itemsDataList[widget.index]
                                        .items
                                        .inventory[index]
                                        .displayName,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 400,
                                    child: ListView.builder(
                                        itemCount: itemsDataList[widget.index]
                                            .items
                                            .inventory[index]
                                            .category
                                            .length,
                                        itemBuilder: (context, number) {
                                          return ListTile(
                                            leading: Icon(
                                              Icons.table_bar,
                                              size: 30,
                                              color: Colors.black,
                                            ),
                                            title: Text(
                                              itemsDataList[widget.index]
                                                  .items
                                                  .inventory[index]
                                                  .category[number]
                                                  .displayName,
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            subtitle: SizedBox(
                                              height: 20,
                                              width: 50,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: itemsDataList[
                                                          widget.index]
                                                      .items
                                                      .inventory[index]
                                                      .category[number]
                                                      .items
                                                      .length,
                                                  itemBuilder: (context, num) {
                                                    if (itemsDataList[
                                                            widget.index]
                                                        .items
                                                        .inventory[index]
                                                        .category[number]
                                                        .items[num]
                                                        .type
                                                        .isEmpty) {
                                                      return Text('');
                                                    } else {
                                                      return Text(
                                                        itemsDataList[widget
                                                                        .index]
                                                                    .items
                                                                    .inventory[
                                                                        index]
                                                                    .category[
                                                                        number]
                                                                    .items[num]
                                                                    .type[0]
                                                                    .selected ==
                                                              true
                                                            ? '${itemsDataList[widget.index].items.inventory[index].category[number].items[num].type[0].option}    '
                                                            : '',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      );
                                                    }
                                                  }),
                                            ),
                                            trailing: Text(
                                              itemsDataList[widget.index]
                                                  .items
                                                  .inventory[index]
                                                  .category[number]
                                                  .items
                                                  .length
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    // ListTile(
                    //   leading: Icon(
                    //     Icons.business,
                    //     size: 30,
                    //     color: Colors.black,
                    //   ),
                    //   title: Text(
                    //     'L Type Sofa',
                    //     style: TextStyle(
                    //       fontSize: 25,
                    //       color: Colors.grey,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                    //   subtitle: Text(
                    //     'Small | Leather',
                    //     style: TextStyle(
                    //       fontSize: 20,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    //   trailing: Text(
                    //     '1',
                    //     style: TextStyle(
                    //       fontSize: 30,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    // ),
                    // ListTile(
                    //   leading: Icon(
                    //     Icons.tv,
                    //     size: 30,
                    //     color: Colors.black,
                    //   ),
                    //   title: Text(
                    //     'Single Seater Sofa',
                    //     style: TextStyle(
                    //       fontSize: 25,
                    //       color: Colors.grey,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                    //   subtitle: Text(
                    //     'Large | Leather',
                    //     style: TextStyle(
                    //       fontSize: 20,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    //   trailing: Text(
                    //     '1',
                    //     style: TextStyle(
                    //       fontSize: 30,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    // ),
                    // ListTile(
                    //   leading: Icon(
                    //     Icons.table_bar,
                    //     size: 30,
                    //     color: Colors.black,
                    //   ),
                    //   title: Text(
                    //     'Tea Table',
                    //     style: TextStyle(
                    //       fontSize: 25,
                    //       color: Colors.grey,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                    //   subtitle: Text(
                    //     'Medium | Wooden',
                    //     style: TextStyle(
                    //       fontSize: 20,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    //   trailing: Text(
                    //     '1',
                    //     style: TextStyle(
                    //       fontSize: 30,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    // ),
                    // ListTile(
                    //   leading: Icon(
                    //     Icons.tv_rounded,
                    //     size: 30,
                    //     color: Colors.black,
                    //   ),
                    //   title: Text(
                    //     'Entertainment Unit',
                    //     style: TextStyle(
                    //       fontSize: 25,
                    //       color: Colors.grey,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                    //   subtitle: Text(
                    //     'Medium | Wooden',
                    //     style: TextStyle(
                    //       fontSize: 20,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    //   trailing: Text(
                    //     '1',
                    //     style: TextStyle(
                    //       fontSize: 30,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    // ),
                    // ListTile(
                    //   leading: Icon(
                    //     Icons.business,
                    //     size: 30,
                    //     color: Colors.black,
                    //   ),
                    //   title: Text(
                    //     'L Type Sofa',
                    //     style: TextStyle(
                    //       fontSize: 25,
                    //       color: Colors.grey,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                    //   subtitle: Text(
                    //     'Small | Leather',
                    //     style: TextStyle(
                    //       fontSize: 20,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    //   trailing: Text(
                    //     '1',
                    //     style: TextStyle(
                    //       fontSize: 30,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    // ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey.shade300,
                      child: ListTile(
                        title: Text(
                          'Bed Room',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.red.shade400,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey.shade300,
                      child: ListTile(
                        title: Text(
                          'Custom Items',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.red.shade400,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                          itemCount: itemsDataList[widget.index]
                              .items
                              .customItems
                              .items
                              .length,
                          itemBuilder: (context, index) {
                            String units = itemsDataList[widget.index]
                                .items
                                .customItems
                                .units;
                            var item = itemsDataList[widget.index]
                                .items
                                .customItems
                                .items[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${item.itemName}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: 290.0,
                                        maxHeight: 100.0,
                                      ),
                                      child: AutoSizeText(
                                        item.itemDescription,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'L :${item.itemLength}  $units',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'W :${item.itemWidth}  $units',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'H :${item.itemHeight}  $units',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.grey,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            FloorInfoPage(
              new_distance: itemsDataList[widget.index].newParkingDistance,
              new_elevator: itemsDataList[widget.index].newElevatorAvailability,
              new_floor_no: itemsDataList[widget.index].newFloorNo,
              new_packing: itemsDataList[widget.index].packingService,
              new_addtionalDetails:
                  itemsDataList[widget.index].newHouseAdditionalInfo,
              old_distance: itemsDataList[widget.index].oldParkingDistance,
              old_elevator: itemsDataList[widget.index].oldElevatorAvailability,
              old_floor_no: itemsDataList[widget.index].oldFloorNo,
              old_packing: itemsDataList[widget.index].unpackingService,
              old_addtionalDetails:
                  itemsDataList[widget.index].oldHouseAdditionalInfo,
            ),
            Center(
              child: Text(
                'Send Quote',
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          showUnselectedLabels: true,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
          selectedLabelStyle: TextStyle(
              color: Colors.orange, fontSize: 16, fontWeight: FontWeight.w600),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.filter_alt_sharp),
              label: 'Leads',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Task',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart_outline_sharp),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }
}
