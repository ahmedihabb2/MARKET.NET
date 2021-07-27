import 'package:flutter/material.dart';
import 'package:market_net/SharedModules/AddToCartButton.dart';
import 'package:market_net/SharedModules/CustomAppBar.dart';

import '../Models/Product.dart';

class SingleProduct extends StatelessWidget {
  final Product product;

  SingleProduct({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: "Product - ${product.name}"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image(image: NetworkImage("https://st-adidas-egy.mncdn.com/content/images/thumbs/0111146_real-madrid-2021-third-jersey.jpeg")),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: AddToCartButton(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${product.name} - ${product.price} L.E.",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height:10.0),
                    Text(
                      "Category: ${product.category}",
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height:10.0),
                    Text(product.description),
                    SizedBox(height:10.0),
                    RaisedButton(
                      color: Colors.blueGrey,
                      onPressed: (){
                        AddToCartButton.addItem();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text(
                          "Add To Cart",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        AddToCartButton(color:Colors.white,),
                      ],),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
