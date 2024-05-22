import 'package:flutter/cupertino.dart';
import 'package:progetto_piattaforme_frontend/entities/product.dart';

class Shop extends ChangeNotifier {

  final List<Product> _shop =[

    Product(name:"Product1",price: 10,description: "desc",favorite: false),
    Product(name:"Product2",price: 10,description: "desc",favorite: false),
    Product(name:"Product3",price: 10,description: "desc",favorite: false),
    Product(name:"Product3",price: 10,description: "desc",favorite: false)

  ];

  List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addToCart(Product item){

    _cart.add(item);
    notifyListeners();

  }
  void removeFromCart(Product item){

    _cart.remove(item);
    notifyListeners();
  }




}