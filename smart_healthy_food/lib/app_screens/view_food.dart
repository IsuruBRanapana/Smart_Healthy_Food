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
      body: ListView(
        children: <Widget>[
          //Main canteen
          OutlineButton(
            child: Text(
              'Main Cafeteria',
              style: TextStyle(fontSize: 25.0),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
            splashColor: Colors.green[400],
            onPressed: (){

            },
          ),

          //Upper canteen
          ListTile(
            title: Text('Upper Canteen'),
            onTap: (){

            },
          ),

          //Nishmi Canteen
          ListTile(
            title: Text('Nishmi Canteen'),
            onTap: (){

            },
          ),

          //walawa canteen
          ListTile(
            title: Text('Walawa Canteen'),
            onTap: (){

            },
          ),
        ],
      ),
    );
  }
}