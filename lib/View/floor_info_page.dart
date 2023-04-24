import 'package:flutter/material.dart';

class FloorInfoPage extends StatefulWidget {
  FloorInfoPage(
      {required this.new_distance,
      required this.new_elevator,
      required this.new_floor_no,
      required this.new_packing,
      required this.new_addtionalDetails,
      required this.old_distance,
      required this.old_elevator,
      required this.old_floor_no,
      required this.old_packing,
      required this.old_addtionalDetails,
      super.key});
  String old_floor_no;
  String old_packing;
  String old_elevator;
  String old_distance;
  String old_addtionalDetails;
  String new_floor_no;
  String new_packing;
  String new_elevator;
  String new_distance;
  String new_addtionalDetails;
  @override
  State<FloorInfoPage> createState() => _FloorInfoPageState();
}

class _FloorInfoPageState extends State<FloorInfoPage> {
  var fontStyle = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w300,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Custom_home_info(
            fontStyle: fontStyle,
            heading: 'Existing house deatils',
            floor_no: widget.old_floor_no,
            packing: widget.old_packing,
            elevator: widget.old_elevator,
            distance: widget.old_distance,
            addtinalDetails: widget.old_addtionalDetails,
          ),
          Custom_home_info(
            fontStyle: fontStyle,
            heading: 'New house details',
            floor_no: widget.new_floor_no,
            packing: widget.new_packing,
            elevator: widget.new_elevator,
            distance: widget.new_distance,
            addtinalDetails: widget.new_addtionalDetails,
          ),
        ],
      ),
    );
  }
}

class Custom_home_info extends StatelessWidget {
  var trailStyle = TextStyle(
    fontSize: 22,
    color: Colors.black,
    fontWeight: FontWeight.w900,
  );
  Custom_home_info({
    super.key,
    required this.fontStyle,
    required this.heading,
    required this.floor_no,
    required this.elevator,
    required this.packing,
    required this.distance,
    required this.addtinalDetails,
  });

  final TextStyle fontStyle;
  String floor_no;
  String heading;
  String elevator;
  String packing;
  String distance;
  String addtinalDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade300,
            child: ListTile(
              title: Text(
                heading,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red.shade400,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: ListTile(
            title: Text('Floor No.', style: fontStyle),
            trailing: Text(floor_no, style: trailStyle),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: ListTile(
            title: Text('Elvator Available', style: fontStyle),
            trailing: Text(elevator, style: trailStyle),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: ListTile(
            title: Text('Packing Required', style: fontStyle),
            trailing: Text(packing, style: trailStyle),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: ListTile(
            title: Text('Distance from door to truck', style: fontStyle),
            trailing: Text('$distance mtrs', style: trailStyle),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: ListTile(
            title: Text('Additional Information', style: fontStyle),
            subtitle: Text(
              addtinalDetails,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
