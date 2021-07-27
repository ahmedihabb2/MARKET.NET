import 'package:flutter/material.dart';
import 'package:market_net/SharedModules/CustomAppBar.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: "User Profile"),
    );
  }
}
