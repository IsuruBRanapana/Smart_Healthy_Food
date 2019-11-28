import 'package:flutter/material.dart';

class ViewFood extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StateViewFood();
  }
}

class _StateViewFood extends State<ViewFood>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Food'),
      ),
    );
  }
}