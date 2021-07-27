import 'package:flutter/material.dart';
import 'package:market_net/Database/FetchProducts.dart';
import 'package:market_net/Models/Product.dart';
import 'package:market_net/SharedModules/AddToCartButton.dart';
import 'package:market_net/SharedModules/CustomAppBar.dart';
import 'package:market_net/UserScreens/SingleProduct.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProductServices productServices = ProductServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Products',),
      body: FutureBuilder(
        future: productServices.fetchProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot)
          {

            return Padding(
              padding: EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.75,
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context , index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SingleProduct(product: snapshot.data[index],)));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Image(image: NetworkImage("https://st-adidas-egy.mncdn.com/content/images/thumbs/0111146_real-madrid-2021-third-jersey.jpeg",
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
                                AddToCartButton(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                  
                },
              ),
            );

          }
      ),
    );
  }
}
