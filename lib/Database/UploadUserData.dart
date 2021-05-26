import 'package:cloud_firestore/cloud_firestore.dart';

class UploadUserData{

  CollectionReference users = FirebaseFirestore.instance.collection("Users");

  Future uploadData(String uid,String name , String email ,String address , String phonenumber)
  async{
    return users.doc(uid).set(
      {
        "uid" : uid,
        "username" : name,
        "email" : email,
        "address" : address,
        "phonenumber" : phonenumber
      }
    );

  }

}