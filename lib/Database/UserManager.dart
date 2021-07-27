import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/UserModel.dart';

class UserManager{

  static CollectionReference users = FirebaseFirestore.instance.collection("Users");

  Future uploadData(String uid,String name , String email ,String address , String phonenumber)
  async{
    return users.doc(uid).set(
      {
        "uid" : uid,
        "username" : name,
        "email" : email,
        "address" : address,
        "phonenumber" : phonenumber,
        // by default any signup is a user, change to "admin" in firebase
        "level": "user",
      }
    );
  }

  static Future<UserData> getUser(String uid) async{
    DocumentSnapshot user = await users.doc(uid).get();
    return UserData(
      uid: user['uid'],
      userName: user['username'],
      email: user['email'],
      address: user['address'],
      phoneNumber: user['phonenumber'],
    );
  }

  static Future<bool> editUser({String uid, String username, String address, String phoneNumber}){
    users.doc(uid).update({
      "username": username,
      "address": address,
      "phonenumber": phoneNumber,
    });
  }

}