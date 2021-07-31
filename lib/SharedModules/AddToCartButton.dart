import 'package:flutter/material.dart';
import 'package:market_net/Models/Product.dart';
import 'package:provider/provider.dart';

import '../cartState.dart';

class AddToCartButton extends StatelessWidget {

  final Color color;
  BuildContext context;
  Product product;
  AddToCartButton({this.color,this.product,this.context});

   void addItem(){
    Provider.of<AddToCart>(context, listen: false).addProductCart(product);

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
