import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth{
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<bool> signInWithGoogle();
  Future <String> currentUser();
}

class AuthService implements BaseAuth{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  

  //sign in with email
  Future<String> signInWithEmailAndPassword(String email, String password) async {
    AuthResult result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  //sign in with anon
  Future<String> signInWithCredential(){
    //Todo: implement this method
  }

  //sign in with google
  Future<bool> signInWithGoogle() async{
    try{
      GoogleSignIn googleSignIn=GoogleSignIn();
      GoogleSignInAccount account=await googleSignIn.signIn();
      if(account==null){
        return false;
      }else{
        AuthResult res=await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
          idToken: (await account.authentication).idToken,
          accessToken: (await account.authentication).accessToken
        )
        );
        if(res.user==null){
          return false;
        }else{
          return true;
        }
      }
    }catch (e){
      print('error logging with google');
      return false;
    }
  }

  //current user
  Future <String> currentUser() async{
    FirebaseUser user =await FirebaseAuth.instance.currentUser();
    return user.uid;
  }
  
  //sign out
  Future<void> signOut() async{
    return FirebaseAuth.instance.signOut();
  }  
}

