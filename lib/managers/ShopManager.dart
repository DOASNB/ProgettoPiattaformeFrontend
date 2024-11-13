import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:progetto_piattaforme_frontend/entities/Product.dart';
import 'package:progetto_piattaforme_frontend/entities/ProductInPurchase.dart';
import 'package:progetto_piattaforme_frontend/entities/User.dart';
import 'package:progetto_piattaforme_frontend/managers/UserManager.dart';


import '../entities/Order.dart';
import '../support/constants.dart' as constants;
import '../support/Globals.dart';

class ShopManager extends ChangeNotifier {

  int currentPage=0;
  int pageSize =3;

  bool loggedIn = false;

  List<Order> _orders=[

  ];


  List<Product> _products = [];
  List<Product> _favorites =[];

  List<Product> get favorites => _favorites;
  List<ProductInPurchase> _cart = [];

  List<Product> getProducts() {
    return _products;
  }
  List<Order> get orders => _orders;
  List<ProductInPurchase> get cart => _cart;

  void addToCart(Product item){

    ProductInPurchase pip = ProductInPurchase(product: item,quantity: 1);




    if(_cart.contains(pip)){
      pip = _cart.firstWhere((e) => e.product==pip.product);
      pip.quantity = pip.quantity!+1;
    }else {
      _cart.add(pip);
    }
    notifyListeners();

  }
  void removeFromCart(ProductInPurchase pip){

    if(pip.quantity! <= 1) {
      _cart.remove(pip);
    }else{

      pip.quantity = pip.quantity!-1;
    }
    notifyListeners();
  }

  double cartPrice(){
    double sum = 0;
    for (var element in cart) { sum+=element.product!.price!*element.quantity!;}
    return sum;
  }

  
  void updateLogin(){
    loggedIn = UserManager().loggedIn;
    if(loggedIn == false) _favorites = [];
    updateShop().then((value) => notifyListeners());

  }


  Future<List<Product>> updateFavorites() async{
    if(loggedIn){
    Map<String,String> value={
      "userId":UserManager().user.id.toString()
    };

    Response response = await restManager.makeGetRequest(constants.ADDRESS_STORE_SERVER, "products/favoritesList", value);
    if(response.statusCode ==200) {
      List<dynamic> productsjson = jsonDecode(response.body);


      List<Product> products = productsjson.map((jsonItem) {
        return Product.fromJson(jsonItem as Map<String, dynamic>);
      }).toList();

      _favorites = products;


    }

  }
    return _favorites;}

  Future<List<Product>> updateShop() async{

    Response response = await restManager.makeGetRequest(constants.ADDRESS_STORE_SERVER, constants.REQUEST_PRODUCTS, {});
    List<dynamic> productsjson = jsonDecode(response.body);


    List<Product> products = productsjson.map((jsonItem)  {

      return Product.fromJson(jsonItem as Map<String, dynamic>);

    }).toList();

    _products = products;


    if(loggedIn){
      await updateFavorites();
    }



    return _products;

  }

  Future<List<Product>> updateShopPaged(int pageNumber,int pageSize) async {

    Map<String,String> params={"pageNumber":pageNumber.toString(),"pageSize":pageSize.toString()};

    Response response = await restManager.makeGetRequest(
        constants.ADDRESS_STORE_SERVER, "products/paged", params);

    if(response.statusCode!=200)return[];

    List<dynamic> productsjson = jsonDecode(response.body);


    List<Product> products = productsjson.map((jsonItem) {
      return Product.fromJson(jsonItem as Map<String, dynamic>);
    }).toList();



    _products = products;


    if (loggedIn) {
      updateFavorites();
      updateOrders();
    }


    return _products;
  }

    Future<void> removeFavorite(Product product) async{

    if(loggedIn){

      int? userId = UserManager().user.id;
      int? productId = product.id;

      Map<String,String> values ={
        "userId":userId.toString(),
        "productId":productId.toString()};

      Response response = await restManager.makePostRequest("localhost:8081", "/products/unFavorite", values);
      print(response.body);
    }

  }

  Future<void> addFavorite(Product product) async{

    if(loggedIn){

      int? userId = UserManager().user.id;
      int? productId = product.id;

      Map<String,String> values ={
        "userId":userId.toString(),
        "productId":productId.toString()};

      Uri uri = Uri.http("localhost:8081","/products/favorite",values);

      Response response = await restManager.makePostRequest("localhost:8081", "/products/favorite",values);
      print(response.body);
    }

  }

  void nextPage() async{
    currentPage++;

    List<Product> products = await updateShopPaged(currentPage, pageSize);
    if(products.isEmpty) currentPage--;
    notifyListeners();

  }
  void previousPage(){
    if(currentPage>0){
      currentPage--;
      updateShopPaged(currentPage, pageSize).then((value) => notifyListeners());
    }
  }

  Future<bool> buyProducts() async {

    if(_cart.isNotEmpty) {
      Order order = Order();
      order.buyer = UserManager().user;
      order.productsInPurchase = _cart;


      Response response = await restManager.makePostRequest(
          "localhost:8081", "orders", order.toJson());
      print(response.body);
      if (response.statusCode == 200) {
        _cart = [];
        updateOrders();
        notifyListeners();
        return true;
      }
    }
    return false;



  }


  void updateOrders() async{

    int id = UserManager().user.id!;
    Response response= await restManager.makeGetRequest("localhost:8081", "orders/$id", {});
    List<dynamic> productsjson = jsonDecode(response.body);


    _orders = productsjson.map((jsonItem) {
      return Order.fromJson(jsonItem as Map<String, dynamic>);
    }).toList();

  }

  Future<List<Product>> productSearch(String query) async{
    Map<String,String> values={
      "name":query
    };

    List<Product> productsFound =[];

    Response response = await restManager.makeGetRequest("localhost:8081", "products/search/by_name", values);
    if(response.statusCode==200){
      List<dynamic> productsjson = jsonDecode(response.body);


      productsFound = productsjson.map((jsonItem) {
        return Product.fromJson(jsonItem as Map<String, dynamic>);
      }).toList();
      notifyListeners();
      return productsFound;
    }
    return [];



  }

  Future<void> updateShopSearch(String query) async {
    _products = await productSearch(query);

  }


}