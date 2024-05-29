import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:progetto_piattaforme_frontend/entities/ProductInPurchase.dart';
import 'package:progetto_piattaforme_frontend/entities/Product.dart';


import '../entities/Order.dart';
import '../support/constants.dart' as constants;
import '../support/Globals.dart';

class ShopManager extends ChangeNotifier {
  
  bool loggedIn = false;

  List<Order> _orders=[

  ];


  List<Product> _products =[

  ];

  final List<Product> _cart = [];

  List<Product> get products {
    return _products;
  }
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

  
  void setLogin(bool loggedIn){
    this.loggedIn = loggedIn;
    notifyListeners();
  }
  
  
  void updateShop() async{


    dynamic productsjson = jsonDecode(await restManager.makeGetRequest(constants.ADDRESS_STORE_SERVER, constants.REQUEST_PRODUCTS, {}));


    List<Product> products = productsjson.map((jsonItem) {
      return Product.fromMap(jsonItem as Map<String, dynamic>);
    }).toList();


    _products = products;


    



  





    
  }




}