import 'package:firebase_auth/firebase_auth.dart';

import '../Models/UserModel.dart';

class AuthServices
{
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  //Get logged in uid
  static String getLoggedInUid(){
    User user = _auth.currentUser;
    return user.uid;
  }

  //Get stream from firebase


  Stream<UserData> get userStream
  {
    return _auth.authStateChanges().map(getuserID);
  }



  // get user id
  UserData  getuserID(User user)
  {
    return user !=null ? UserData(uid: user.uid) : null;
  }


  //reg with email and password
  Future regWithEmailandPassword(String email , String password)
  async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email:email, password: password);
      User user = result.user;
      return getuserID(user);
    }catch(error)
    {
      print(error.toString());
      return null;
    }

  }

  //Sign in with email and pass
  Future signinWithEmailandPassword(String email , String password)
  async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return getuserID(user);
    }catch(error)
    {
      print(error.toString());
      return null;
    }
  }

//Sign out
  Future signUserout()
  async{
    await _auth.signOut();
  }
}