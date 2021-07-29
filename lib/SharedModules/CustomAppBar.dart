import 'package:flutter/material.dart';
import 'package:market_net/AdminScreens/AdminPanelHome.dart';
import 'package:market_net/Models/UserModel.dart';
import 'package:market_net/UserScreens/UserProfile.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{
  final String title;

  CustomAppBar({@required this.title});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isAdmin = false;

  setIsAdmin() async{
    isAdmin = await UserData.isCurrentUserAdmin();
    setState((){});
  }

  @override
  void initState() {
    super.initState();
    setIsAdmin();
  }


  Widget build(BuildContext context){
    return AppBar(
      title: Text(
        widget.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      backgroundColor: Colors.blueGrey,
      actions: [
        isAdmin && widget.title != AdminPanel.title ? IconButton(icon: Icon(Icons.admin_panel_settings), onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => (AdminPanel())));
        }) : SizedBox(),
        widget.title != UserProfile.title ? IconButton(icon: Icon(Icons.person), onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
        }) : SizedBox(),
      ],
    );
  }
}
