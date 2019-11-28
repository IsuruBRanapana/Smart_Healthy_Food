import 'package:flutter/material.dart';
import 'package:smart_healthy_food/app_screens/login.dart';
import 'package:smart_healthy_food/app_screens/usermanagement.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

enum FormType { register1, register2 }

class _SignUpState extends State<SignUp> {
  FormType _formType = FormType.register1;
  UserManagement userObj = new UserManagement();
  var _formKey = GlobalKey<FormState>();


// move to first registration form
  void moveToRegister1() {
    _formKey.currentState.reset();
    setState(() {
      _formType = FormType.register1;
    });
  }


// move to second registration form
  void moveToRegister2() {
    _formKey.currentState.reset();
    setState(() {
      _formType = FormType.register2;
    });
  }


  bool _isHiddenPw = true;
  bool _isHiddenCPw = true;

  void _visiblePw() {
    setState(() {
      _isHiddenPw = !_isHiddenPw;
      _isHiddenCPw = _isHiddenCPw;
    });
  }

  void _visibleCPw() {
    setState(() {
      _isHiddenPw = _isHiddenPw;
      _isHiddenCPw = !_isHiddenCPw;
    });
  }

  
  double _minimumPadding = 5.0;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();
  TextEditingController heightController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  TextEditingController weightController = TextEditingController();

  String firstname;
  String lastname;
  String useremail;
  String phonenumber;
  String userHeight;
  String age;
  String userWeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: signUpForm(),
    );
  }

  //sign up form
  Widget signUpForm() {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    // first registration form
    if (_formType == FormType.register1) {
      return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(_minimumPadding * 3),
          child: ListView(
            children: <Widget>[
              //First Name
              nameFieldSet(firstNameController, 'Enter the First Name',
                  'First Name', 'John'),

              // Last Name
              nameFieldSet(lastNameController, 'Enter the Last Name',
                  'Last Name', 'Perera'),
              //E mail
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  controller: emailController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter the E mail Address";
                    }
                    useremail = emailController.text;
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: textStyle,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    labelStyle: Theme.of(context).textTheme.body1,
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                    hintText: "Johnperera@gmail.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),

              //Phone Number
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  controller: phoneNumberController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter Your Phone Number";
                    }
                    phonenumber = phoneNumberController.text;
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  style: textStyle,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    prefixIcon: Icon(Icons.phone_iphone),
                    labelStyle: Theme.of(context).textTheme.body1,
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                    hintText: "0123456789",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),

              //Password
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  controller: passwordController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter the Password";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  style: textStyle,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      onPressed: _visiblePw,
                      icon: _isHiddenPw
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                    labelText: "Password",
                    labelStyle: Theme.of(context).textTheme.body1,
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  obscureText: _isHiddenPw,
                ),
              ),

              //confirm Password
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  controller: conPasswordController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter the Password";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  style: textStyle,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      onPressed: _visibleCPw,
                      icon: _isHiddenCPw
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                    labelText: "Confirm Password",
                    labelStyle: Theme.of(context).textTheme.body1,
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  obscureText: _isHiddenCPw,
                ),
              ),

              //next page button for sevond registration form
              Container(
                height: 70.0,
                padding: EdgeInsets.only(
                    left: 65.0, right: 65.0, top: 10.0, bottom: 10.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      if (passwordController.text ==
                          conPasswordController.text) {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);

                        //Navigator.pop(context);
                        moveToRegister2();
                        userObj.addData({
                          'firstname': this.firstname,
                          'lastname': this.lastname,
                          'email': this.useremail,
                          'phonenumber': this.phonenumber
                        });
                        //todo: add wrong password
                      } else {
                        //Todo: add password not match
                      }
                    }
                    setState(() {
                      //TODO : import
                    });
                  },
                  color: Colors.green[400],
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: ListTile(
                      leading: SizedBox(
                        width: 20.0,
                      ),
                      title: Text(
                        'Next',
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              //TODO: Add drop down to select farmer or expert
            ],
          ),
        ),
      );
    } else {

      // second registration form
      return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(_minimumPadding*3),
          child: ListView(
            children: <Widget>[

              //age
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  controller: ageController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter Your Age";
                    }
                    age = ageController.text;
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  decoration: InputDecoration(
                    labelText: "Age in Years",
                    prefixIcon: Icon(Icons.arrow_upward),
                    labelStyle: Theme.of(context).textTheme.body1,
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                    hintText: "17",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              
              //Height
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  controller: heightController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter Your Height";
                    }
                    userHeight = heightController.text;
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  decoration: InputDecoration(
                    labelText: "Height in cm",
                    prefixIcon: Icon(Icons.arrow_upward),
                    labelStyle: Theme.of(context).textTheme.body1,
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                    hintText: "178",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),

              //Weight
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  controller: weightController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter Your Weight";
                    }
                    userWeight = weightController.text;
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  decoration: InputDecoration(
                    labelText: "Weight in kg",
                    prefixIcon: Icon(Icons.blur_circular),
                    labelStyle: Theme.of(context).textTheme.body1,
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                    hintText: "50",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),

              //button for back button
              Container(
                height: 70.0,
                padding: EdgeInsets.only(
                    left: 65.0, right: 65.0, top: 10.0, bottom: 10.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  onPressed: () async {
                    moveToRegister1();
                  },
                  color: Colors.green[400],
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: ListTile(
                      leading: SizedBox(
                        width: 20.0,
                      ),
                      title: Text(
                        'back',
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              //button for submit
              Container(
                height: 70.0,
                padding: EdgeInsets.only(
                    left: 65.0, right: 65.0, top: 10.0, bottom: 10.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      userObj.addMeasureData({
                        'Age':this.age,
                        'Height':this.userHeight,
                        'Weight':this.userHeight
                      });
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    }
                  },
                  color: Colors.green[400],
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: ListTile(
                      leading: SizedBox(
                        width: 20.0,
                      ),
                      title: Text(
                        'Submit',
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

            ],),
        ),
        );
    }
  }


  // method for first name and last name
  Widget nameFieldSet(
      TextEditingController txtController, String retEmpty, String lblText,
      [String hintTxt]) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Padding(
      padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
      child: TextFormField(
        controller: txtController,
        validator: (String value) {
          if (value.isEmpty) {
            return retEmpty;
          }
          if (txtController == firstNameController) {
            firstname = firstNameController.text;
          } else {
            lastname = lastNameController.text;
          }
          return null;
        },
        keyboardType: TextInputType.text,
        style: textStyle,
        decoration: InputDecoration(
          labelText: lblText,
          prefixIcon: Icon(Icons.account_circle),
          labelStyle: Theme.of(context).textTheme.body1,
          errorStyle: TextStyle(
            color: Colors.redAccent,
            fontSize: 15.0,
          ),
          hintText: hintTxt,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
