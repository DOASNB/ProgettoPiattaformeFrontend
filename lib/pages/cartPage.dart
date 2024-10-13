
import 'package:flutter/material.dart';
import 'package:progetto_piattaforme_frontend/entities/ProductInPurchase.dart';
import 'package:progetto_piattaforme_frontend/managers/UserManager.dart';
import 'package:progetto_piattaforme_frontend/support/Globals.dart';
import 'package:provider/provider.dart';

import '../components/mustBeLoggedInAlert.dart';
import '../managers/ShopManager.dart';
import '../entities/Product.dart';

class CartPage extends StatefulWidget {

  const CartPage({super.key});
  @override
  _CartPageState createState() => _CartPageState();

}

class _CartPageState extends State<CartPage> {

  bool isLoading = false;

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
                          title: Text(
                            "${item.product!.name!} x${item.quantity}",
                            style: const TextStyle(
                                fontSize: 25
                            ),),
                          subtitle: Text(
                            "${item.product!.price!.toStringAsFixed(2)} €",
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

                      child: Text("${shop.cartPrice().toStringAsFixed(2)} €",
                        style: const TextStyle(
                            fontSize: 30
                        ),)),

                    const Spacer(),

                    isLoading ?
                    const CircularProgressIndicator()
                        : IconButton(onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      UserManager().loggedIn ? buy(context)
                          : showDialog(context: context,
                          builder: (context) =>
                              MustBeLoggedInAlert.alert(context));
                      setState(() {
                        isLoading = false;
                      });
                    }, icon: const Icon(Icons.shopping_cart_checkout_rounded),
                      iconSize: 50, padding: const EdgeInsets.all(40),)


                  ]
              )


            ]
        ));
  }

  void buy(BuildContext context) async {
    bool successful = await context.read<ShopManager>().buyProducts();
    if (!successful) {
      showAlertError(context);
    } else {
      showAlertSuccess(context);
    }
  }

  void removeItem(BuildContext context, ProductInPurchase item) {
    context.read<ShopManager>().removeFromCart(item);
  }

  void showAlertError(BuildContext context) {
    showDialog(context: context, builder: (context) =>
        AlertDialog(
          content: const Text("Errore prodotto esaurito"),
          actions: [
            MaterialButton(onPressed: () => Navigator.pop(context),
                child: const Text("OK")),

          ],));
  }

  void showAlertSuccess(BuildContext context) {
    showDialog(context: context, builder: (context) =>
        AlertDialog(
          content: const Text("Acquisto avvenuto con successo!"),
          actions: [
            MaterialButton(onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
                child: const Text("OK")),

          ],));
  }
}
