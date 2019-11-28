import 'package:flutter/material.dart';

class AddFood extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StateAddFood();
  }
}
class _StateAddFood extends State<AddFood>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Data'
        ),
      ),
    );
  }

}