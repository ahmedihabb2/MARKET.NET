import 'package:flutter/material.dart';
import 'package:market_net/Database/UserManager.dart';
import '../Models/UserModel.dart';
import 'package:market_net/SharedModules/CustomAppBar.dart';

class UserProfile extends StatefulWidget {
  // used in CustomAppBar to remove user profile icon if in
  // user profile page by checking the passed title field
  static String title = "User Profile";

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  UserData loggedInUser;

  initUser() async{
    loggedInUser = await UserData.initCurrentUser();
    setState(() {
      userName.text = loggedInUser.userName;
      address.text = loggedInUser.address;
      phoneNumber.text = loggedInUser.phoneNumber;
    });
  }

  @override
  void initState(){
    super.initState();
    initUser();
  }

  TextEditingController userName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: CustomAppBar(context, title: "${UserProfile.title}"),
      body:loggedInUser == null ? Center(
        child: CircularProgressIndicator(),
      ): SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 55.0,
                        backgroundColor: Colors.blueGrey,
                        child: Icon(
                          Icons.person,
                          size: 70.0,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        child: IconButton(
                          icon: Icon(Icons.add, color:Colors.white,),
                          onPressed: (){},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                padding: EdgeInsets.all(20.0),
                child:Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Username: ",
                          style: TextStyle(
                            color:Colors.blueGrey,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: userName,
                            decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text(
                          "Address: ",
                          style: TextStyle(
                            color:Colors.blueGrey,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: address,
                            decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text(
                          "Phone Number: ",
                          style: TextStyle(
                            color:Colors.blueGrey,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: phoneNumber,
                            decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      onPressed: (){
                        UserManager.editUser(
                          uid: loggedInUser.uid,
                          username: userName.text,
                          address: address.text,
                          phoneNumber: phoneNumber.text,
                        );
                        Navigator.pop(context);
                      },
                      color:Colors.blueGrey,
                      child: Text(
                        "Change User Data",
                        style: TextStyle(
                          color:Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
