
import 'product.dart';

class Cart{

  List<Product> _cartProducts =[];


  void addToCart(Product item){

    _cartProducts.add(item);


  }
  void removeFromCart(Product item){

    _cartProducts.remove(item);

  }




}