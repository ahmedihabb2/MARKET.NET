import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {

  final Color color;

  AddToCartButton({this.color});

  static void addItem(){

  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.add_shopping_cart_outlined,
          color: color,
        ),
        onPressed: (){addItem();});
  }
}
