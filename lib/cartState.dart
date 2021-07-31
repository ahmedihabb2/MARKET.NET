import 'package:market_net/Models/Product.dart';
import 'package:flutter/material.dart';
class AddToCart extends ChangeNotifier
{
  List<Product> productList = [];
  int price=0;
  addProductCart(Product product)
  {
    productList.add(product);
    price += int.parse(product.price);
    notifyListeners();
  }
  removeProduct(Product product)
  {
    productList.remove(product);
    price -= int.parse(product.price);
    notifyListeners();
  }
}