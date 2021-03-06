import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:market_net/Auth%20Services/authServices.dart';
import 'package:market_net/cartState.dart';
import 'package:provider/provider.dart';

import 'Auth Services/Wrapper.dart';


void main()
async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StreamProvider.value(
    value: AuthServices().userStream,
    child: ChangeNotifierProvider(
      create: (context)=> AddToCart(),
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
        home: Wrapper(),
        ),
    ),
    ),
  );
}
