import 'package:flutter/material.dart';
import 'package:smart_healthy_food/app_screens/auth.dart';

class HomePage extends StatelessWidget{
  HomePage({this.auth,this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  //Sign out method
  void _signOut() async{
    try{
      await auth.signOut();
      onSignedOut();
    }catch (e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.white
              ),
            ),
            onPressed: _signOut,
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            'Welcome',
            style: TextStyle(
              fontSize: 32.0
            ),
          ),
        ),
      ),
    );
  }
}