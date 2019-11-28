import 'package:smart_healthy_food/app_screens/auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_healthy_food/app_screens/home.dart' as Home;
import 'package:smart_healthy_food/app_screens/view_food.dart' as Food;
import 'package:smart_healthy_food/app_screens/aboutme.dart' as Profile;

class MyTabs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StateMyTabs();
  }
}

class _StateMyTabs extends State<MyTabs> with SingleTickerProviderStateMixin{
  TabController controller;

  @override
  void initState(){
    super.initState();
    controller=TabController(vsync: this,length: 3);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        color: Colors.green[400],
        child: TabBar(
          controller: controller,
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.fastfood),
            ),
            Tab(
              icon: Icon(Icons.person),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          Home.HomePage(),
          Food.ViewFood(),
          Profile.Profile()
        ],
      ),
    );
  }
}
