import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:market_net/Database/FetchProducts.dart';
import 'package:market_net/Models/Product.dart';
import 'package:market_net/SharedModules/AddToCartButton.dart';
import 'package:market_net/SharedModules/CustomAppBar.dart';
import 'package:market_net/UserScreens/SingleProduct.dart';

class ProductsGroup extends StatefulWidget {
  final String CatName ;
  ProductsGroup({@required this.CatName});
  @override
  _ProductsGroupState createState() => _ProductsGroupState();
}

class _ProductsGroupState extends State<ProductsGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: widget.CatName,
      ),
      body: FutureBuilder(
          future: ProductServices().fetchProductsbyCategory(widget.CatName),
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            return snapshot.hasData
                ? StaggeredGridView.countBuilder(
              shrinkWrap: true,
              crossAxisCount: 2,
              itemCount: snapshot.data.length,
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              itemBuilder: (BuildContext context, int index) {
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
                              AddToCartButton(),
                            ],
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
    );
  }
}
