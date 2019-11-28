import 'package:flutter/material.dart';
import 'package:smart_healthy_food/app_screens/auth.dart';
import 'package:smart_healthy_food/app_screens/combine.dart';
import 'package:smart_healthy_food/app_screens/signup.dart';

class LoginPage extends StatefulWidget{
  LoginPage({this.auth,this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>{
  var _formKey=GlobalKey<FormState>();
  double _minimumPadding = 5.0;
  String _email;
  String _password;

  bool _isHiddenPw = true;
  bool _isHiddenCPw = true;

  void _visiblePw() {
    setState(() {
      _isHiddenPw = !_isHiddenPw;
      _isHiddenCPw = _isHiddenCPw;
    });
  }

  //validate the form
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  //submit the form
  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        String userId=await widget.auth.signInWithEmailAndPassword(_email, _password);
        print('$userId');
        widget.onSignedIn(); 
      } catch (e) {
        print(e); 
      }
    }
  }


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: logInForm(),
    );
  }


  //log in form
  Widget logInForm(){
    TextStyle textStyle=Theme.of(context).textTheme.title;
    return Container(
      alignment: Alignment.center,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(
            right: _minimumPadding*3,
            left: _minimumPadding * 3,
            top: _minimumPadding * 3,
          ),
          child: ListView(
            children: <Widget>[
              
              //logo
              Container(
                height: 300.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/logo.png'))
                ),
              ),

              //E mail text field
              Padding(
                padding: EdgeInsets.only(bottom: _minimumPadding),
                child: TextFormField(
                  controller: emailController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter the E mail Address";
                    }
                    _email=emailController.text;
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

              //Password text feild
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  controller: passwordController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter the Password";
                    }
                    _password=passwordController.text;
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

              //login button
              Container(
                height: 70.0,
                padding: EdgeInsets.only(left: 65.0,right: 65.0,top: 10.0, bottom: 10.0),
                child: OutlineButton(
                  splashColor: Colors.green[400],
                  onPressed: () async{
                    if(emailController.text.isEmpty||passwordController.text.isEmpty){
                      print('Enter these');
                      return;
                    }else{
                      String userID=await AuthService().signInWithEmailAndPassword(emailController.text, passwordController.text);
                      if(userID!=null){

                        Navigator.pop(context);
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => MyTabs()
                          )
                        );
                        
                      }
                    
                      //TODO: Set State
                    }
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  highlightElevation: 0,
                  borderSide: BorderSide(color: Colors.green[400]),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              //Or text
              Center(
                child: Text(
                  'OR',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600
                    ),
                ),
              ),


              //sign up with google button
              Container(
                padding: EdgeInsets.only(top: 10.0),
                color: Colors.white,
                child: Center(
                 child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _signInButton(),
                    ],
                  ),
                ),
              ),

              //Sized box
              SizedBox(
                height: 20.0,
              ),
              //sign up gesture detector
              Center(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 80.0,
                    ),
                    Text(
                      "Don't Have Account ? ",
                      style: TextStyle(
                        color: Colors.green[400],
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.green[400],
                          fontSize: 16.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    )
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  //sign in buttons
  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () async{
        bool res=await AuthService().signInWithGoogle();
        if(!res){
          print('Error Log in with google');
        }else{
          //TODO : implement to navigator to home page
        }
        setState(() {
         //todo : set state 
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

