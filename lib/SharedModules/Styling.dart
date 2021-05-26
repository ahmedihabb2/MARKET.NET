import 'package:flutter/material.dart';

 InputDecoration fieldDecoration(String hint)
 {
   return InputDecoration(
       border: new OutlineInputBorder(
         borderRadius: const BorderRadius.all(
           const Radius.circular(20.0),
         ),
       ),
       filled: true,
       hintStyle: new TextStyle(color: Colors.grey[800]),
       hintText: hint,
       fillColor: Colors.white70);
 }