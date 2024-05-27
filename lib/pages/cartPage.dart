
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../managers/ShopManager.dart';
import '../entities/product.dart';

class CartPage extends StatelessWidget {

  const CartPage({super.key});


  @override
  Widget build(BuildContext context) {
    final cart = context
        .watch<ShopManager>()
        .cart;
    final shop = context.watch<ShopManager>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrello"),
        leading: IconButton(
          icon: const Icon(Icons.backspace_outlined),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final item = cart[index];


                    return ListTile(
                      title: Text(item.name!,
                      style: const TextStyle(
                        fontSize: 25
                      ),),
                      subtitle: Text("${item.price!.toStringAsFixed(2)} €",
                      style: const TextStyle(
                        fontSize: 15
                      ),),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => removeItem(context, item),
                      ),
                    );
                  })),

          const Spacer(),


          Row(


            children: [Container(

              padding: const EdgeInsets.all(40),

              child:Text("${shop.cartPrice().toStringAsFixed(2)} €",
              style: const TextStyle(
                fontSize: 30
              ),)),

              const Spacer(),

              IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_checkout_rounded),
              iconSize: 50, padding: EdgeInsets.all(40),)


              ]
              )


      ]
    ));
  }

  void removeItem(BuildContext context, Product item) {
    context.read<ShopManager>().removeFromCart(item);
  }
}

