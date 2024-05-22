
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_piattaforme_frontend/components/my_appbar.dart';
import 'package:provider/provider.dart';

import '../entities/Shop.dart';
import '../entities/product.dart';

class CartPage extends StatelessWidget {

  const CartPage({super.key});


  @override
  Widget build(BuildContext context) {
    final cart = context
        .watch<Shop>()
        .cart;

    return Scaffold(
      appBar: AppBar(
        title: Text("Carrello"),
        leading: IconButton(
          icon: Icon(Icons.backspace_outlined),
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
                      title: Text(item.name!),
                      subtitle: Text(item.price!.toStringAsFixed(2)),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => removeItem(context, item),
                      ),
                    );
                  }))
        ]
      ),
    );
  }

  void removeItem(BuildContext context, Product item) {
    context.read<Shop>().removeFromCart(item);
  }
}

