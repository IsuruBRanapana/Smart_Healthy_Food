import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserManagement{
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

// add data to firebase database
  Future<void> addData(userData) async{
    if(isLoggedIn()){
      Firestore.instance.collection('users').add(userData).catchError((e){
        print(e);
      });
    }else{
      print('You Need to log in');
    }
  }

  Future<void> addMeasureData(userMeasureData) async{
    if(isLoggedIn()){
      Firestore.instance.collection('measure').add(userMeasureData).catchError((e){
        print(e);
      });
    }else{
      print('You Need to log in');
    }
  }

  Future<void> addFoodDataToMatta(mattaData) async{
    if(isLoggedIn()){
      Firestore.instance.collection('Matta').add(mattaData).catchError((e){
        print(e);
      });
    }else{
      print('You Need to log in');
    }
  }

  getDataFromMatta() async{
    return await Firestore.instance.collection('Matta').getDocuments();
  }
}