import 'package:flutter/material.dart';
import 'package:market_net/UserScreens/UserProfile.dart';

AppBar CustomAppBar(context, {@required String title}) {
  return AppBar(
    title: Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
    backgroundColor: Colors.blueGrey,
    actions: [
      title != UserProfile.title ? IconButton(icon: Icon(Icons.person), onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
      }) : SizedBox(),
    ],
  );
}
