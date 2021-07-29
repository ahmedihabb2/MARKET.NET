import 'package:flutter/material.dart';
import 'package:market_net/AdminScreens/AddProducts.dart';
import 'package:market_net/AdminScreens/ViewPurchases.dart';
import 'package:market_net/SharedModules/CustomAppBar.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
  static final String title = "Admin Panel";
}

class _AdminPanelState extends State<AdminPanel> {
  final List<Widget> screens = [AddProducts(), ViewPurchases()];

  int selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(title: AdminPanel.title),
      body: screens[selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newScreen){
         setState(() {
           selectedScreen = newScreen;
         });
        },
        currentIndex: selectedScreen,
        selectedItemColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add Products"),
          BottomNavigationBarItem(icon: Icon(Icons.view_list), label: "View Purchases"),
        ],
      ),
    );
  }
}
