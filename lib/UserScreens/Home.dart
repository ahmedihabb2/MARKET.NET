import 'package:flutter/material.dart';
import 'package:market_net/Database/FetchProducts.dart';
import 'package:market_net/Database/getCategories.dart';
import 'package:market_net/Models/Product.dart';
import 'package:market_net/SharedModules/AddToCartButton.dart';
import 'package:market_net/SharedModules/CustomAppBar.dart';
import 'package:market_net/UserScreens/ProductsWithSameCat.dart';
import 'package:market_net/UserScreens/SingleProduct.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:market_net/cartState.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProductServices productServices = ProductServices();
  List<bool> added;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(title: 'Products',),

      body: FutureBuilder(
          future: productServices.fetchProducts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            return snapshot.hasData
                ? StaggeredGridView.countBuilder(
              mainAxisSpacing: 2,
                    crossAxisSpacing: 3,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    itemCount: snapshot.data.length,
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    itemBuilder: (BuildContext context, int index) {
                added = List<bool>.filled(snapshot.data.length, false);
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingleProduct(
                                        product: snapshot.data[index],
                                      )));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Image(
                                image: NetworkImage(
                                  "https://st-adidas-egy.mncdn.com/content/images/thumbs/0111146_real-madrid-2021-third-jersey.jpeg",
                                ),
                                height: 200,
                              ),
                              Container(
                                color: Colors.blueGrey[200],
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(snapshot.data[index].name,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18)),
                                              Text(snapshot.data[index].price,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 16))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator());
          }),
      drawer: Drawer(
        child: FutureBuilder(
            future: CategoriesServices().getCategories(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              return snapshot.hasData
                  ? Padding(
                    padding: const EdgeInsets.fromLTRB(10, 80, 10, 0),
                    child: Column(
                        children: [
                          Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                          Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context,index)
                              {
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, 
                                    MaterialPageRoute(builder: (context)=>ProductsGroup(CatName: snapshot.data[index]))
                                    );
                                  },
                                  child: Card(
                                    margin: EdgeInsets.all(5),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(snapshot.data[index],style: TextStyle(fontSize: 16),),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                  )
                  : Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
