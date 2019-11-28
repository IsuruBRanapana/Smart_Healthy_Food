import 'package:flutter/material.dart';
import 'package:smart_healthy_food/app_screens/combine.dart';
import 'package:smart_healthy_food/app_screens/login.dart';
import 'package:smart_healthy_food/app_screens/rootpage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyTabs(),
    );
  }
}
