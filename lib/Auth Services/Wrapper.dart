import 'package:flutter/material.dart';
import 'package:market_net/Authentication%20Pages/Signin.dart';
import 'package:market_net/Models/UserModel.dart';
import 'package:market_net/UserScreens/Home.dart';
import 'package:market_net/main.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    return user != null ? Home() : SignIn();
  }
}
