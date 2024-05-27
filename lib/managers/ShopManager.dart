import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:progetto_piattaforme_frontend/entities/ProductInPurchase.dart';
import 'package:progetto_piattaforme_frontend/entities/product.dart';

import '../entities/Order.dart';

class ShopManager extends ChangeNotifier {

  final List<Order> _orders=[
    Order(id: 10,productInPurchase: [
      ProductInPurchase(quantity: 3
        ,product: Product(name:"Product1",price: 10,description: "desc",favorite: false)),
      ProductInPurchase(quantity: 1
          ,product: Product(name:"Product3",price: 10,description: "desc",favorite: false)),
    ])
  ];


  final List<Product> _shop =[

    Product(name:"Product1",price: 10,description: "desc",favorite: false),
    Product(name:"Product2",price: 10,description: "desc",favorite: false),
    Product(name:"Product3",price: 10,description: "desc",favorite: false),
    Product(name:"Product3",price: 10,description: "desc",favorite: false)

  ];

  final List<Product> _cart = [];

  List<Product> get shop => _shop;
  List<Order> get orders => _orders;
  List<Product> get cart => _cart;

  void addToCart(Product item){

    _cart.add(item);
    notifyListeners();

  }
  void removeFromCart(Product item){

    _cart.remove(item);
    notifyListeners();
  }

  double cartPrice(){
    double sum = 0;
    for (var element in cart) { sum+=element.price!;}
    return sum;
  }

  void addProductToShop(){
    Product prod = Product(name:"Product1",price: Random().nextDouble(),description: "desc",favorite: true);
    _shop.add(prod);
    notifyListeners();
  }


}