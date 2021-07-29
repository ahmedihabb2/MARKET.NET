import 'package:flutter/material.dart';

class AddProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Container(
           padding: EdgeInsets.all(10.0),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(5.0)),
             color: Colors.white,
           ),
           width:double.infinity,
           child: Text(
             "Add Products",
             style: TextStyle(
               color: Colors.blueGrey,
               fontWeight: FontWeight.w600,
               fontSize: 18.0,
             ),
           ),
         ),
         SizedBox(height: 10.0,),
         Container(
           padding: EdgeInsets.all(10.0),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(5.0)),
             color: Colors.white,
           ),
           child: Column(
             children: [
               TextFormField(
                 decoration: InputDecoration(
                   hintText: "Product Name",
                 ),
               ),
               SizedBox(height: 10.0,),
               TextFormField(
                 decoration: InputDecoration(
                   hintText: "Price",
                 ),
               ),
               SizedBox(height: 10.0,),
               TextFormField(
                 decoration: InputDecoration(
                   hintText: "Product Description",
                 ),
               ),
               SizedBox(height: 20.0),
               Row(
                 children: [
                   Text(
                     "Category: ",
                     style: TextStyle(
                       fontSize: 17.0,
                     ),
                   ),
                   DropdownButton(items: []),
                 ],
               ),
               SizedBox(height: 20.0),
               Row(
                 children: [
                   InkWell(
                     onTap: (){},
                     child: Text(
                       "Choose Photo",
                       style: TextStyle(
                         fontSize: 17.0,
                         color: Colors.blueGrey,
                       ),
                     ),
                   ),
                 ],
               ),
             ],
           ),
         ),
         SizedBox(height: 10.0),
         Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(5.0)),
             color: Colors.white,
           ),
           width: double.infinity,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               RaisedButton(
                 onPressed: (){},
                 child: Text(
                   "Choose Photo",
                   style: TextStyle(
                     fontSize: 17.0,
                     color: Colors.white,
                   ),
                 ),
                 color: Colors.blueGrey,
               ),
             ],
           ),
         ),
       ],
      ),
    );
  }
}
