

import 'package:boxigo/View/new_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var global_style = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
    );
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Center(
            child: Text(
              'C',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          ),
          title: Text(
            'Leads',
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
              padding: EdgeInsets.symmetric(horizontal: 25),
              tabs: [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'New',
                ),
                Tab(
                  text: 'Follow Up',
                ),
                Tab(
                  text: 'Booked',
                ),
                Tab(
                  text: 'In Track',
                )
              ]),
        ),
        body: TabBarView(children: [
          Center(
            child: Text('All', style: global_style),
          ),
          NewItemPage(),
          Center(
            child: Text('Follow Up', style: global_style),
          ),
          Center(
            child: Text('Booked', style: global_style),
          ),
          Center(
            child: Text('In track', style: global_style),
          ),
        ]),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
            showUnselectedLabels: true,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
            selectedLabelStyle: TextStyle(
                color: Colors.orange,
                fontSize: 16,
                fontWeight: FontWeight.w600),
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
            ]),
      ),
    );
  }
}
