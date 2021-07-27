import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_net/Auth%20Services/Wrapper.dart';
import 'package:market_net/Auth%20Services/authServices.dart';
import 'package:market_net/Authentication%20Pages/Signin.dart';
import 'package:market_net/Database/UploadUserData.dart';
import 'package:market_net/SharedModules/Styling.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  TextEditingController repassCont = TextEditingController();
  TextEditingController addressCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  AuthServices authServices = AuthServices();
  UploadUserData uploadUserData = UploadUserData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
             Container(
               padding: EdgeInsets.all(20),
               color: Colors.blueGrey[700],
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("MARKET.",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                   Text("NET",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.amber),)
                 ],
               )
             ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameCont,
                        decoration: fieldDecoration("Username"),
                        validator: (value){
                          return value.isEmpty ? "Please enter your name" : null;
                        },
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      TextFormField(
                        controller: emailCont,
                        decoration: fieldDecoration("Email"),
                        validator: (value){
                          return value.isEmpty ? "Please enter your email" : null;
                        },
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      TextFormField(
                        controller: passCont,
                        obscureText: true,
                        decoration: fieldDecoration("Password"),
                        validator: (value){
                          return value.length < 6 ? "Password must be at least 6 characters" : null;
                        },
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      TextFormField(
                        controller: repassCont,
                        obscureText: true,
                        decoration: fieldDecoration("Re-enter password"),
                        validator: (value){
                          return value != passCont.text ? "Password doesn't match" : null;
                        },
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      TextFormField(
                        controller: addressCont,
                        decoration: fieldDecoration("Address"),
                        validator: (value){
                          return value.isEmpty ? "Please enter your address" : null;
                        },
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      TextFormField(
                        controller: phoneCont,
                        keyboardType: TextInputType.number,
                        decoration: fieldDecoration("Phone number"),
                        validator: (value){
                          return value.length < 11 ? "Please enter a valid phone number" : null;
                        },
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RaisedButton(
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () async{
              if(_formKey.currentState.validate())
                {
                 var result = await authServices.regWithEmailandPassword(emailCont.text, passCont.text);
                 if(result !=null)
                   {
                     uploadUserData.uploadData(result.uid, nameCont.text, emailCont.text, addressCont.text, phoneCont.text);
                     Navigator.pushReplacement(context,
                         PageRouteBuilder(
                           pageBuilder: (context, animation1, animation2) =>Wrapper(),
                           transitionDuration: Duration(seconds: 0),
                         )
                     );
                   }
                 else{

                 }
                }
            },
            color: Colors.blueGrey[400],
            child: Text(
              "Sign Up",
              style: TextStyle(color: Colors.amber[200], fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account ?  ",

              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
                },
                child: Text("Sign In",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.amber[200]
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
