import 'package:flutter/material.dart';
import 'package:market_net/SharedModules/AddToCartButton.dart';
import 'package:market_net/SharedModules/CustomAppBar.dart';
import 'package:provider/provider.dart';

import '../Models/Product.dart';
import '../cartState.dart';

class SingleProduct extends StatefulWidget {
  final Product product;

  SingleProduct({this.product});

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Product - ${widget.product.name}"),
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
                    child:!Provider.of<AddToCart>(context).productList.contains(widget.product) ? AddToCartButton():
                    IconButton(icon:Icon(Icons.delete),onPressed: (){
                      Provider.of<AddToCart>(context, listen: false).removeProduct(widget.product);
                      setState(() {

                      });
                    },),
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
                      "${widget.product.name} - ${widget.product.price} L.E.",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height:10.0),
                    Text(
                      "Category: ${widget.product.category}",
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height:10.0),
                    Text(widget.product.description),
                    SizedBox(height:10.0),
                    !Provider.of<AddToCart>(context).productList.contains(widget.product) ?RaisedButton(
                      color: Colors.blueGrey,
                      onPressed: (){
                        AddToCartButton().addItem();
                        setState(() {

                        });
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
                        AddToCartButton(color:Colors.white,context: context,product: widget.product,),

                      ],),
                    ):
                    RaisedButton(
                      color: Colors.blueGrey[600],
                      onPressed: (){
                        Provider.of<AddToCart>(context, listen: false).removeProduct(widget.product);
                        setState(() {

                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Remove from cart",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          Icon(Icons.delete,color: Colors.white,size: 18,)
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
