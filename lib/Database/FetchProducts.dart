import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market_net/Models/Product.dart';

class ProductServices
{

  CollectionReference products = FirebaseFirestore.instance.collection("Products");

  Future<List<Product>> fetchProducts()
  async
  {
    QuerySnapshot snapShots = await products.get();
    List<Product> prodList=[];
    for(var doc in snapShots.docs)
      {
        prodList.add(
          Product(name: doc["productName"],
            category: doc["Category"],
            description: doc["productDescription"],
            picUrl: doc["productImage"],
            price: doc["Price"]
          )
        );
      }
    return prodList;
  }

  Future<List<Product>> fetchProductsbyCategory(String category)
  async{
    QuerySnapshot snapShots = await products.where('Category',isEqualTo: category).get();
    List<Product> prodList=[];
    for(var doc in snapShots.docs)
    {
      prodList.add(
          Product(name: doc["productName"],
              category: doc["Category"],
              description: doc["productDescription"],
              picUrl: doc["productImage"],
              price: doc["Price"],
            id: doc.id
          )
      );
    }
    return prodList;
  }
}