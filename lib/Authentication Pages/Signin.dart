import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_net/Auth%20Services/authServices.dart';
import 'package:market_net/SharedModules/Styling.dart';
import 'package:market_net/UserScreens/Home.dart';

import 'SignUp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
          child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Image(
                image: AssetImage(
                  "assets/images/logo.png",
                ),
                width: 250,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 25),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: fieldDecoration("Email"),
                      validator: (value){
                        return value.isEmpty ? "Please enter your email" : null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        obscureText: true,
                        decoration: fieldDecoration("Password"),
                      validator: (value){
                        return value.length < 6 ? "Enter a valid password" : null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                        if(_formKey.currentState.validate())
                          {
                            var result = authServices.signinWithEmailandPassword(emailCont.text, passCont.text);
                            if(result != null)
                              {
                                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Home()));
                              }
                          }
                      },
                      color: Colors.blueGrey[400],
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.amber[200], fontSize: 16),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account ?  ",

                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
                          },
                          child: Text("Sign Up",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.amber[200]
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
