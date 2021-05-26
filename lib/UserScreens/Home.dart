import 'package:flutter/material.dart';
import 'package:market_net/Database/FetchProducts.dart';
import 'package:market_net/Models/Product.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProductServices productServices = ProductServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Products"),
      ),
      body: FutureBuilder(
        future: productServices.fetchProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot)
          {

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.75,
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context , index){
                return Container(
                  child: Column(
                    children: [
                      Image(image: NetworkImage("https://st-adidas-egy.mncdn.com/content/images/thumbs/0111146_real-madrid-2021-third-jersey.jpeg"
                      ),
                        height: 200,
                      ),
                      Container(
                        color: Colors.blueGrey[200],
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(snapshot.data[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                    Text(snapshot.data[index].price,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16))
                                  ],
                                ),
                              ),
                            ),
                            IconButton(icon: Icon(Icons.add_shopping_cart_outlined), onPressed: (){})
                          ],
                        ),
                      )
                    ],
                  ),
                );
                
              },
            );

          }
      ),
    );
  }
}
