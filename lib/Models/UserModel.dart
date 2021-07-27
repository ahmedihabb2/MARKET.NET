import 'package:market_net/Auth%20Services/authServices.dart';
import 'package:market_net/Database/UserManager.dart';

class UserData
{
  String uid;
  String userName;
  String email;
  String address;
  String phoneNumber;
  // level is either "admin" or "user"
  String level;

  UserData({this.uid, this.userName, this.email, this.address, this.phoneNumber, this.level});

  static Future<UserData> initCurrentUser() async{
    return await UserManager.getUser(AuthServices.getLoggedInUid());
  }

  static Future<bool> isCurrentUserAdmin() async{
    UserData currentUser = await initCurrentUser();
    return currentUser.level == 'admin';
  }
}