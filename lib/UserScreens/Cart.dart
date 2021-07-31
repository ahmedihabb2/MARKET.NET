import 'package:flutter/material.dart';
import 'package:market_net/SharedModules/CustomAppBar.dart';
import 'package:market_net/SharedModules/Styling.dart';
import 'package:market_net/UserScreens/SingleProduct.dart';
import 'package:market_net/cartState.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
  static final String title = "Cart";
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Cart",),
      body: Consumer<AddToCart>(
        builder: (context , cart,child){
          return cart.productList.length >0 ?Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.productList.length,
                  itemBuilder: (context , index){
                    return Card(
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>SingleProduct(product: cart.productList[index],)
                          ));
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                        ),
                        trailing: Icon(Icons.chevron_right),
                        title: Text(cart.productList[index].name),
                        subtitle:Text("Price: "+cart.productList[index].price) ,
                      )
                    );
                  },
                ),
              ),
              Text("Total Money : ${cart.price}" , style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: RaisedButton(
                  color: Colors.blueGrey,
                  onPressed: (){},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text('Submit',style: TextStyle(color: Colors.white),),
                  ),
                ),
              )
            ],
          ) : Center(
            child: Text('No items in cart' ,
            style:TextStyle(fontSize: 20 , fontStyle: FontStyle.italic,
            color: Colors.grey,fontWeight: FontWeight.w400)
              ,),
          );
        },
      ),
    );
  }
}
